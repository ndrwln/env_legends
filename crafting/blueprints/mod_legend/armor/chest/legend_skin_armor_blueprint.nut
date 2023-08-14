this.legend_skin_armor_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_skin_armor";
		this.m.Type = this.Const.Items.ItemType.Armor;
		this.m.PreviewCraftable = this.new("scripts/items/legend_armor/legendary/legend_skin_armor");
		this.m.Cost = 2500;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_skin_ghoul_skin_item",
				Num = 6
			}
		];
		ingredients.push({
			Script = "scripts/items/legend_armor/cloth/legend_gambeson",
			Num = 1,
			LegendsArmor = true
		});
		ingredients.push({
			Script = "scripts/items/legend_armor/chain/legend_armor_hauberk",
			Num = 1,
			LegendsArmor = true
		});
		this.init(ingredients);
	}

	function isQualified()
	{
		return this.blueprint.isQualified();
	}

	function onCraft( _stash )
	{
		local item;
		local item = this.Const.World.Common.pickArmor([
			[
				1,
				"legendary/legend_skin_armor"
			]
		]);
		_stash.add(item);
	}

});

