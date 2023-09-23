/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 *
 *  @Author:		Overhype Studios
 *  @Date:			20.11.2017
 *  @Description:	World Screen - Topbar Datasource JS
 */
"use strict";


var WorldScreenTopbarDatasourceIdentifier = {
	TimeInformation: {
		Updated: 'time-information.updated'
	},

	AssetsInformation: {
		Updated: 'assets-information.updated'
	}
};


var WorldScreenTopbarDatasource = function ()
{
	this.mSQHandle = null;

	// Event handling
	this.mEventListener = {};

	// Caches
	this.mTimeInformation = null;
	this.mAssetsInformation = null;

	// init the datasource
	this.init();
};


WorldScreenTopbarDatasource.prototype.onConnection = function (_handle)
{
	//if (typeof(_handle) == 'string')
	{
		this.mSQHandle = _handle;
	}
};

WorldScreenTopbarDatasource.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;
	this.reset();
};


WorldScreenTopbarDatasource.prototype.addListener = function (_channel, _callback)
{
	if (_channel in this.mEventListener)
	{
		if (jQuery.inArray(_callback, this.mEventListener[_channel]) === -1)
		{
			this.mEventListener[_channel].push(_callback);
		}
	}
};

WorldScreenTopbarDatasource.prototype.removeListener = function (_channel, _callback)
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

WorldScreenTopbarDatasource.prototype.removeListeners = function ()
{
	this.createEventChannels();
};

WorldScreenTopbarDatasource.prototype.notifyEventListener = function (_channel, _payload)
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


WorldScreenTopbarDatasource.prototype.createEventChannels = function ()
{
	this.mEventListener[WorldScreenTopbarDatasourceIdentifier.TimeInformation.Updated] = [ ];
	this.mEventListener[WorldScreenTopbarDatasourceIdentifier.AssetsInformation.Updated] = [ ];
};


WorldScreenTopbarDatasource.prototype.init = function ()
{
	this.createEventChannels();
};

WorldScreenTopbarDatasource.prototype.reset = function ()
{
	this.mTimeInformation = null;
	this.mAssetsInformation = null;
};


WorldScreenTopbarDatasource.prototype.loadFromData = function (_data, _withoutNotify)
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

WorldScreenTopbarDatasource.prototype.loadTimeInformation = function (_data, _withoutNotify)
{
	this.mTimeInformation = _data;

	// notify every listener
	if (_withoutNotify === undefined || _withoutNotify !== true)
	{
		this.notifyEventListener(WorldScreenTopbarDatasourceIdentifier.TimeInformation.Updated, this.mTimeInformation);
	}

	return this.mTimeInformation;
};

WorldScreenTopbarDatasource.prototype.getTimeInformation = function()
{
	if (this.mTimeInformation === null)
	{
		this.mTimeInformation = this.loadTimeInformation(null, true);
	}

	return this.mTimeInformation;
};


WorldScreenTopbarDatasource.prototype.loadAssetsInformation = function (_data, _withoutNotify)
{
	var data = _data;

	var previousAssetsInformation = this.mAssetsInformation !== null ? this.mAssetsInformation : data;
	this.mAssetsInformation = data;

	// notify every listener
	if (_withoutNotify === undefined || _withoutNotify !== true)
	{
		this.notifyEventListener(WorldScreenTopbarDatasourceIdentifier.AssetsInformation.Updated, { current: this.mAssetsInformation, previous: previousAssetsInformation } );
	}

	return this.mAssetsInformation;
};

WorldScreenTopbarDatasource.prototype.getAssetsInformation = function(_key)
{
	if (this.mAssetsInformation === null)
	{
		this.mAssetsInformation = this.loadAssetsInformation(null, true);
	}

	if (_key !== undefined && _key !== null && typeof(_key) === 'string')
	{
		return this.mAssetsInformation[_key];
	}

	return this.mAssetsInformation;
};