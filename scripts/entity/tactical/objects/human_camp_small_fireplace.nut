this.human_camp_small_fireplace <- this.inherit("scripts/entity/tactical/entity", {
	m = {},
	function getName()
	{
		return "Fireplace";
	}

	function getDescription()
	{
		return "A fireplace with a cauldron.";
	}

	function onInit()
	{
		local variants = [
			"10"
		];
		local body = this.addSprite("body");
		body.setBrush("camp_" + variants[this.Math.rand(0, variants.len() - 1)]);
	}

});

