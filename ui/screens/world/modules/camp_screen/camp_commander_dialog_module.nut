this.camp_commander_dialog_module <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		Title = "Commanders Tent",
		Description = "Select a tent, then click a brother to assign him to the tent. Bros sorted from best to worse"
	},
	function create()
	{
		this.m.ID = "CampCommanderDialogModule";
		this.ui_module.create();
	}

	function destroy()
	{
		this.ui_module.destroy();
	}

	function queryLoad()
	{
		local result = {
			Title = this.m.Title,
			SubTitle = this.m.Description,
			brothers = this.queryRosterInformation(),
			buildings = this.onQueryBuildingsList(),
			Assets = this.m.Parent.queryAssetsInformation()
		};
		return result;
	}

	function queryRosterInformation()
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local roster = [];

		foreach( b in brothers )
		{
			local background = b.getBackground();
			local tent = this.World.Camp.getBuildingByID(b.getCampAssignment());
			local injuries = [];
			local allInjuries = b.getSkills().query(this.Const.SkillType.TemporaryInjury);

			for( local i = 0; i != allInjuries.len(); i = i )
			{
				local inj = allInjuries[i];

				if (!inj.isTreated())
				{
					injuries.push({
						id = inj.getID(),
						icon = inj.getIconColored(),
						name = inj.getNameOnly(),
						price = inj.getCost(),
						treatable = inj.isTreatable() && inj.getQueue() == 0,
						points = inj.getPoints()
					});
				}

				i = ++i;
			}

			local skills = [];

			if (b.getSkills().hasSkill("effects.trained"))
			{
				local _skill = b.getSkills().getSkillByID("effects.trained");
				skills.push({
					id = _skill.getID(),
					icon = "skills/status_effect_75.png"
				});
			}

			local e = {
				ID = b.getID(),
				Name = b.getName(),
				ImagePath = b.getImagePath(),
				ImageOffsetX = b.getImageOffsetX(),
				ImageOffsetY = b.getImageOffsetY(),
				BackgroundImagePath = background.getIconColored(),
				BackgroundText = background.getDescription(),
				CampAssignment = b.getCampAssignment(),
				CampBanner = tent.getBanner(),
				Injuries = injuries,
				Skills = skills
			};
			roster.push(e);
		}

		return roster;
	}

	function onQueryBrothersList()
	{
		local roster = this.World.Assets.getFormation();

		for( local i = 0; i != roster.len(); i = i )
		{
			if (roster[i] != null)
			{
				roster[i] = this.UIDataHelper.convertEntityToUIData(roster[i], null);
			}

			i = ++i;
		}

		return roster;
	}

	function onQueryBuildingsList()
	{
		local buildings = this.World.Camp.getBuildings();
		local result = [];

		foreach( b in buildings )
		{
			if (b == null)
			{
				continue;
			}

			if (!b.inCommanderTent())
			{
				continue;
			}

			result.push({
				id = b.getID(),
				name = b.getName(),
				count = b.getNumberAssigned(),
				bannerImage = b.getBanner(),
				resourceImage = b.getResourceImage(),
				resourceCount = b.getResourceCount()
			});
		}

		return result;
	}

	function onTentSelected( _id )
	{
		local tent = this.World.Camp.getBuildingByID(_id);
		return {
			Roster = tent.getSortedRoster(),
			Label = tent.getName(),
			Enabled = tent.canEnter(),
			Modifiers = tent.getModifiers()
		};
	}

	function onBroAssigned( _data )
	{
		local broID = _data[0];
		local campID = _data[1];
		local bro = this.Tactical.getEntityByID(broID);

		if (bro.getCampAssignment() == campID)
		{
			campID = bro.getLastCampAssignment();
		}

		local tent = this.World.Camp.getBuildingByID(campID);

		if (!tent.onBroEnter(bro))
		{
			return;
		}

		tent = this.World.Camp.getBuildingByID(bro.getCampAssignment());
		tent.onBroLeave(bro);
		bro.setLastCampAssignment(bro.getCampAssignment());
		bro.setCampAssignment(campID);
		this.Sound.play("sounds/movement/movement_snow_00.wav", 1.0);
		return this.queryLoad();
	}

	function onLeaveButtonPressed()
	{
		this.m.Parent.onModuleClosed();
	}

	function onTentBuldingClicked( _id )
	{
		this.m.Parent.onShowTentBuilding(_id);
	}

});

