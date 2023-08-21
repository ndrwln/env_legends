this.patch_bones <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.patch.bones";
		this.m.MinX = 4;
		this.m.MaxX = 6;
		this.m.MinY = 4;
		this.m.MaxY = 6;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (tile.IsEmpty)
				{
					local r = this.Math.rand(1, 100);

					if (r < 10)
					{
						tile.spawnDetail("bust_skeleton_head_0" + (this.Math.rand(0, 1) == 0 ? "1" : "3") + "_dead");
					}

					if (r < 30)
					{
						tile.spawnDetail(this.Const.BloodDecals[this.Const.BloodType.Bones][this.Math.rand(0, this.Const.BloodDecals[this.Const.BloodType.Bones].len() - 1)]);
					}

					if (r < 60)
					{
						tile.spawnDetail(this.Const.BloodDecals[this.Const.BloodType.Bones][this.Math.rand(0, this.Const.BloodDecals[this.Const.BloodType.Bones].len() - 1)]);
					}

					if (r < 80)
					{
						tile.spawnDetail(this.Const.BloodDecals[this.Const.BloodType.Bones][this.Math.rand(0, this.Const.BloodDecals[this.Const.BloodType.Bones].len() - 1)]);
					}

					tile.IsHidingEntity = false;
				}
			}
		}
	}

});

