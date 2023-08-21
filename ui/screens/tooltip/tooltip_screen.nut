this.tooltip_screen <- {
	m = {
		JSHandle = null,
		Tooltip = null,
		TooltipEvents = null,
		Visible = null
	},
	function isVisible()
	{
		return this.m.Visible != null && this.m.Visible == true;
	}

	function getTooltip()
	{
		return this.m.Tooltip;
	}

	function getTooltipEvents()
	{
		return this.m.TooltipEvents;
	}

	function clearEventListener()
	{
	}

	function create()
	{
		this.m.Visible = false;
		this.m.JSHandle = this.UI.connect("TooltipScreen", this);
		this.m.Tooltip = this.new("scripts/ui/screens/tooltip/modules/tooltip");
		this.m.Tooltip.connectUI(this.m.JSHandle);
		this.m.TooltipEvents <- this.new("scripts/ui/screens/tooltip/tooltip_events");
		this.m.Tooltip.setOnQueryTileTooltipDataListener(this.m.TooltipEvents.onQueryTileTooltipData);
		this.m.Tooltip.setOnQueryEntityTooltipDataListener(this.m.TooltipEvents.onQueryEntityTooltipData);
		this.m.Tooltip.setOnQueryRosterEntityTooltipDataListener(this.m.TooltipEvents.onQueryRosterEntityTooltipData);
		this.m.Tooltip.setOnQuerySkillTooltipDataListener(this.m.TooltipEvents.onQuerySkillTooltipData);
		this.m.Tooltip.setOnQueryStatusEffectTooltipDataListener(this.m.TooltipEvents.onQueryStatusEffectTooltipData);
		this.m.Tooltip.setOnQuerySettlementStatusEffectTooltipDataListener(this.m.TooltipEvents.onQuerySettlementStatusEffectTooltipData);
		this.m.Tooltip.setOnQueryUIElementTooltipDataListener(this.m.TooltipEvents.onQueryUIElementTooltipData);
		this.m.Tooltip.setOnQueryUIItemTooltipDataListener(this.m.TooltipEvents.onQueryUIItemTooltipData);
		this.m.Tooltip.setOnQueryUIPerkTooltipDataListener(this.m.TooltipEvents.onQueryUIPerkTooltipData);
		this.m.Tooltip.setOnQueryFollowerTooltipDataListener(this.m.TooltipEvents.onQueryFollowerTooltipData);
		local gt = this.getroottable();
		gt.Tooltip <- this.WeakTableRef(this.m.Tooltip);
		gt.TooltipEvents <- this.WeakTableRef(this.m.TooltipEvents);
		this.show();
	}

	function destroy()
	{
		this.clearEventListener();
		local gt = this.getroottable();
		this.m.Tooltip.destroy();
		this.m.Tooltip = null;
		this.m.TooltipEvents.destroy();
		this.m.TooltipEvents = null;
		gt.Tooltip = null;
		gt.TooltipEvents = null;
		this.m.JSHandle = this.UI.disconnect(this.m.JSHandle);
	}

	function show()
	{
		if (this.m.JSHandle != null && !this.isVisible())
		{
			this.m.JSHandle.asyncCall("show", null);
		}
	}

	function hide()
	{
		if (this.m.JSHandle != null && this.isVisible())
		{
			this.m.JSHandle.asyncCall("hide", null);
		}
	}

	function onScreenConnected()
	{
	}

	function onScreenDisconnected()
	{
	}

	function onScreenShown()
	{
		this.m.Visible = true;
	}

	function onScreenHidden()
	{
		this.m.Visible = false;
	}

};

