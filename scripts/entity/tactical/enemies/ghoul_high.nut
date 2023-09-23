this.ghoul_high <- this.inherit("scripts/entity/tactical/enemies/ghoul", {
	m = {},
	function create()
	{
		this.ghoul.create();
	}

	function onInit()
	{
		this.ghoul.onInit();
		this.grow(true);
		this.grow(true);
	}

});

