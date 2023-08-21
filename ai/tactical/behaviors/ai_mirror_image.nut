this.ai_mirror_image <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		IsSpent = false,
		Tiles = [],
		Images = 0,
		Skill = null,
		PossibleSkills = [
			"actives.mirror_image"
		],
		WaitUntil = 0.0
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.MirrorImage;
		this.m.Order = this.Const.AI.Behavior.Order.MirrorImage;
		this.m.IsThreaded = true;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		// Function is a generator.
		this.m.Tiles = [];
		this.m.Skill = null;
		this.m.WaitUntil = 0.0;
		local scoreMult = this.getProperties().BehaviorMult[this.m.ID];
		local time = this.Time.getExactTime();

		if (this.m.IsSpent)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = this.selectSkill(this.m.PossibleSkills);

		if (this.m.Skill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local entities = this.Tactical.Entities.getInstancesOfFaction(_entity.getFaction());
		local phylacteries = 0;
		local mirror_images = 0;

		foreach( e in entities )
		{
			if (e.getType() == this.Const.EntityType.SkeletonLichMirrorImage)
			{
				mirror_images = ++mirror_images;
			}
			else if (e.getType() == this.Const.EntityType.SkeletonPhylactery)
			{
				phylacteries = ++phylacteries;
			}
		}

		phylacteries = this.Math.max(0, phylacteries - this.Time.getRound() / 9);

		if (mirror_images >= 4)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Images = this.Math.min(2 + this.Math.max(0, 6 - phylacteries), 4 - mirror_images);
		local myTile = _entity.getTile();
		local tiles = [];
		local mapSize = this.Tactical.getMapSize();

		for( local x = 1; x < mapSize.X - 1; x = ++x )
		{
			for( local y = 1; y < mapSize.Y - 1; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);

				if (!tile.IsEmpty)
				{
				}
				else
				{
					tiles.push({
						Tile = tile,
						Score = 0.0
					});
				}
			}
		}

		if (tiles.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local opponents = this.getAgent().getKnownOpponents();

		foreach( t in tiles )
		{
			local tile = t.Tile;
			local score = 0.0;

			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local farthest = 9000;

			foreach( target in opponents )
			{
				local targetTile = target.Actor.getTile();
				local d = t.Tile.getDistanceTo(targetTile);

				if (d <= 4)
				{
					score = score - 4.0;
				}

				if (d < farthest)
				{
					farthest = d;
				}
			}

			if (farthest > 5)
			{
				score = score - (farthest - 3.0);
			}

			t.Score = score;
		}

		tiles.sort(this.onSortByScore);
		this.m.Tiles = tiles;
		return this.Const.AI.Behavior.Score.MirrorImage * scoreMult;
	}

	function onTurnStarted()
	{
		this.m.IsSpent = false;
	}

	function onExecute( _entity )
	{
		if (this.m.IsFirstExecuted)
		{
			this.getAgent().adjustCameraToDestination(this.m.Tiles[0].Tile);
			this.m.IsFirstExecuted = false;
			this.m.Skill.use(_entity.getTile());
			this.m.WaitUntil = this.Time.getRealTimeF() + 1.45;
			return false;
		}
		else if (this.Time.getRealTimeF() >= this.m.WaitUntil)
		{
			local max_mirror_images = this.m.Images;

			for( local i = 0; i < this.m.Tiles.len(); i = ++i )
			{
				local tile = this.m.Tiles[0].Tile;
				this.m.Tiles.remove(0);
				local image = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/skeleton_lich_mirror_image", tile.Coords.X, tile.Coords.Y);
				image.setFaction(_entity.getFaction());
				image.spawnEffect();
				max_mirror_images = --max_mirror_images;

				if (max_mirror_images <= 0)
				{
					break;
				}
			}

			this.m.Tiles = [];
			this.m.IsSpent = true;
			this.getAgent().declareEvaluationDelay(1000);
			return true;
		}

		return false;
	}

	function onSortByScore( _a, _b )
	{
		if (_a.Score > _b.Score)
		{
			return -1;
		}
		else if (_a.Score < _b.Score)
		{
			return 1;
		}

		return 0;
	}

});

