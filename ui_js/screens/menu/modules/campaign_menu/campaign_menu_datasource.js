/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2015
 *
 *  @Author:		Overhype Studios
 *  @Date:			12.01.2015
 *  @Description:	Campaign Menu Datasource JS
 */
"use strict";


var CampaignMenuDatasourceIdentifier = {
	Campaigns: {
		Loaded: 'campaigns.loaded'
	}
};


var CampaignMenuDatasource = function ()
{
	this.mSQHandle = null;

	// Event handling
	this.mEventListener = {};

	// Caches
	this.mCampainsList = null;

	// init the datasource
	this.init();
};


CampaignMenuDatasource.prototype.onConnection = function (_handle)
{
	//if (typeof(_handle) == 'string')
	{
		this.mSQHandle = _handle;
	}
};

CampaignMenuDatasource.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;
	this.reset();
};


CampaignMenuDatasource.prototype.addListener = function (_channel, _callback)
{
	if (_channel in this.mEventListener)
	{
		if (jQuery.inArray(_callback, this.mEventListener[_channel]) === -1)
		{
			this.mEventListener[_channel].push(_callback);
		}
	}
};

CampaignMenuDatasource.prototype.removeListener = function (_channel, _callback)
{
	if (_channel in this.mEventListener)
	{
		var idx = jQuery.inArray(_callback, this.mEventListener[_channel]);
		if (idx !== -1)
		{
			this.mEventListener[_channel].remove(idx);
		}
	}
};

CampaignMenuDatasource.prototype.removeListeners = function ()
{
	this.createEventChannels();
};

CampaignMenuDatasource.prototype.notifyEventListener = function (_channel, _payload)
{
	if (_channel in this.mEventListener)
	{
		var listeners = this.mEventListener[_channel];
		for (var i = 0; i < listeners.length; ++i)
		{
			listeners[i](this, _payload);
		}
	}
};


CampaignMenuDatasource.prototype.createEventChannels = function ()
{
	this.mEventListener[CampaignMenuDatasourceIdentifier.Campaigns.Loaded] = [ ];
};


CampaignMenuDatasource.prototype.init = function ()
{
	this.createEventChannels();
};

CampaignMenuDatasource.prototype.reset = function ()
{
	this.mCampainsList = null;
};


/*
CampaignMenuDatasource.prototype.loadFromData = function (_data, _withoutNotify)
{
	if (_data === undefined || _data == null || typeof(_data) !== 'object')
	{
		console.error('ERROR: Failed to query topbar result data. Reason: Invalid result.');
		return;
	}

	if (WorldScreenTopbarIdentifier.QueryResult.TimeInformation in _data)
	{
		this.loadTimeInformation(_data[WorldScreenTopbarIdentifier.QueryResult.TimeInformation], _withoutNotify);
	}

	if (WorldScreenTopbarIdentifier.QueryResult.AssetsInformation in _data)
	{
		this.loadAssetsInformation(_data[WorldScreenTopbarIdentifier.QueryResult.AssetsInformation], _withoutNotify);
	}
};
*/

CampaignMenuDatasource.prototype.loadCampaigns = function (_data, _withoutNotify)
{
	var data = _data;

	this.mCampainsList = data;

	// notify every listener
	if (_withoutNotify === undefined || _withoutNotify !== true)
	{
		this.notifyEventListener(CampaignMenuDatasourceIdentifier.Campaigns.Loaded, this.mCampainsList);
	}

	return this.mCampainsList;
};

CampaignMenuDatasource.prototype.getCampaigns = function()
{
	if (this.mCampainsList === null)
	{
		this.mCampainsList = this.loadCampaigns(null, true);
	}

	return this.mCampainsList;
};