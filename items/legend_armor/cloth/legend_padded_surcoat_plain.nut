this.legend_padded_surcoat_plain <- this.inherit("scripts/items/legend_armor/cloth/legend_padded_surcoat", {
	m = {},
	function create()
	{
		this.legend_padded_surcoat.create();
		this.m.ID = "legend_armor.body.legend_padded_surcoat_plain";
		this.m.Name = "Padded Surcoat";
		this.m.Description = "A sturdy and heavy padded coat that offers decent protection.";
		this.m.Variants = [
			40,
			65,
			66,
			67,
			68,
			69,
			70
		];
		this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.Value = 150;
		this.m.Condition = 55;
		this.m.ConditionMax = 55;
		this.m.StaminaModifier = -6;
		this.m.ItemType = this.m.ItemType;
	}

});

