local gt = this.getroottable();

if (!("World" in gt.Const))
{
	gt.Const.World <- {};
}

if (!("Party" in gt.Const.World))
{
	gt.Const.World.Party <- {};
}

gt.Const.World.PartyRole <- {
	None = 0,
	Raider = 1,
	Defender = 2,
	Caravan = 3,
	Assault = 4,
	Patrol = 5,
	Scout = 6,
	Roamer = 7,
	Ambusher = 8
};
gt.Const.World.PartyAgent <- [
	"",
	"scripts/ai/world/agents/raider_ai_agent",
	"scripts/ai/world/agents/defender_ai_agent",
	"scripts/ai/world/agents/caravan_ai_agent",
	"",
	"scripts/ai/world/agents/patrol_ai_agent",
	"scripts/ai/world/agents/scout_ai_agent",
	"scripts/ai/world/agents/roam_ai_agent",
	"scripts/ai/world/agents/ambusher_ai_agent"
];

