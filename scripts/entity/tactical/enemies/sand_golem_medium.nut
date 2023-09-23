this.sand_golem_medium <- this.inherit("scripts/entity/tactical/enemies/sand_golem", {
	m = {},
	function create()
	{
		this.sand_golem.create();
	}

	function onInit()
	{
		this.sand_golem.onInit();
		this.grow(true);
	}

});

