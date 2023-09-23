this.vazl_vala_inscribe_helmet <- this.inherit("scripts/skills/skill", {
	m = {
		InscriptionSuccessTime = 0,
		InscriptionSuccessCooldown = 0,
		InscriptionTryTime = 0,
		InscriptionTryCooldown = 0,
		FirstTime = true
	},
	function create()
	{
		this.m.ID = "perk.vazl_vala_inscribe_helmet";
		this.m.Name = this.Const.Strings.PerkName.vazl_ValaInscribeHelmet;
		this.m.Description = this.Const.Strings.PerkDescription.vazl_ValaInscribeHelmet;
		this.m.Icon = "ui/perks/vazl_vala_inscribe_helmet.png";
		this.m.Type = this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.VeryLast + 2;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
		this.m.IsSerialized = true;
	}

	function onSerialize( _out )
	{
		_out.writeF32(this.m.InscriptionSuccessTime);
		_out.writeU8(this.m.InscriptionSuccessCooldown);
		_out.writeF32(this.m.InscriptionTryTime);
		_out.writeU8(this.m.InscriptionTryCooldown);
		_out.writeBool(this.m.FirstTime);
	}

	function onDeserialize( _in )
	{
		this.m.InscriptionSuccessTime = _in.readF32();
		this.m.InscriptionSuccessCooldown = _in.readU8();
		this.m.InscriptionTryTime = _in.readF32();
		this.m.InscriptionTryCooldown = _in.readU8();
		this.m.FirstTime = _in.readBool();
	}

	function isHidden()
	{
		if (this.Math.ceil(this.m.InscriptionSuccessCooldown - this.getDaysSinceInscriptionSuccess()) > 0 && this.World.State.getCombatStartTime() == 0)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	function getTooltip()
	{
		local tooltip = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			}
		];
		local countdown = this.Math.ceil(this.m.InscriptionSuccessCooldown - this.getDaysSinceInscriptionSuccess());
		local valaname = this.getContainer().getActor().m.Name;

		if (countdown > 0)
		{
			tooltip.push({
				id = 6,
				type = "text",
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + countdown + "[/color] days until " + valaname + " can start inscribing another helmet"
			});
		}

		return tooltip;
	}

	function getTimeSinceInscriptionTry()
	{
		return (this.Time.getVirtualTimeF() - this.m.InscriptionTryTime) / this.World.getTime().SecondsPerDay;
	}

	function getDaysSinceInscriptionSuccess()
	{
		return (this.Time.getVirtualTimeF() - this.m.InscriptionSuccessTime) / this.World.getTime().SecondsPerDay;
	}

	function getCurrentTime()
	{
		return this.Time.getVirtualTimeF();
	}

	function onUpdate( _properties )
	{
		if (this.World.State.getCombatStartTime() != 0)
		{
			return;
		}

		if (this.getTimeSinceInscriptionTry() >= this.m.InscriptionTryCooldown && this.getDaysSinceInscriptionSuccess() >= this.m.InscriptionSuccessCooldown && this.World.Assets.getStash().hasEmptySlot() || this.m.FirstTime == true && this.World.Assets.getStash().hasEmptySlot())
		{
			local expertise = 5 + this.getContainer().getActor().getLevel() / this.Const.LevelXP.len() * 5;

			if (this.Math.rand(1, 400) <= expertise || this.m.FirstTime == true)
			{
				local brothers = this.World.getPlayerRoster().getAll();
				local person_candidates = [];
				local helmet_candidates = [];

				foreach( bro in brothers )
				{
					if (bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head) == null)
					{
						continue;
					}

					if (bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head).isRuned())
					{
						continue;
					}

					person_candidates.push(bro);
					helmet_candidates.push(bro.getItems().getItemAtSlot(this.Const.ItemSlot.Head));
				}

				if (person_candidates.len() < 1 || helmet_candidates.len() < 1)
				{
					return;
				}

				local personandhelmet = this.Math.rand(0, person_candidates.len() - 1);
				local person = person_candidates[personandhelmet];
				local helmet = helmet_candidates[personandhelmet];
				local inscriber = this.getContainer().getActor();
				helmet.setRuneVariant(this.Math.rand(11, 13));
				helmet.updateRuneSigil();
				person.getItems().unequip(helmet);
				person.getItems().equip(helmet);

				if (person.getID() == inscriber.getID())
				{
					inscriber.improveMood(0.5, "Carved a rune sigil onto their helmet");
				}
				else
				{
					inscriber.improveMood(0.5, "Carved a rune sigil onto " + person.m.Name + "\'s helmet");
					person.improveMood(1.0, "Had a rune sigil carved onto their helmet, courtesy of " + inscriber.m.Name);
				}

				this.m.InscriptionSuccessTime = this.getCurrentTime();

				if (this.getContainer().getActor().getSkills().hasSkill("perk.vazl_vala_inscription_mastery"))
				{
					this.m.InscriptionSuccessCooldown = 15;
				}
				else
				{
					this.m.InscriptionSuccessCooldown = 20;
				}

				this.m.FirstTime = false;
				this.Sound.play("sounds/legend_vala_inscribe.wav");
			}

			this.m.InscriptionTryTime = this.getCurrentTime();

			if (this.getContainer().getActor().getSkills().hasSkill("perk.vazl_vala_inscription_mastery"))
			{
				this.m.InscriptionTryCooldown = 0.18;
			}
			else
			{
				this.m.InscriptionTryCooldown = 0.25;
			}
		}
	}

});

