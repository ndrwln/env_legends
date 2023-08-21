/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			12.10.2017
 *  @Description:	Tooltip Screen JS
 */
"use strict";


var TooltipScreen = function()
{
	this.mSQHandle = null;
	
	// generic containers
	this.mContainer = null;

	// modules
	this.mTooltipModule = null;

	this.mDate = new Date();
	this.mLastHiddenTime = 0;

	this.createModules();
};


TooltipScreen.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

TooltipScreen.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
	this.register($('.root-screen'));
};

TooltipScreen.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	this.mTooltipModule.onDisconnection();

	this.unregister();
};

TooltipScreen.prototype.onModuleOnConnectionCalled = function (_module)
{
	// check if every module is connected
	if ((this.mTooltipModule !== null && this.mTooltipModule.isConnected()))
	{
		this.notifyBackendOnConnected();
	}
};

TooltipScreen.prototype.onModuleOnDisconnectionCalled = function (_module)
{
	// check if every module is disconnected
	if ((this.mTooltipModule === null && !this.mTooltipModule.isConnected()))
	{
		this.notifyBackendOnDisconnected();
	}
};


TooltipScreen.prototype.createDIV = function (_parentDiv)
{
	// create: containers (init hidden!)
	this.mContainer = $('<div class="tooltip-screen display-none"></div>');
	_parentDiv.append(this.mContainer);
};

TooltipScreen.prototype.destroyDIV = function ()
{
	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


TooltipScreen.prototype.createModules = function()
{
	this.mTooltipModule = new TooltipModule();
	this.mTooltipModule.registerEventListener(this);
};

TooltipScreen.prototype.registerModules = function ()
{
	this.mTooltipModule.register(this.mContainer);
};

TooltipScreen.prototype.unregisterModules = function ()
{
	this.mTooltipModule.unregister();
};


TooltipScreen.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.registerModules();
};

TooltipScreen.prototype.destroy = function()
{
	this.unregisterModules();
	this.destroyDIV();
};


TooltipScreen.prototype.register = function (_parentDiv)
{
	console.log('TooltipScreen::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Tooltip Screen. Reason: Tooltip Screen is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

TooltipScreen.prototype.unregister = function ()
{
	console.log('TooltipScreen::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Tooltip Screen. Reason: Tooltip Screen is not initialized.');
		return;
	}

	this.destroy();
};


TooltipScreen.prototype.show = function ()
{
	if(this.mLastHiddenTime + 1000 > this.mDate.getTime())
		return;

	this.mContainer.removeClass('display-none').addClass('display-block');
	this.notifyBackendOnShown();
};

TooltipScreen.prototype.hide = function ()
{
	this.mLastHiddenTime = this.mDate.getTime();
	this.mContainer.removeClass('display-block').addClass('display-none');
	this.notifyBackendOnHidden();
};


TooltipScreen.prototype.getModule = function (_name)
{
	switch(_name)
	{
		case 'TooltipModule': return this.mTooltipModule;
		default: return null;
	}
};

TooltipScreen.prototype.getModules = function ()
{
	return [
		{ name: 'TooltipModule', module: this.mTooltipModule }
	];
};


TooltipScreen.prototype.notifyBackendOnConnected = function ()
{
	SQ.call(this.mSQHandle, 'onScreenConnected');
};

TooltipScreen.prototype.notifyBackendOnDisconnected = function ()
{
	SQ.call(this.mSQHandle, 'onScreenDisconnected');
};

TooltipScreen.prototype.notifyBackendOnShown = function ()
{
	SQ.call(this.mSQHandle, 'onScreenShown');
};

TooltipScreen.prototype.notifyBackendOnHidden = function ()
{
	SQ.call(this.mSQHandle, 'onScreenHidden');
};