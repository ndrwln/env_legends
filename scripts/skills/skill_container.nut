this.skill_container <- {
	m = {
		Actor = null,
		Skills = [],
		SkillsToAdd = [],
		BusyStack = 0,
		IsUpdating = false,
		IsBusy = false
	},
	function setActor( _a )
	{
		this.m.Actor = this.WeakTableRef(_a);
	}

	function getActor()
	{
		return this.m.Actor;
	}

	function isBusy()
	{
		return this.m.BusyStack != 0;
	}

	function setBusy( _b )
	{
		if (_b)
		{
			++this.m.BusyStack;
		}
		else
		{
			--this.m.BusyStack;
		}
	}

	function add( _skill, _order = 0 )
	{
		if (!_skill.isStacking())
		{
			foreach( i, skill in this.m.Skills )
			{
				if (!skill.isGarbage() && skill.getID() == _skill.getID())
				{
					skill.onRefresh();
					return;
				}
			}

			foreach( i, skill in this.m.SkillsToAdd )
			{
				if (skill.getID() == _skill.getID())
				{
					return;
				}
			}
		}

		_skill.setContainer(this);
		_skill.setOrder(_skill.getOrder() + _order);

		if (this.m.IsUpdating)
		{
			this.m.SkillsToAdd.push(_skill);
		}
		else
		{
			this.m.Skills.push(_skill);
			_skill.onAdded();
			_skill.m.IsNew = false;
			this.m.Skills.sort(this.compareSkillsByOrder);
			this.update();
		}
	}

	function remove( _skill )
	{
		if (!this.m.IsUpdating)
		{
			this.m.IsUpdating = true;

			foreach( i, skill in this.m.Skills )
			{
				if (skill == _skill)
				{
					skill.onRemoved();
					skill.setContainer(null);
					this.m.Skills.remove(i);
					this.update();
					break;
				}
			}

			this.m.IsUpdating = false;
		}
		else
		{
			_skill.removeSelf();
		}
	}

	function removeByID( _skillID )
	{
		if (!this.m.IsUpdating)
		{
			this.m.IsUpdating = true;
			local isRemoved = false;

			foreach( i, skill in this.m.Skills )
			{
				if (skill.getID() == _skillID && !skill.isGarbage())
				{
					skill.onRemoved();
					skill.setContainer(null);
					this.m.Skills.remove(i);
					isRemoved = true;
					break;
				}
			}

			this.m.IsUpdating = false;

			if (isRemoved)
			{
				this.update();
			}
		}
		else
		{
			foreach( i, skill in this.m.Skills )
			{
				if (skill.getID() == _skillID)
				{
					skill.removeSelf();
					break;
				}
			}
		}
	}

	function removeAllByID( _skillID )
	{
		foreach( skill in this.m.Skills )
		{
			if (skill.getID() == _skillID)
			{
				skill.removeSelf();
			}
		}

		this.update();
	}

	function removeByType( _type )
	{
		foreach( i, skill in this.m.Skills )
		{
			if (skill.isType(_type))
			{
				skill.removeSelf();
			}
		}

		this.collectGarbage(true);
	}

	function collectGarbage( _performUpdate = true )
	{
		if (this.m.IsUpdating)
		{
			return;
		}

		if (this.m.Skills.len() == 0 && this.m.SkillsToAdd.len() == 0)
		{
			return;
		}

		this.m.IsUpdating = true;
		local garbage = [];

		foreach( i, skill in this.m.Skills )
		{
			if (skill.isGarbage())
			{
				garbage.push(i);
			}
		}

		_performUpdate = _performUpdate && (garbage.len() != 0 || this.m.SkillsToAdd.len() != 0);
		garbage.reverse();

		foreach( i in garbage )
		{
			this.m.Skills[i].onRemoved();
			this.m.Skills[i].setContainer(null);
			this.m.Skills.remove(i);
		}

		garbage.clear();

		if (this.m.SkillsToAdd.len() != 0)
		{
			foreach( skill in this.m.SkillsToAdd )
			{
				this.m.Skills.push(skill);
				skill.onAdded();
				skill.m.IsNew = false;
			}

			this.m.SkillsToAdd.clear();
			this.m.Skills.sort(this.compareSkillsByOrder);
		}

		this.m.IsUpdating = false;

		if (_performUpdate)
		{
			this.update();
		}
	}

	function query( _filter, _includeHidden = false, _ordered = false )
	{
		local ret = [];

		foreach( skill in this.m.Skills )
		{
			if (!skill.isGarbage() && skill.isType(_filter) && (_includeHidden || !skill.isHidden()))
			{
				ret.push(this.WeakTableRef(skill));
			}
		}

		if (_ordered)
		{
			ret.sort(this.compareSkillsByOrder);
		}

		return ret;
	}

	function queryActives()
	{
		local ret = [];

		foreach( skill in this.m.Skills )
		{
			if (!skill.isGarbage() && skill.isActive() && !skill.isHidden())
			{
				ret.push(this.WeakTableRef(skill));
			}
		}

		return ret;
	}

	function querySortedByItems( _filter, _notFilter = 0 )
	{
		local ret = [];

		for( local i = 0; i < this.Const.ItemSlot.COUNT; i = i )
		{
			ret.push([]);
			i = ++i;
		}

		foreach( skill in this.m.Skills )
		{
			if (!skill.isGarbage() && skill.isType(_filter) && !skill.isType(_notFilter) && !skill.isHidden())
			{
				if (skill.getItem() != null)
				{
					ret[skill.getItem().getCurrentSlotType()].push(this.WeakTableRef(skill));
				}
				else
				{
					ret[this.Const.ItemSlot.Free].push(this.WeakTableRef(skill));
				}
			}
		}

		if (ret[this.Const.ItemSlot.Free].len() > 1)
		{
			ret[this.Const.ItemSlot.Free].sort(this.compareSkillsByOrder);
		}

		return ret;
	}

	function querySortedByOrder( _filter )
	{
		local ret = [];

		for( local i = 0; i < this.Const.ItemSlot.COUNT; i = i )
		{
			ret.push([]);
			i = ++i;
		}

		foreach( skill in this.m.Skills )
		{
			if (!skill.isGarbage() && skill.isType(_filter) && !skill.isHidden())
			{
				ret[0].push(this.WeakTableRef(skill));
			}
		}

		ret[0].sort(this.compareSkillsByOrder);
		return ret;
	}

	function getSkillByID( _id )
	{
		foreach( i, skill in this.m.Skills )
		{
			if (!skill.isGarbage() && skill.getID() == _id)
			{
				return skill;
			}
		}

		return null;
	}

	function getAllSkillsOfType( _filter )
	{
		local ret = [];

		foreach( skill in this.m.Skills )
		{
			if (!skill.isGarbage() && skill.isType(_filter) && !skill.isHidden())
			{
				ret.push(skill);
			}
		}

		return ret;
	}

	function getSkillsSortedByItems( _filter, _notFilter = 0 )
	{
		local ret = [];

		for( local i = 0; i < this.Const.ItemSlot.COUNT; i = i )
		{
			ret.push([]);
			i = ++i;
		}

		foreach( skill in this.m.Skills )
		{
			if (!skill.isGarbage() && skill.isType(_filter) && !skill.isType(_notFilter) && !skill.isHidden())
			{
				if (skill.getItem() != null)
				{
					ret[skill.getItem().getCurrentSlotType()].push(skill);
				}
				else
				{
					ret[this.Const.ItemSlot.Free].push(skill);
				}
			}
		}

		if (ret[this.Const.ItemSlot.Free].len() > 1)
		{
			ret[this.Const.ItemSlot.Free].sort(this.compareSkillsByOrder);
		}

		return ret;
	}

	function hasSkillOfType( _filter )
	{
		foreach( skill in this.m.Skills )
		{
			if (!skill.isGarbage() && skill.isType(_filter) && !skill.isHidden())
			{
				return true;
			}
		}

		return false;
	}

	function getAllSkillsByID( _id )
	{
		local ret = [];

		foreach( skill in this.m.Skills )
		{
			if (!skill.isGarbage() && skill.getID() == _id)
			{
				ret.push(skill);
			}
		}

		return ret;
	}

	function getNumOfSkill( _id )
	{
		local num = 0;

		foreach( skill in this.m.Skills )
		{
			if (skill.getID() == _id)
			{
				num = ++num;
				num = num;
			}
		}

		return num;
	}

	function hasSkill( _skillOrID )
	{
		local id;

		if (this.isKindOf(_skillOrID, "skill"))
		{
			id = _skillOrID.getID();
		}
		else
		{
			id = _skillOrID;
		}

		foreach( i, skill in this.m.Skills )
		{
			if (!skill.isGarbage() && skill.getID() == id)
			{
				return true;
			}
		}

		return false;
	}

	function update()
	{
		if (!this.m.Actor.isAlive())
		{
			return;
		}

		if (this.m.IsUpdating)
		{
			return;
		}

		this.collectGarbage(false);
		local hp = 1.0;
		local updateHitpoints = this.m.Actor.getHitpointsMax() > 0;

		if (updateHitpoints)
		{
			hp = this.Math.minf(1.0, this.m.Actor.getHitpointsPct());
		}

		this.m.IsUpdating = true;
		local current = this.m.Actor.getBaseProperties().getClone();

		foreach( skill in this.m.Skills )
		{
			skill.onUpdate(current);
		}

		foreach( skill in this.m.Skills )
		{
			skill.onAfterUpdate(current);
		}

		this.m.Actor.setCurrentProperties(current);

		if (updateHitpoints)
		{
			this.m.Actor.setHitpointsPct(hp);
		}

		this.m.Actor.setActionPoints(this.Math.min(this.m.Actor.getActionPoints(), this.m.Actor.getActionPointsMax()));
		this.m.Actor.setFatigue(this.Math.min(this.m.Actor.getFatigue(), this.m.Actor.getFatigueMax()));
		this.m.IsUpdating = false;
		this.m.Actor.onSkillsUpdated();
		this.m.Actor.updateOverlay();
	}

	function MovementCompleted( _tile )
	{
		if (!this.m.Actor.isAlive())
		{
			return;
		}

		foreach( skill in this.m.Skills )
		{
			skill.onMovementCompleted(_tile);
		}
	}

	function buildPropertiesForUse( _caller, _targetEntity )
	{
		local superCurrent = this.m.Actor.getCurrentProperties().getClone();
		local updating = this.m.IsUpdating;
		this.m.IsUpdating = true;

		foreach( i, skill in this.m.Skills )
		{
			skill.onAnySkillUsed(_caller, _targetEntity, superCurrent);
		}

		this.m.IsUpdating = updating;
		return superCurrent;
	}

	function buildPropertiesForDefense( _attacker, _skill )
	{
		local superCurrent = this.m.Actor.getCurrentProperties().getClone();
		local updating = this.m.IsUpdating;
		this.m.IsUpdating = true;

		foreach( i, skill in this.m.Skills )
		{
			skill.onBeingAttacked(_attacker, _skill, superCurrent);
		}

		this.m.IsUpdating = updating;
		return superCurrent;
	}

	function buildPropertiesForBeingHit( _attacker, _skill, _hitInfo )
	{
		local superCurrent = this.m.Actor.getCurrentProperties().getClone();
		local updating = this.m.IsUpdating;
		this.m.IsUpdating = true;

		foreach( i, skill in this.m.Skills )
		{
			skill.onBeforeDamageReceived(_attacker, _skill, _hitInfo, superCurrent);
		}

		this.m.IsUpdating = updating;
		return superCurrent;
	}

	function getAttackOfOpportunity()
	{
		local ret;
		local ap = 999;

		foreach( i, skill in this.m.Skills )
		{
			if (!skill.isActive() || !skill.isAttack() || !skill.isTargeted() || skill.isIgnoredAsAOO() || skill.isDisabled() || !skill.isUsable())
			{
				continue;
			}

			if (skill.getMinRange() > 1 || skill.isRanged())
			{
				continue;
			}

			if (skill.getActionPointCost() <= ap)
			{
				ret = skill;
				ap = skill.getActionPointCost();
			}
		}

		return ret;
	}

	function print()
	{
		this.logDebug("##############################################");
		this.logDebug("# Showing skills of " + this.getActor().getName());

		foreach( i, skill in this.m.Skills )
		{
			local out = "# " + skill.getName() + " (";

			if (skill.isActive())
			{
				out = out + "A";
			}
			else
			{
				out = out + "P";
			}

			if (skill.isHidden())
			{
				out = out + ",H";
			}

			out = out + ")";
			this.logDebug(out);
		}

		this.logDebug("# A = Active, P = Passive, H = Hidden");
		this.logDebug("##############################################");
	}

	function addResources()
	{
		foreach( skill in this.m.Skills )
		{
			skill.addResources();
		}
	}

	function onBeforeActivation()
	{
	}

	function onTurnStart()
	{
	}

	function onResumeTurn()
	{
	}

	function onRoundEnd()
	{
	}

	function onTurnEnd()
	{
	}

	function onWaitTurn()
	{
	}

	function onNewRound()
	{
	}

	function onNewDay()
	{
	}

	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
	}

	function onBeforeTargetHit( _caller, _targetEntity, _hitInfo )
	{
	}

	function onTargetHit( _caller, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
	}

	function onTargetMissed( _caller, _targetEntity )
	{
	}

	function onTargetKilled( _targetEntity, _skill )
	{
	}

	function onMissed( _attacker, _skill )
	{
	}

	function onAfterDamageReceived()
	{
	}

	function onCombatStarted()
	{
	}

	function onCombatFinished()
	{
	}

	function onDeath( _fatalityType )
	{
	}

	function onDismiss()
	{
	}

	function compareSkillsByOrder( _skill1, _skill2 )
	{
		if (_skill1.getOrder() < _skill2.getOrder())
		{
			return -1;
		}
		else if (_skill1.getOrder() > _skill2.getOrder())
		{
			return 1;
		}
		else if (_skill1.getID() < _skill2.getID())
		{
			return -1;
		}
		else if (_skill1.getID() > _skill2.getID())
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}

	function compareSkillsByType( _skill1, _skill2 )
	{
		if (_skill1.getType() < _skill2.getType())
		{
			return -1;
		}
		else if (_skill1.getType() > _skill2.getType())
		{
			return 1;
		}

		return 0;
	}

	function onSerialize( _out )
	{
		local numSkills = 0;

		foreach( skill in this.m.Skills )
		{
			if (skill.isSerialized())
			{
				numSkills = ++numSkills;
				numSkills = numSkills;
			}
		}

		_out.writeU16(numSkills);

		foreach( skill in this.m.Skills )
		{
			if (skill.isSerialized())
			{
				_out.writeI32(skill.ClassNameHash);
				skill.onSerialize(_out);
			}
		}
	}

	function onDeserialize( _in )
	{
		this.m.IsUpdating = true;
		local numSkills = _in.readU16();

		for( local i = 0; i < numSkills; i = i )
		{
			local script = this.IO.scriptFilenameByHash(_in.readI32());

			if (script != null)
			{
				local skill = this.new(script);
				skill.onDeserialize(_in);
				this.add(skill);
			}
			else
			{
				_in.readU8();
			}

			i = ++i;
		}

		this.m.IsUpdating = false;
		this.update();
	}

};

