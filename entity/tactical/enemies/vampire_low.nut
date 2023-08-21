this.vampire_low <- this.inherit("scripts/entity/tactical/enemies/vampire", {
	m = {},
	function create()
	{
		this.vampire.create();
	}

	function onInit()
	{
		this.vampire.onInit();
		this.setHitpoints(this.getHitpointsMax() * this.Math.rand(25, 65) * 0.01);
		this.getSkills().update();
	}

	function assignRandomEquipment()
	{
		this.m.Items.equip(this.new("scripts/items/weapons/ancient/khopesh"));
	}

});

