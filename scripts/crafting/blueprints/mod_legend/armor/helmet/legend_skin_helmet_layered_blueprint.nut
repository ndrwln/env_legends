this.legend_skin_helmet_layered_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.legend_skin_helmet_layered";
		this.m.Type = this.Const.Items.ItemType.Helmet;
		this.m.PreviewCraftable = this.new("scripts/items/legend_helmets/vanity/legend_helmet_nach_helm");
		this.m.Cost = 2500;
		local ingredients = [
			{
				Script = "scripts/items/misc/legend_skin_ghoul_skin_item",
				Num = 3
			},
			{
				Script = "scripts/items/legend_helmets/hood/legend_helmet_chain_hood",
				Num = 1
			},
			{
				Script = "scripts/items/legend_helmets/helm/legend_helmet_basinet",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function isQualified()
	{
		return this.blueprint.isQualified();
	}

	function onCraft( _stash )
	{
		local item = this.new("scripts/items/legend_helmets/vanity/legend_helmet_nach_helm");
		_stash.add(item);
	}

});

