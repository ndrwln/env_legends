/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			14.02.2017
 *  @Description:	FPS Module JS
 */
"use strict";


var RootScreenFPSModule = function()
{
	this.mSQHandle = null;
	
	// container & label
	this.mContainer = null;
	this.mFPSLabel = null;
};


RootScreenFPSModule.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

RootScreenFPSModule.prototype.onConnection = function (_handle)
{
	//if (typeof(_handle) == 'string')
	{
		this.mSQHandle = _handle;
	}
};

RootScreenFPSModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;
};


RootScreenFPSModule.prototype.createDIV = function (_parentDiv)
{
	this.mContainer = $('<div class="fps-container ui-control.panel-embossed"></div>');
	_parentDiv.append(this.mContainer);

	var fpsLabel = $('<div class="label default-font-normal ui-control-fps-label">FPS:</div>');
	this.mFPSLabel = $('<div class="value default-font-normal ui-control-fps-label">60</div>');
	this.mContainer.append(fpsLabel);
	this.mContainer.append(this.mFPSLabel);
};

RootScreenFPSModule.prototype.destroyDIV = function ()
{
	this.mFPSLabel.remove();
	this.mFPSLabel = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


RootScreenFPSModule.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
};

RootScreenFPSModule.prototype.destroy = function()
{
	this.destroyDIV();
};


RootScreenFPSModule.prototype.register = function (_parentDiv)
{
	console.log('RootScreenFPSModule::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register FPS Module. Reason: FPS Module is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

RootScreenFPSModule.prototype.unregister = function ()
{
	console.log('RootScreenFPSModule::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister FPS Module. Reason: FPS Module is not initialized.');
		return;
	}

	this.destroy();
};


RootScreenFPSModule.prototype.setFPS = function (_value)
{
	this.mFPSLabel.html(_value);
};