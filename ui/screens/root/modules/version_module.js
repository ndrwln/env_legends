/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			14.02.2017
 *  @Description:	Version Module JS
 */
"use strict";


var RootScreenVersionModule = function()
{
	this.mSQHandle = null;
	
	// container & label
	this.mContainer = null;
	this.mVersion = null;
	this.mGameName = null;
};


RootScreenVersionModule.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

RootScreenVersionModule.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
};

RootScreenVersionModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;
};


RootScreenVersionModule.prototype.createDIV = function (_parentDiv)
{
	this.mContainer = $('<div class="version-container"></div>');
	_parentDiv.append(this.mContainer);

	this.mGameName = $('<div class="game-name default-font-small font-shadow-silhouette ui-control-text-link">www.battlebrothersgame.com</div>');
	this.mVersion = $('<div class="version default-font-small font-shadow-silhouette ui-control-version-label">version number</div>');
	this.mContainer.append(this.mGameName);
	this.mContainer.append(this.mVersion);

	this.mGameName.click(function(e)
	{
		openURL(GameInformation.websiteURL);
	});
};

RootScreenVersionModule.prototype.destroyDIV = function ()
{
	this.mGameName.remove();
	this.mGameName = null;
	this.mVersion.remove();
	this.mVersion = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


RootScreenVersionModule.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
};

RootScreenVersionModule.prototype.destroy = function()
{
	this.destroyDIV();
};


RootScreenVersionModule.prototype.register = function (_parentDiv)
{
	console.log('RootScreenVersionModule::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Version Module. Reason: Version Module is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

RootScreenVersionModule.prototype.unregister = function ()
{
	console.log('RootScreenVersionModule::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Version Module. Reason: Version Module is not initialized.');
		return;
	}

	this.destroy();
};


RootScreenVersionModule.prototype.setVersion = function (_value)
{
	this.mVersion.html(_value);
};