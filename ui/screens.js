/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2016
 * 
 *  @Author:		Overhype Studios
 *  @Date:			06.04.2016
 *  @Description:	Global UI Screens
 */
"use strict";

var Screens = {};

function registerScreen(_name, _instance)
{
	Screens[_name] = _instance;
	engine.call("registerScreen", _name);
}

engine.on('callFromSQ', function (_instanceName, _moduleName, _methodName, _args)
{
	if(_instanceName in Screens)
	{
		var target = Screens[_instanceName];

		if (_moduleName != null && _moduleName != "")
		{
			if (target.getModule(_moduleName) != null)
				target = target.getModule(_moduleName);
			else
			{
				console.error("Attempted to call unknown module '" + _moduleName + "' of '" + _instanceName + "'.");
				return;
			}
		}

		target[_methodName](_args);
	}
	else
	{
		console.error("Attempted to call unknown instance '" + _instanceName + "'.");
	}
});

engine.on('callFromSQNoArgs', function (_instanceName, _moduleName, _methodName)
{
	if (_instanceName in Screens)
	{
		var target = Screens[_instanceName];

		if (_moduleName != null && _moduleName != "")
		{
			if (target.getModule(_moduleName) != null)
				target = target.getModule(_moduleName);
			else
			{
				console.error("Attempted to call unknown module '" + _moduleName + "' of '" + _instanceName + "'.");
				return;
			}
		}

		target[_methodName]();
	}
});

engine.on('preloadImage', function (_url)
{
	var img = new Image();
	img.src = "coui://" + _url;
});

engine.on('setUIScale', function (_scale)
{
	var s = _scale;
	$('html').css('zoom', s);
	$('body').css('zoom', s);
});


function registerScreens()
{
	registerScreen("RootScreen", new RootScreen());
	registerScreen("ConsoleScreen", new ConsoleScreen());
	registerScreen("LoadingScreen", new LoadingScreen());
	registerScreen("TooltipScreen", new TooltipScreen());
	registerScreen("DialogScreen", new DialogScreen());
	registerScreen("TacticalScreen", new TacticalScreen());
	registerScreen("TacticalCombatResultScreen", new TacticalCombatResultScreen());
	registerScreen("TacticalDialogScreen", new TacticalDialogScreen());
	registerScreen("WorldScreen", new WorldScreen());
	registerScreen("WorldTownScreen", new WorldTownScreen());
	registerScreen("WorldGameFinishScreen", new WorldGameFinishScreen());
	registerScreen("WorldEventPopupScreen", new WorldEventPopupScreen());
	registerScreen("WorldEventScreen", new WorldEventScreen());
	registerScreen("WorldCombatDialog", new WorldCombatDialog());
	registerScreen("WorldRelationsScreen", new WorldRelationsScreen());
	registerScreen("WorldObituaryScreen", new WorldObituaryScreen());
	registerScreen("WorldCampfireScreen", new WorldCampfireScreen());
	registerScreen("MainMenuScreen", new MainMenuScreen());
	registerScreen("WorldMenuScreen", new IngameMenuScreen());
	registerScreen("TacticalMenuScreen", new IngameMenuScreen());
	registerScreen("WorldCharacterScreen", new CharacterScreen(false));
	registerScreen("TacticalCharacterScreen", new CharacterScreen(true));

	Screens["Tooltip"] = Screens["TooltipScreen"];

	engine.call("registrationFinished");
}

function openURL(_url)
{
	engine.call("openURL", _url);
}


//////////////////////////////////////////////////
// JS -> SQ handler

var ScriptInterface = function ()
{
};

ScriptInterface.prototype.call = function (_scriptHandle, _method, _args, _callback)
{
	if (_scriptHandle == undefined || _scriptHandle == null)
	{
		console.error("Undefined Script Handle! Method called: " + _method);
		console.trace();
		return;
	}

	if (_callback != undefined)
	{
		if (_args != undefined && _args != null)
			engine.call("callSQ", _scriptHandle, _method, _args).then(function (_ret) { _callback(_ret); });
		else
			engine.call("callSQ", _scriptHandle, _method).then(function (_ret) { _callback(_ret); });
	}
	else
	{
		if (_args != undefined && _args != null)
			engine.call("asyncCallSQ", _scriptHandle, _method, _args);
		else
			engine.call("asyncCallSQ", _scriptHandle, _method);
	}
};

var SQ = new ScriptInterface();