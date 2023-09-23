local gt = this.getroottable();

if (!("Tactical" in gt.Const))
{
	gt.Const.Tactical <- {};
}

gt.Const.Tactical.AttackEffectLash <- [
	{
		Brush = "effect_lash_N",
		Movement0 = this.createVec(-400, 0),
		Movement1 = this.createVec(-400, 0),
		Offset = this.createVec(100, 0)
	},
	{
		Brush = "effect_lash_NE",
		Movement0 = this.createVec(-200, 200),
		Movement1 = this.createVec(-200, 200),
		Offset = this.createVec(50, -90)
	},
	{
		Brush = "effect_lash_SE",
		Movement0 = this.createVec(100, 200),
		Movement1 = this.createVec(100, 200),
		Offset = this.createVec(-75, -50)
	},
	{
		Brush = "effect_lash_S",
		Movement0 = this.createVec(400, -100),
		Movement1 = this.createVec(400, -100),
		Offset = this.createVec(-150, 10)
	},
	{
		Brush = "effect_lash_SW",
		Movement0 = this.createVec(-100, -200),
		Movement1 = this.createVec(-100, -200),
		Offset = this.createVec(0, 100)
	},
	{
		Brush = "effect_lash_NW",
		Movement0 = this.createVec(-200, -100),
		Movement1 = this.createVec(-200, -100),
		Offset = this.createVec(50, 50)
	}
];
gt.Const.Tactical.AttackEffectSlash <- [
	{
		Brush = "effect_slash_left",
		Movement0 = this.createVec(-200, -100),
		Movement1 = this.createVec(-200, -100),
		Offset = this.createVec(0, 0)
	},
	{
		Brush = "effect_slash_right",
		Movement0 = this.createVec(-200, 100),
		Movement1 = this.createVec(-200, 100),
		Offset = this.createVec(0, -30)
	},
	{
		Brush = "effect_slash_left",
		Movement0 = this.createVec(-200, -100),
		Movement1 = this.createVec(-200, -100),
		Offset = this.createVec(0, 0)
	},
	{
		Brush = "effect_slash_left",
		Movement0 = this.createVec(-200, -100),
		Movement1 = this.createVec(-200, -100),
		Offset = this.createVec(0, 0)
	},
	{
		Brush = "effect_slash_right",
		Movement0 = this.createVec(-200, 100),
		Movement1 = this.createVec(-200, 100),
		Offset = this.createVec(0, -30)
	},
	{
		Brush = "effect_slash_left",
		Movement0 = this.createVec(-200, -100),
		Movement1 = this.createVec(-200, -100),
		Offset = this.createVec(0, 0)
	}
];
gt.Const.Tactical.AttackEffectThrust <- [
	{
		Brush = ""
	},
	{
		Brush = "effect_thrust_NE",
		Movement0 = this.createVec(120, 90),
		Movement1 = this.createVec(-120, -90),
		Offset = this.createVec(-100, -40)
	},
	{
		Brush = "effect_thrust_SE",
		Movement0 = this.createVec(120, -90),
		Movement1 = this.createVec(-120, 90),
		Offset = this.createVec(-100, 10)
	},
	{
		Brush = ""
	},
	{
		Brush = "effect_thrust_SW",
		Movement0 = this.createVec(-120, -90),
		Movement1 = this.createVec(120, 90),
		Offset = this.createVec(20, 10)
	},
	{
		Brush = "effect_thrust_NW",
		Movement0 = this.createVec(-120, 90),
		Movement1 = this.createVec(120, -90),
		Offset = this.createVec(20, -40)
	}
];
gt.Const.Tactical.AttackEffectImpale <- [
	{
		Brush = "effect_impale_N",
		Movement0 = this.createVec(0, 100),
		Movement1 = this.createVec(0, -100),
		Offset = this.createVec(-40, -30)
	},
	{
		Brush = "effect_impale_NE",
		Movement0 = this.createVec(120, 90),
		Movement1 = this.createVec(-120, -90),
		Offset = this.createVec(-110, -50)
	},
	{
		Brush = "effect_impale_SE",
		Movement0 = this.createVec(120, -80),
		Movement1 = this.createVec(-120, 80),
		Offset = this.createVec(-120, 30)
	},
	{
		Brush = "effect_impale_S",
		Movement0 = this.createVec(0, -100),
		Movement1 = this.createVec(0, 100),
		Offset = this.createVec(-40, 60)
	},
	{
		Brush = "effect_impale_SW",
		Movement0 = this.createVec(-120, -80),
		Movement1 = this.createVec(120, 80),
		Offset = this.createVec(50, 30)
	},
	{
		Brush = "effect_impale_NW",
		Movement0 = this.createVec(-120, 90),
		Movement1 = this.createVec(120, -90),
		Offset = this.createVec(20, -40)
	}
];
gt.Const.Tactical.AttackEffectThresh <- [
	{
		Brush = "effect_thresh",
		Movement0 = this.createVec(0, 0),
		Movement1 = this.createVec(0, 0),
		Offset = this.createVec(0, 0)
	},
	{
		Brush = "effect_thresh",
		Movement0 = this.createVec(0, 0),
		Movement1 = this.createVec(0, 0),
		Offset = this.createVec(0, 0)
	},
	{
		Brush = "effect_thresh",
		Movement0 = this.createVec(0, 0),
		Movement1 = this.createVec(0, 0),
		Offset = this.createVec(0, 0)
	},
	{
		Brush = "effect_thresh",
		Movement0 = this.createVec(0, 0),
		Movement1 = this.createVec(0, 0),
		Offset = this.createVec(0, 0)
	},
	{
		Brush = "effect_thresh",
		Movement0 = this.createVec(0, 0),
		Movement1 = this.createVec(0, 0),
		Offset = this.createVec(0, 0)
	},
	{
		Brush = "effect_thresh",
		Movement0 = this.createVec(0, 0),
		Movement1 = this.createVec(0, 0),
		Offset = this.createVec(0, 0)
	}
];
gt.Const.Tactical.AttackEffectStab <- [
	{
		Brush = "",
		Movement0 = this.createVec(10, 150),
		Movement1 = this.createVec(-10, -150),
		Offset = this.createVec(-60, -60)
	},
	{
		Brush = "effect_stab_NE",
		Movement0 = this.createVec(100, 90),
		Movement1 = this.createVec(-100, -90),
		Offset = this.createVec(-70, -30)
	},
	{
		Brush = "effect_stab_SE",
		Movement0 = this.createVec(100, -70),
		Movement1 = this.createVec(-100, 70),
		Offset = this.createVec(-70, -10)
	},
	{
		Brush = "",
		Movement0 = this.createVec(10, 150),
		Movement1 = this.createVec(-10, -150),
		Offset = this.createVec(-50, -60)
	},
	{
		Brush = "effect_stab_SW",
		Movement0 = this.createVec(-100, -60),
		Movement1 = this.createVec(100, 60),
		Offset = this.createVec(10, -10)
	},
	{
		Brush = "effect_stab_NW",
		Movement0 = this.createVec(-100, 60),
		Movement1 = this.createVec(100, -60),
		Offset = this.createVec(10, -50)
	}
];
gt.Const.Tactical.AttackEffectSwing <- [
	{
		Brush = "effect_swing_N",
		Movement0 = this.createVec(-80, -200),
		Movement1 = this.createVec(-80, -200),
		Offset = this.createVec(-120, -60)
	},
	{
		Brush = "effect_swing_NE",
		Movement0 = this.createVec(-200, -100),
		Movement1 = this.createVec(-200, -100),
		Offset = this.createVec(-130, 40)
	},
	{
		Brush = "effect_swing_SE",
		Movement0 = this.createVec(-70, 200),
		Movement1 = this.createVec(-70, 200),
		Offset = this.createVec(-60, 10)
	},
	{
		Brush = "effect_swing_S",
		Movement0 = this.createVec(80, 200),
		Movement1 = this.createVec(80, 200),
		Offset = this.createVec(50, 30)
	},
	{
		Brush = "effect_swing_SW",
		Movement0 = this.createVec(200, 100),
		Movement1 = this.createVec(200, 100),
		Offset = this.createVec(90, -50)
	},
	{
		Brush = "effect_swing_NW",
		Movement0 = this.createVec(80, -200),
		Movement1 = this.createVec(80, -200),
		Offset = this.createVec(20, -60)
	}
];
gt.Const.Tactical.AttackEffectSplit <- [
	{
		Brush = "effect_split_N",
		Movement0 = this.createVec(0, 100),
		Movement1 = this.createVec(0, 100),
		Offset = this.createVec(-30, 30)
	},
	{
		Brush = "effect_split_NE",
		Movement0 = this.createVec(200, -100),
		Movement1 = this.createVec(200, -100),
		Offset = this.createVec(-20, 50)
	},
	{
		Brush = "effect_split_SE",
		Movement0 = this.createVec(200, -140),
		Movement1 = this.createVec(200, -140),
		Offset = this.createVec(-20, 20)
	},
	{
		Brush = "effect_split_S",
		Movement0 = this.createVec(0, -100),
		Movement1 = this.createVec(0, -100),
		Offset = this.createVec(-30, -30)
	},
	{
		Brush = "effect_split_SW",
		Movement0 = this.createVec(-200, -140),
		Movement1 = this.createVec(-200, -140),
		Offset = this.createVec(-40, 20)
	},
	{
		Brush = "effect_split_NW",
		Movement0 = this.createVec(-200, -100),
		Movement1 = this.createVec(-200, -100),
		Offset = this.createVec(-20, 40)
	}
];
gt.Const.Tactical.AttackEffectBash <- [
	{
		Brush = "effect_bash_left",
		Movement0 = this.createVec(-10, -130),
		Movement1 = this.createVec(-10, -130),
		Offset = this.createVec(-30, 65)
	},
	{
		Brush = "effect_bash_right",
		Movement0 = this.createVec(10, -130),
		Movement1 = this.createVec(10, -130),
		Offset = this.createVec(-45, 65)
	},
	{
		Brush = "effect_bash_right",
		Movement0 = this.createVec(10, -130),
		Movement1 = this.createVec(10, -130),
		Offset = this.createVec(-45, 65)
	},
	{
		Brush = "effect_bash_left",
		Movement0 = this.createVec(-10, -130),
		Movement1 = this.createVec(-10, -130),
		Offset = this.createVec(-30, 65)
	},
	{
		Brush = "effect_bash_left",
		Movement0 = this.createVec(-10, -130),
		Movement1 = this.createVec(-10, -130),
		Offset = this.createVec(-25, 65)
	},
	{
		Brush = "effect_bash_left",
		Movement0 = this.createVec(-10, -130),
		Movement1 = this.createVec(-10, -130),
		Offset = this.createVec(-25, 65)
	}
];
gt.Const.Tactical.AttackEffectChop <- [
	{
		Brush = "effect_chop_left",
		Movement0 = this.createVec(-60, -160),
		Movement1 = this.createVec(-60, -160),
		Offset = this.createVec(-30, 40)
	},
	{
		Brush = "effect_chop_right",
		Movement0 = this.createVec(60, -160),
		Movement1 = this.createVec(60, -160),
		Offset = this.createVec(-70, 40)
	},
	{
		Brush = "effect_chop_right",
		Movement0 = this.createVec(60, -160),
		Movement1 = this.createVec(60, -160),
		Offset = this.createVec(-60, 40)
	},
	{
		Brush = "effect_chop_left",
		Movement0 = this.createVec(-60, -160),
		Movement1 = this.createVec(-60, -160),
		Offset = this.createVec(-30, 40)
	},
	{
		Brush = "effect_chop_left",
		Movement0 = this.createVec(-60, -160),
		Movement1 = this.createVec(-60, -160),
		Offset = this.createVec(-25, 40)
	},
	{
		Brush = "effect_chop_left",
		Movement0 = this.createVec(-60, -160),
		Movement1 = this.createVec(-60, -160),
		Offset = this.createVec(-25, 40)
	}
];
gt.Const.Tactical.AttackEffectSplitShield <- [
	{
		Brush = "effect_chop_left",
		Movement0 = this.createVec(-60, -160),
		Movement1 = this.createVec(-60, -160),
		Offset = this.createVec(-40, 35)
	},
	{
		Brush = "effect_chop_right",
		Movement0 = this.createVec(60, -160),
		Movement1 = this.createVec(60, -160),
		Offset = this.createVec(-90, 35)
	},
	{
		Brush = "effect_chop_right",
		Movement0 = this.createVec(60, -160),
		Movement1 = this.createVec(60, -160),
		Offset = this.createVec(-90, 35)
	},
	{
		Brush = "effect_chop_left",
		Movement0 = this.createVec(-60, -160),
		Movement1 = this.createVec(-60, -160),
		Offset = this.createVec(-40, 35)
	},
	{
		Brush = "effect_chop_left",
		Movement0 = this.createVec(-60, -160),
		Movement1 = this.createVec(-60, -160),
		Offset = this.createVec(-40, 35)
	},
	{
		Brush = "effect_chop_left",
		Movement0 = this.createVec(-60, -160),
		Movement1 = this.createVec(-60, -160),
		Offset = this.createVec(-40, 35)
	}
];
gt.Const.Tactical.AttackEffectClaws <- [
	{
		Brush = "effect_claws_left",
		Movement0 = this.createVec(-100, -200),
		Movement1 = this.createVec(-100, -200),
		Offset = this.createVec(0, 25)
	},
	{
		Brush = "effect_claws_right",
		Movement0 = this.createVec(100, -200),
		Movement1 = this.createVec(100, -200),
		Offset = this.createVec(-50, 25)
	},
	{
		Brush = "effect_claws_right",
		Movement0 = this.createVec(100, -200),
		Movement1 = this.createVec(100, -200),
		Offset = this.createVec(-50, 25)
	},
	{
		Brush = "effect_claws_left",
		Movement0 = this.createVec(-100, -200),
		Movement1 = this.createVec(-100, -200),
		Offset = this.createVec(0, 25)
	},
	{
		Brush = "effect_claws_left",
		Movement0 = this.createVec(-100, -200),
		Movement1 = this.createVec(-100, -200),
		Offset = this.createVec(0, 25)
	},
	{
		Brush = "effect_claws_left",
		Movement0 = this.createVec(-100, -200),
		Movement1 = this.createVec(-100, -200),
		Offset = this.createVec(0, 25)
	}
];

