/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			14.02.2017
 *  @Description:	Root Screen JS
 */
"use strict";


var RootScreen = function()
{
	this.mSQHandle = null;
	
	// generic containers
	this.mContainer = null;

	// modules
	this.mFPSModule	 = null;
	this.mVersionModule = null;

	this.createModules();
};


RootScreen.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

RootScreen.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
	this.mFPSModule.onConnection(_handle);
	this.mVersionModule.onConnection(_handle);

	this.register($('body'));
};

RootScreen.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;
	this.mFPSModule.onDisconnection();
	this.mVersionModule.onDisconnection();

	this.unregister();
};


RootScreen.prototype.createDIV = function (_parentDiv)
{
	// create: containers
	this.mContainer = $('<div class="root-screen"></div>');
	_parentDiv.append(this.mContainer);
};

RootScreen.prototype.destroyDIV = function ()
{
	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


RootScreen.prototype.createModules = function()
{
	this.mFPSModule = new RootScreenFPSModule();
	this.mVersionModule = new RootScreenVersionModule();
};

RootScreen.prototype.registerModules = function ()
{
	//this.mFPSModule.register(this.mContainer);
	this.mVersionModule.register(this.mContainer);
};

RootScreen.prototype.unregisterModules = function ()
{
	//this.mFPSModule.unregister();
	this.mVersionModule.unregister();
};


RootScreen.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.registerModules();
};

RootScreen.prototype.destroy = function()
{
	this.unregisterModules();
	this.destroyDIV();
};


RootScreen.prototype.register = function (_parentDiv)
{
	console.log('RootScreen::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Root Screen. Reason: Root Screen is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

RootScreen.prototype.unregister = function ()
{
	console.log('RootScreen::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Root Screen. Reason: Root Screen is not initialized.');
		return;
	}

	this.destroy();
};


RootScreen.prototype.show = function ()
{
	this.onConnection('1234');
	this.mContainer.removeClass('display-none').addClass('display-block');
};

RootScreen.prototype.hide = function ()
{
	this.mContainer.removeClass('display-block').addClass('display-none');
	this.onDisconnection();
};

RootScreen.prototype.getModules = function ()
{
	return [
		{ name: 'FPSModule', module: this.mFPSModule },
		{ name: 'VersionModule', module: this.mVersionModule }
	];
};

RootScreen.prototype.getModule = function (_name)
{
	switch (_name)
	{
		case 'FPSModule': return this.mFPSModule;
		case 'VersionModule': return this.mVersionModule;
		default: return null;
	}
};

RootScreen.prototype.getContainer = function ()
{
	return this.mContainer;
};
