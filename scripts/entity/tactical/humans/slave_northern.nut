this.slave_northern <- this.inherit("scripts/entity/tactical/humans/slave", {
	m = {},
	function create()
	{
		this.slave.create();
		this.m.Bodies = this.Const.Bodies.NorthernSlave;
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.WildMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Untidy;
		this.m.Body = this.Math.rand(0, this.m.Bodies.len() - 1);
	}

});

