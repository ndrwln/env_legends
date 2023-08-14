this.legend_hide_and_bone_armor <- this.inherit("scripts/items/legend_armor/legend_armor_upgrade", {
	m = {},
	function create()
	{
		this.legend_armor_upgrade.create();
		this.m.Type = this.Const.Items.ArmorUpgrades.Plate;
		this.m.ID = "legend_armor.body.legend_hide_and_bone_armor";
		this.m.Name = "Hide and Bone Armor";
		this.m.Description = "Hide and bone are common materials in the northern regions. This armor is using both for decent protection.";
		this.m.ArmorDescription = "Includes hide and bone armor that is decent protection.";
		this.m.Variants = [
			92
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorBoneImpact;
		this.m.InventorySound = this.Const.Sound.ArmorLeatherImpact;
		this.m.Value = 350;
		this.m.Condition = 80;
		this.m.ConditionMax = 80;
		this.m.StaminaModifier = -11;
		this.m.ItemType = this.m.ItemType | this.Const.Items.ItemType.Cultist;
	}

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.SpriteBack = "bust_body" + "_" + variant;
		this.m.SpriteDamagedBack = "bust_body" + "_" + variant + "_damaged";
		this.m.SpriteCorpseBack = "bust_body" + "_" + variant + "_dead";
		this.m.Icon = "armor/icon_body_armor" + "_" + variant + ".png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "armor/icon_body_armor" + "_" + variant + ".png";
		this.m.OverlayIconLarge = "armor/inventory_body_armor" + "_" + variant + ".png";
	}

});

