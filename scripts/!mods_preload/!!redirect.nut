local g_modHooks = {};
local g_newHooks;
local g_exactHooks;
local g_inheritHooks;
local g_inheritAllHooks;
local g_oneTimeHooks = {};
local g_parents = {};
local g_states = {};
local g_cssFiles = [];
local g_jsFiles = [];
local g_mods = [];
local g_queue = [];
local varcall = function ( func, args )
{
	switch(args.len())
	{
	case 0:
		return func();

	case 1:
		return func(args[0]);

	case 2:
		return func(args[0], args[1]);

	case 3:
		return func(args[0], args[1], args[2]);

	case 4:
		return func(args[0], args[1], args[2], args[3]);

	case 5:
		return func(args[0], args[1], args[2], args[3], args[4]);

	case 6:
		return func(args[0], args[1], args[2], args[3], args[4], args[5]);

	case 7:
		return func(args[0], args[1], args[2], args[3], args[4], args[5], args[6]);

	case 8:
		return func(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
	}

	throw "Too many arguments: " + args.len();
};
local wrapInstance = function ( o )
{
	local wrapper = {};

	foreach( k, _v in o.getclass() )
	{
		local v = o[k];
		wrapper[k] <- typeof v == "function" ? function ( vargv, ... )
		{
			return varcall(v.bindenv(o), vargv);
		} : v;
		  // [015]  OP_CLOSE          0      7    0    0
	}

	return wrapper;
};
::mods_addHookCore <- function ( hooks, name, func )
{
	if (!(name in hooks))
	{
		hooks[name] <- [];
	}

	if (func)
	{
		hooks[name].append(func);
	}
};
::mods_addHook <- function ( name, func = null )
{
	::mods_addHookCore(g_modHooks, name, func);
};
::mods_callHookCore <- function ( hooks, name, args )
{
	if (hooks != null && name in hooks)
	{
		local funcs = hooks[name];

		for( local i = 0; i < funcs.len();  )
		{
			local func = funcs[i];
			local result = varcall(func, args);

			if (result != null)
			{
				return result;
			}

			if (i < funcs.len() && funcs[i] == func)
			{
				i = ++i;
			}
		}
	}

	return null;
};
::mods_callHook <- function ( name, vargv, ... )
{
	return ::mods_callHookCore(g_modHooks, name, vargv);
};
::mods_removeHookCore <- function ( hooks, name, func )
{
	if (name in hooks)
	{
		local funcs = hooks[name];
		local index = funcs.find(func);

		if (index != null)
		{
			funcs.remove(index);
		}
	}
};
::mods_removeHook <- function ( name, func )
{
	::mods_removeHookCore(g_modHooks, name, func);
};
::mods_hookNewObject <- function ( name, func, once = false )
{
	if (g_newHooks == null)
	{
		g_newHooks = {};
		::mods_addHook("new", function ( n, o )
		{
			return ::mods_callHookCore(g_newHooks, n, [
				o
			]);
		});
	}

	local scriptName = "scripts/" + name;
	local hook = func;

	if (once)
	{
		hook = function ( o )
		{
			o = func(o);
			::mods_removeHookCore(g_newHooks, scriptName, hook);

			if (!(scriptName in g_oneTimeHooks))
			{
				g_oneTimeHooks[scriptName] <- [];
			}

			g_oneTimeHooks[scriptName].append(hook);
			return o;
		};
	}

	::mods_addHookCore(g_newHooks, scriptName, hook);
};
::mods_hookNewObjectOnce <- function ( name, func )
{
	::mods_hookNewObject(name, func, true);
};
::mods_hookClass <- function ( name, func, abstract = false, childrenOnly = true )
{
	if (!abstract)
	{
		::mods_hookNewObject(name, func);
	}

	local hooks = childrenOnly ? g_inheritHooks : g_inheritAllHooks;

	if (hooks == null)
	{
		if (childrenOnly)
		{
			g_inheritHooks = {};
			hooks = {};
		}
		else
		{
			g_inheritAllHooks = {};
			hooks = {};
		}
	}

	::mods_addHookCore(hooks, "scripts/" + name, func);
};
::mods_hookBaseClass <- function ( name, func )
{
	::mods_hookClass(name, func, true);
};
::mods_hookExactClass <- function ( name, func )
{
	if (g_exactHooks == null)
	{
		g_exactHooks = {};
	}

	::mods_addHookCore(g_exactHooks, "scripts/" + name, func);
};
::mods_hookChildren <- function ( name, func )
{
	::mods_hookBaseClass(name, func);
};
::mods_hookDescendants <- function ( name, func )
{
	::mods_hookClass(name, func, true, false);
};
::mods_addField <- function ( obj, className, fieldName, value )
{
	::mods_getClassForOverride(obj, className).m[fieldName] <- value;
};
::mods_addMember <- function ( obj, className, memberName, value )
{
	::mods_getClassForOverride(obj, className)[memberName] <- value;
};
::mods_getClassForOverride <- function ( obj, className )
{
	return className ? ::mods_isClass(obj, className) || obj : obj;
};
::mods_getField <- function ( obj, fieldName )
{
	while (true)
	{
		if (("m" in obj) && fieldName in obj.m)
		{
			return obj.m[fieldName];
		}
		else
		{
			obj = obj[obj.SuperName];
		}
	}
};
::mods_getMember <- function ( obj, key )
{
	while (true)
	{
		if (key in obj)
		{
			return obj[key];
		}
		else
		{
			obj = obj[obj.SuperName];
		}
	}
};
::mods_isClass <- function ( obj, className )
{
	if (("ClassName" in obj) && obj.ClassName == className)
	{
		return obj;
	}
	else
	{
		for( local o = obj; "SuperName" in o;  )
		{
			local baseName = o.SuperName;
			o = o[baseName];

			if (baseName == className)
			{
				return o;
			}
		}

		return null;
	}
};
::mods_override <- function ( obj, key, value )
{
	while (true)
	{
		if (key in obj)
		{
			obj[key] = value;
			break;
		}
		else
		{
			obj = obj[obj.SuperName];
		}
	}
};
::mods_overrideField <- function ( obj, fieldName, value )
{
	while (true)
	{
		if (("m" in obj) && fieldName in obj.m)
		{
			obj.m[fieldName] = value;
			break;
		}
		else
		{
			obj = obj[obj.SuperName];
		}
	}
};
this.logInfo("mod_hooks: Redirecting core functions");
local replace = function ( str, sub, rep )
{
	local s;
	local i;

	for( i = 0; i < str.len(); i = e + sub.len() )
	{
		local e = str.find(sub, i);

		if (e == null)
		{
			break;
		}

		if (s == null)
		{
			s = "";
		}

		s = s + (str.slice(i, e) + rep);
	}

	if (s == null)
	{
		return str;
	}

	return s + str.slice(i);
};
local inheritFunc = this.inherit;
this.inherit = function ( baseScript, newMembers )
{
	local currentScript = this.getstackinfos(2).src.slice(0, -4);
	currentScript = replace(currentScript, "\\", "/");
	local i = -8;
	local j;
	j = currentScript.find("scripts/", i + 8);

	while (j != null)
	{
		i = j;
	}

	if (i > 0)
	{
		currentScript = currentScript.slice(i);
	}

	g_parents[currentScript] <- baseScript;
	local c = inheritFunc(baseScript, newMembers);
	return ::mods_callHook("inherit", baseScript, currentScript, c) || c;
};
local newFunc = this.new;
this.new = function ( scriptName )
{
	local o = newFunc(scriptName);
	return ::mods_callHook("new", scriptName, o) || o;
};
local wrapSpawnFunc = function ( func )
{
	return function ( scriptName, vargv, ... )
	{
		local args = [
			scriptName
		];
		args.extend(vargv);
		local o = varcall(func, args);
		return ::mods_callHook("new", scriptName, o) || o;
	};
};
this.Tactical.spawnEntity = wrapSpawnFunc(this.Tactical.spawnEntity);
this.World.spawnEntity = wrapSpawnFunc(this.World.spawnEntity);
this.World.spawnLocation = wrapSpawnFunc(this.World.spawnLocation);
local getPlayerEntityFunc = this.World.getPlayerEntity;
local lastPlayer;
this.World.getPlayerEntity = function ()
{
	local o = getPlayerEntityFunc();

	if (o != (lastPlayer != null ? lastPlayer.ref() : null))
	{
		lastPlayer = o != null ? o.weakref() : null;
		o = ::mods_callHook("new", "scripts/entity/world/player_party", o) || o;
	}

	return o;
};
local wrapRoster = function ( roster )
{
	local wrapper = typeof roster == "instance" ? wrapInstance(roster) : roster;
	local createFunc = wrapper.create;
	wrapper.create = function ( scriptName )
	{
		local o = createFunc(scriptName);
		return ::mods_callHook("new", scriptName, o) || o;
	};
	return wrapper;
};
local wrapRosterFunc = function ( func )
{
	local lastRoster;
	local wrapper;
	return function ()
	{
		local roster = func();

		if (roster != (lastRoster != null ? lastRoster.ref() : null))
		{
			lastRoster = roster.weakref();
			wrapper = wrapRoster(roster);
		}

		return wrapper;
	};
};
local wrapRosterFunc1 = function ( func )
{
	local lastRoster = {};
	local wrapper = {};
	return function ( id )
	{
		local roster = func(id);

		if (roster != (id in roster ? lastRoster[id] : null))
		{
			lastRoster[id] <- roster.weakref();
			wrapper[id] <- wrapRoster(roster);
		}

		return wrapper[id];
	};
};
this.Tactical.getCasualtyRoster = wrapRosterFunc(this.Tactical.getCasualtyRoster);
this.World.getGuestRoster = wrapRosterFunc(this.World.getGuestRoster);
this.World.getPlayerRoster = wrapRosterFunc(this.World.getPlayerRoster);
this.World.getTemporaryRoster = wrapRosterFunc(this.World.getTemporaryRoster);
this.World.getRoster = wrapRosterFunc1(this.World.getRoster);
local callClassHooks;
callClassHooks = function ( baseName, scriptName, obj )
{
	if (scriptName in g_parents)
	{
		local parentScript = g_parents[scriptName];
		::mods_callHookCore(g_inheritAllHooks, parentScript, [
			callClassHooks(null, parentScript, obj)
		]);
	}

	if (baseName)
	{
		obj = ::mods_callHookCore(g_inheritHooks, baseName, [
			obj
		]) || obj;
		obj = ::mods_callHookCore(g_exactHooks, scriptName, [
			obj
		]);
	}

	return obj;
};
::mods_addHook("inherit", callClassHooks);
::mods_addHook("beforeCampaignLoad", function ()
{
	foreach( k, L in g_oneTimeHooks )
	{
		foreach( h in L )
		{
			::mods_addHookCore(g_newHooks, k, h);
		}
	}

	g_oneTimeHooks = {};
});
::mods_addHook("root_state.onInit", function ( r )
{
	local addFunc = r.add;
	r.add = function ( name, scriptName )
	{
		local old = name in g_states ? g_states[name] : null;
		local o = addFunc(name, scriptName);

		if (o != old)
		{
			if (scriptName == "scripts/states/world_state")
			{
				::mods_callHook("beforeCampaignLoad");
			}

			g_states[name] <- o != null ? o.weakref() : null;
			o = ::mods_callHook("new", scriptName, o) || o;
		}

		return o;
	};
});
::mods_hookNewObjectOnce("states/world_state", function ( o )
{
	local loadCampaign = o.loadCampaign;
	o.loadCampaign = function ( fileName )
	{
		if (this.Time.getRealTimeF() - this.m.CampaignLoadTime >= 4.0)
		{
			loadCampaign(fileName);
			::mods_callHook("onCampaignLoaded", this);
		}
	};
});
::mods_addHook("onCampaignLoaded", function ( worldState )
{
	foreach( e in this.World.getAllEntitiesAtPos(worldState.getPlayer().getPos(), 1000000000.0) )
	{
		if (e.ClassName == "party" || e.ClassName == "player_party")
		{
			::mods_callHook("new", "scripts/entity/world/" + e.ClassName, e);
		}
	}

	foreach( loc in this.World.EntityManager.getSettlements() )
	{
		local roster = this.World.getRoster(loc.getID());

		if (roster != null)
		{
			foreach( e in roster.getAll() )
			{
				::mods_callHook("new", "scripts/entity/tactical/" + e.ClassName, e);
			}
		}
	}

	foreach( e in this.World.getPlayerRoster().getAll() )
	{
		::mods_callHook("new", "scripts/entity/tactical/" + e.ClassName, e);
	}
});
::mods_hookNewObjectOnce("ui/screens/menu/main_menu_screen", function ( o )
{
	o.getRegisteredCSSHooks <- function ()
	{
		local files = g_cssFiles;
		g_cssFiles = [];
		return files;
	};
	o.getRegisteredJSHooks <- function ()
	{
		local files = g_jsFiles;
		g_jsFiles = [];
		return files;
	};
});
::mods_registerCSS <- function ( path )
{
	g_cssFiles.append("mods/" + path);
};
::mods_registerJS <- function ( path )
{
	g_jsFiles.append("mods/" + path);
};
::mods_getRegisteredMod <- function ( codeName )
{
	for( local i = 0; i < g_mods.len(); i = ++i )
	{
		if (g_mods[i].Name == codeName)
		{
			return clone g_mods[i];
		}
	}

	return null;
};
::mods_getRegisteredMods <- function ()
{
	return clone g_mods;
};
local g_nameRe = this.regexp("^\\w+$");
local g_lastRegistered;
::mods_registerMod <- function ( codeName, version, friendlyName = null, extra = null )
{
	if (!g_nameRe.match(codeName))
	{
		throw "Mod \'" + codeName + "\' is using an illegal code name. Code names must be composed of letters, numbers, and underscores only.";
	}

	if (typeof version != "integer" && typeof version != "float")
	{
		throw "Mod " + codeName + " is not using a numeric version. Mods must use nonnegative numeric versions.";
	}

	if (version < 0)
	{
		throw "Mod " + codeName + " is using a negative version. Versions must be nonnegative.";
	}

	local m = extra ? clone extra : {};
	m.Name <- codeName;
	m.Version <- version;
	m.FriendlyName <- friendlyName ? friendlyName : codeName;
	g_mods.append(m);
	this.logInfo("mod_hooks: " + codeName + (m.FriendlyName != codeName ? " (" + friendlyName + ")" : "") + " version " + version + " registered.");
	g_lastRegistered = codeName;
};
local g_exprRe = this.regexp("^([!<>])?(\\w+)(?:\\(([<>]=?|=|!=)?(\\d+(?:\\.\\d*)?|\\.\\d+)\\))?$");
::mods_queue <- function ( codeName, expr, func )
{
	if (codeName == null)
	{
		codeName = g_lastRegistered;
	}

	if (::mods_getRegisteredMod(codeName) == null)
	{
		throw "Mod " + codeName + " not registered.";
	}

	if (expr == null || expr == "")
	{
		expr = [];
	}
	else
	{
		local match = function ( s, m, i )
		{
			return m[i].end > 0 && m[i].begin < s.len() ? s.slice(m[i].begin, m[i].end) : null;
		};
		expr = this.split(expr, ",");

		for( local i = 0; i < expr.len(); i = ++i )
		{
			local e = this.strip(expr[i]);
			local m = g_exprRe.capture(e);

			if (m == null)
			{
				throw "Invalid queue expression \'" + e + "\'.";
			}

			expr[i] = {
				op = m[1].end != 0 ? e[0] : null,
				modName = match(e, m, 2),
				verOp = match(e, m, 3),
				version = match(e, m, 4)
			};

			if (expr[i].version != null)
			{
				expr[i].version = expr[i].version.tofloat();

				if (expr[i].op != null && expr[i].op != 33)
				{
					throw "Invalid queue expression \'" + e + "\'. Ordering operators cannot be combined with version numbers.";
				}
			}
		}
	}

	local id = "";
	local alphabet = "0123456789abcdefghijklmnopqrstuvwxyz";

	for( local i = 0; i < 16; i++ )
	{
		local idx = ::rng.next(alphabet.len());
		id = id + alphabet.slice(idx - 1, idx);
	}

	g_queue.append({
		id = id,
		modName = codeName,
		expr = expr,
		func = func
	});
};
::_mods_runQueue <- function ()
{
	local invertOp = function ( o )
	{
		return o == "<" ? ">=" : o == ">" ? "<=" : o == "<=" ? ">" : o == ">=" ? "<" : o == "!=" ? "=" : "!=";
	};
	local matchVersion = function ( m, e )
	{
		local mv = m.Version;
		local op = e.verOp;
		local v = e.version;

		if (v == null)
		{
			return true;
		}

		return op == "<=" ? mv <= v : op == ">=" ? mv >= v : op == "<" ? mv < v : op == ">" ? mv > v : op == "!=" ? mv != v : mv == v;
	};
	local modName = function ( m )
	{
		if (typeof m == "string")
		{
			local n = m;
			m = ::mods_getRegisteredMod(n);

			if (m == null)
			{
				return n;
			}
		}

		return m.Name + (m.Name != m.FriendlyName ? " (" + m.FriendlyName + ")" : "");
	};
	local deps = {};
	local mods = {};
	local errors = [];

	foreach( q in g_queue )
	{
		foreach( e in q.expr )
		{
			if (e.op == 33)
			{
				local mod = ::mods_getRegisteredMod(e.modName);

				if (mod != null && matchVersion(mod, e))
				{
					local vmsg = e.version != null ? " version " + mod.Version + " (requires version " + invertOp(e.verOp) + " " + e.version + ")" : "";
					errors.append("Mod " + q.modName + " is incompatible with " + modName(mod) + vmsg + ".");
				}
			}
			else
			{
				local before = e.modName;
				local after = q.modName;

				if (e.op == 60)
				{
					before = after;
					after = e.modName;
				}
				else if (e.op == null)
				{
					local mod = ::mods_getRegisteredMod(before);

					if (mod == null || !matchVersion(mod, e))
					{
						local vmsg = e.version != null ? " with version " + (e.verOp != null ? e.verOp : "") + " " + e.version : "";
						errors.append("Mod " + modName(q.modName) + " requires mod " + modName(mod || before) + vmsg + ", but " + (mod == null ? "it was not found" : "version " + mod.Version + " was found") + ".");
					}
				}

				if (!(after in deps))
				{
					deps[after] <- [];
				}

				deps[after].append(before);
			}
		}

		if (!(q.modName in mods))
		{
			mods[q.modName] <- [];
		}

		mods[q.modName].append(q);
	}

	if (errors.len() != 0)
	{
		local msg = errors[0];

		for( local i = 1; i < errors.len(); i = ++i )
		{
			msg = msg + " " + errors[i];
		}

		throw msg;
	}

	local sets = [];
	local heights = {};
	local visit;
	visit = function ( q, chain )
	{
		chain.push(q.modName);
		local height;

		if (q.id in heights)
		{
			height = heights[q.id];

			if (height == 0)
			{
				local modList = "";

				for( local i = 0; i < chain.len(); i = ++i )
				{
					modList = i == 0 ? chain[i] : modList + " -> " + chain[i];
				}

				throw "Dependency conflict involving mod(s) " + modList + ".";
			}
		}
		else
		{
			heights[q.id] <- 0;
			height = 0;

			if (q.modName in deps)
			{
				foreach( dep in deps[q.modName] )
				{
					if (dep in mods)
					{
						foreach( depq in mods[dep] )
						{
							height = this.Math.max(height, visit(depq, chain));
						}
					}
				}
			}

			if (height == sets.len())
			{
				sets.append([]);
			}

			sets[height].append([
				q.modName,
				q.func
			]);
			height = ++height;
			heights[q.id] = height;
		}

		chain.pop();
		return height;
	};

	foreach( q in g_queue )
	{
		visit(q, []);
	}

	foreach( set in sets )
	{
		foreach( f in set )
		{
			this.logInfo("mod_hooks: Executing queued script for " + modName(f[0]) + ".");
			f[1]();
		}
	}

	g_queue = [];
};
::rng_new <- function ( seed = 0 )
{
	if (seed == 0)
	{
		seed = (this.Time.getRealTimeF() * 1000000000).tointeger();
	}

	return {
		x = seed,
		y = 234567891,
		z = 345678912,
		w = 456789123,
		c = 0,
		function nextInt()
		{
			this.x += 1411392427;
			this.y = this.y ^ this.y << 5;
			this.y = this.y ^ this.y << 7;
			this.y = this.y ^ this.y << 22;
			local t = this.z + this.w + this.c;
			this.z = this.w;
			this.c = t << 31;
			this.w = t & 2147483647;
			return this.x + this.y + this.w & 2147483647;
		}

		function nextFloat()
		{
			return this.nextInt() / 2147483648.0;
		}

		function next( a, b = null )
		{
			if (b == null)
			{
				if (a <= 0)
				{
					throw "a must be > 0";
				}

				return this.nextInt() % a + 1;
			}
			else
			{
				if (a > b)
				{
					throw "a must be <= than b";
				}

				return this.nextInt() % (b - a + 1) + a;
			}
		}

	};
};
::rng <- ::rng_new();
::mods_registerMod("mod_hooks", 21.1, "modding script hooks");

