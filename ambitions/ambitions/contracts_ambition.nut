this.contracts_ambition <- this.inherit("scripts/ambitions/ambition", {
	m = {
		ContractsToComplete = 0
	},
	function create()
	{
		this.ambition.create();
		this.m.ID = "ambition.contracts";
		this.m.Duration = 21.0 * this.World.getTime().SecondsPerDay;
		this.m.ButtonText = "We need to establish ourselves as mercenaries that can be relied on.\nLet us be tested over and over to prove it without doubt!";
		this.m.UIText = "Complete more contracts";
		this.m.TooltipText = "Complete 8 more contracts of any kind to prove yourselves reliable beyond doubt.";
		this.m.SuccessText = "[img]gfx/ui/events/event_62.png[/img]When starting out, the world saw you for what you were: ambition armed with a weapon. Everyone has a dream, and about half those men have weapons on them. You were not unique, not outstanding, not even particularly dangerous if you\'re giving your old self a good look in the eye. But you made it. The doors shut in your face. The attempts at haggling that lost you good deals. The spitting. So much spitting. It\'s a cold world and you dared to warm your own damn self. And you succeeded.\n\n Contracts under your belt, contracts on the horizon, they\'re blurring together. A culture of victory has started to wash over the %companyname% and you\'ve good reason to be proud of your command of it.";
		this.m.SuccessButtonText = "We\'re making a name for ourselves.";
	}

	function getUIText()
	{
		local d = 8 - (this.m.ContractsToComplete - this.World.Contracts.getContractsFinished());
		return this.m.UIText + " (" + this.Math.min(8, d) + "/8)";
	}

	function onUpdateScore()
	{
		if (!this.Const.DLC.Desert)
		{
			return;
		}

		if (this.World.Ambitions.getDone() < 1)
		{
			return;
		}

		if (this.World.Contracts.getContractsFinished() >= 15)
		{
			this.m.IsDone = true;
			return;
		}

		this.m.ContractsToComplete = this.World.Contracts.getContractsFinished() + 8;
		this.m.Score = 1 + this.Math.rand(0, 5);
	}

	function onCheckSuccess()
	{
		if (this.World.Contracts.getContractsFinished() >= this.m.ContractsToComplete)
		{
			return true;
		}

		return false;
	}

	function onSerialize( _out )
	{
		this.ambition.onSerialize(_out);
		_out.writeU16(this.m.ContractsToComplete);
	}

	function onDeserialize( _in )
	{
		this.ambition.onDeserialize(_in);
		this.m.ContractsToComplete = _in.readU16();
	}

});

