this.legend_vala_chant <- this.inherit("scripts/skills/skill", {
	m = {
		Vala = null,
		Range = 1
	},
	function setVala( _v )
	{
		if (typeof _v == "instance")
		{
			this.m.Vala = _v;
		}
		else
		{
			this.m.Vala = this.WeakTableRef(_v);
		}
	}

	function create()
	{
		this.m.Name = "";
		this.m.Icon = "";
		this.m.IconMini = "";
		this.m.Overlay = "";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function isHidden()
	{
		if (!this.checkEntities())
		{
			this.updateEffect(false);
			return true;
		}

		if (!this.isInRange())
		{
			this.updateEffect(false);
			return true;
		}

		this.updateEffect(true);
		return false;
	}

	function updateEffect( _v )
	{
	}

	function isMastered()
	{
		if (this.m.Vala == null)
		{
			return false;
		}

		if (this.m.Vala.getSkills().hasSkill("perk.legend_vala_chanting_mastery"))
		{
			return true;
		}

		return false;
	}

	function checkEntities()
	{
		local actor = this.getContainer().getActor();

		if (actor == null)
		{
			return false;
		}

		if (!actor.isPlacedOnMap())
		{
			return false;
		}

		if (("State" in this.Tactical) && this.Tactical.State.isBattleEnded())
		{
			return false;
		}

		local tile = actor.getTile();

		if (tile == null)
		{
			return false;
		}

		if (this.m.Vala == null)
		{
			return false;
		}

		if (this.m.Vala.getTile() == null)
		{
			return false;
		}

		return true;
	}

	function isInRange()
	{
		if (!this.getContainer().getActor().isPlacedOnMap() || this.getContainer().getActor().getFlags().get("Devoured") == true || !this.m.Vala.isPlacedOnMap() || this.m.Vala.getFlags().get("Devoured") == true)
		{
			return false;
		}

		if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) != null)
		{
			if (this.getContainer().getActor().getTile().getDistanceTo(this.m.Vala.getTile()) <= this.m.Range)
			{
				return true;
			}
		}

		return false;
	}

	function onUpdate( _properties )
	{
		if (!this.checkEntities())
		{
			this.updateEffect(false);
			return;
		}

		if (!this.isInRange())
		{
			this.updateEffect(false);
			return;
		}

		this.updateEffect(true);
	}

	function onCombatFinished()
	{
		this.removeSelf();
	}

});

