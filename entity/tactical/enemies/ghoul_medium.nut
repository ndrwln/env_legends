this.ghoul_medium <- this.inherit("scripts/entity/tactical/enemies/ghoul", {
	m = {},
	function create()
	{
		this.ghoul.create();
	}

	function onInit()
	{
		this.ghoul.onInit();
		this.grow(true);
	}

});

