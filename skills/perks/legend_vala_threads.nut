this.legend_vala_threads <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.legend_vala_threads";
		this.m.Name = "";
		this.m.Description = "";
		this.m.Icon = "ui/perks/legend_vala_threads.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.VeryLast;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_targetEntity.isAlive())
		{
			return;
		}

		if (this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getID() != "weapon.legend_staff_vala")
		{
			return true;
		}

		local expertise = this.getContainer().getActor().getBravery();

		if (expertise < 5)
		{
			expertise = 5;
		}

		if (expertise > 95)
		{
			expertise = 95;
		}

		if (this.Math.rand(1, 100) <= expertise)
		{
			_targetEntity.getSkills().add(this.new("scripts/skills/effects/legend_vala_threads_effect"));
			this.Sound.play("sounds/combat/legend_vala_threads.wav");
		}
	}

});

