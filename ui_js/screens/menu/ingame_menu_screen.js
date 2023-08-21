/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			03.10.2017
 *  @Description:	Ingame Main Menu Screen JS
 */
"use strict";


var IngameMenuScreen = function()
{
	this.mSQHandle  = null;
	//this.mCampaignDatasource = new CampaignMenuDatasource();

	// container
	this.mContainer = null;
	this.mContentContainer = null;

	// modules
	this.mMainMenuModule = null;
	this.mLoadCampaignModule = null;
	this.mSaveCampaignModule = null;
	this.mOptionsMenuModule = null;

	this.createModules();
};


IngameMenuScreen.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

IngameMenuScreen.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
	this.register($('.root-screen'));
};

IngameMenuScreen.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;
	//this.mCampaignDatasource.onDisconnection();

	this.mMainMenuModule.onDisconnection();
	this.mLoadCampaignModule.onDisconnection();
	this.mSaveCampaignModule.onDisconnection();
	this.mOptionsMenuModule.onDisconnection();

	this.unregister();
};

IngameMenuScreen.prototype.onModuleOnConnectionCalled = function (_module)
{
	// check if every module is connected
	if ((this.mMainMenuModule !== null && this.mMainMenuModule.isConnected()) &&
		(this.mLoadCampaignModule !== null && this.mLoadCampaignModule.isConnected()) &&
		(this.mSaveCampaignModule !== null && this.mSaveCampaignModule.isConnected()) &&
		(this.mOptionsMenuModule !== null && this.mOptionsMenuModule.isConnected()))
	{
		this.notifyBackendOnConnected();
	}
};

IngameMenuScreen.prototype.onModuleOnDisconnectionCalled = function (_module)
{
	// check if every module is disconnected
	if ((this.mMainMenuModule === null && !this.mMainMenuModule.isConnected()) &&
		(this.mLoadCampaignModule === null && !this.mLoadCampaignModule.isConnected()) &&
		(this.mSaveCampaignModule === null && !this.mSaveCampaignModule.isConnected()) &&
		(this.mOptionsMenuModule === null && !this.mOptionsMenuModule.isConnected()))
	{
		this.notifyBackendOnDisconnected();
	}
};


IngameMenuScreen.prototype.createDIV = function (_parentDiv)
{
	// create: container
	this.mContainer = $('<div class="ingame-menu-screen display-none opacity-none"></div>');
	_parentDiv.append(this.mContainer);

	// header & footer
	/* var header = $('<div class="screen-header ui-control"></div>');
	this.mContainer.append(header);
	var footer = $('<div class="screen-footer ui-control"></div>');
	this.mContainer.append(footer);*/

	// content container
	this.mContentContainer = $('<div class="screen-content"></div>');
	this.mContainer.append(this.mContentContainer);
};

IngameMenuScreen.prototype.destroyDIV = function ()
{
	this.mContainer.remove();

	this.mContentContainer = null;
	this.mContainer = null;
};


IngameMenuScreen.prototype.createModules = function()
{
	this.mMainMenuModule = new MainMenuModule('center');
	this.mMainMenuModule.registerEventListener(this);

	this.mLoadCampaignModule = new LoadCampaignMenuModule(/*this.mCampaignDatasource*/);
	this.mLoadCampaignModule.registerEventListener(this);

	this.mSaveCampaignModule = new SaveCampaignMenuModule(/*this.mCampaignDatasource*/);
	this.mSaveCampaignModule.registerEventListener(this);

	this.mOptionsMenuModule = new OptionsMenuModule();
	this.mOptionsMenuModule.registerEventListener(this);
};

IngameMenuScreen.prototype.registerModules = function ()
{
	this.mMainMenuModule.register(this.mContentContainer);
	this.mLoadCampaignModule.register(this.mContentContainer);
	this.mSaveCampaignModule.register(this.mContentContainer);
	this.mOptionsMenuModule.register(this.mContentContainer);
};

IngameMenuScreen.prototype.unregisterModules = function ()
{
	this.mMainMenuModule.unregister();
	this.mLoadCampaignModule.unregister();
	this.mSaveCampaignModule.unregister();
	this.mOptionsMenuModule.unregister();
};


IngameMenuScreen.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.registerModules();
	this.hide();
};

IngameMenuScreen.prototype.destroy = function()
{
	this.hide();
	this.unregisterModules();
	this.destroyDIV();
};


IngameMenuScreen.prototype.register = function (_parentDiv)
{
	console.log('IngameMenuScreen::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Ingame Menu Screen. Reason: Ingame Menu Screen is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

IngameMenuScreen.prototype.unregister = function ()
{
	console.log('IngameMenuScreen::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Ingame Menu Screen. Reason: Ingame Menu Screen is not initialized.');
		return;
	}

	this.destroy();
};

IngameMenuScreen.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};


IngameMenuScreen.prototype.registerEventListener = function (_listener)
{
	this.mEventListener = _listener;
};


IngameMenuScreen.prototype.show = function (_data)
{
	var mode = (_data != undefined && _data != null) ?_data.Mode : null;

	var self = this;
	this.mContainer.velocity("finish", true).velocity({ opacity: 1 },
	{
		duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
		easing: 'swing',
		begin: function ()
		{
			$(this).removeClass('display-none').addClass('display-block');
			self.notifyBackendOnAnimating();

			if (mode !== undefined && mode !== null && typeof(mode) === 'string')
			{
				switch(mode)
				{
					case 'tactical':
					{
						self.mMainMenuModule.showTacticalMapMenu(false, _data.IsRetreatAllowed, _data.IsQuitAllowed, _data.QuitText);
						break;
					}
					case 'world':
					{
						self.mMainMenuModule.showWorldMapMenu(false, _data.IsSavingAllowed, _data.Seed);
						break;
					} 
					default:
					{
						self.mMainMenuModule.showMainMenu(false);
						break;
					} 
				}
			}
		},
		complete: function ()
		{
			self.notifyBackendOnShown();
		}
	});
};

IngameMenuScreen.prototype.hide = function ()
{
	var self = this;
	this.mContainer.velocity("finish", true).velocity({ opacity: 0 },
	{
		duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
		easing: 'swing',
		begin: function ()
		{
			self.notifyBackendOnAnimating();
		},
		complete: function ()
		{
			$(this).removeClass('display-block').addClass('display-none');
			self.notifyBackendOnHidden();
		}
	});
};


IngameMenuScreen.prototype.showMainMenu = function ()
{
	this.mMainMenuModule.showMainMenu();
};

IngameMenuScreen.prototype.showWorldMapMenu = function ()
{
	this.mMainMenuModule.showWorldMapMenu();
};

IngameMenuScreen.prototype.showTacticalMapMenu = function ()
{
	this.mMainMenuModule.showTacticalMapMenu();
};

IngameMenuScreen.prototype.showLoadCampaignMenu = function (_campaignData)
{
	this.mMainMenuModule.hide();
	this.mLoadCampaignModule.show(_campaignData);
};

IngameMenuScreen.prototype.hideLoadCampaignMenu = function ()
{
	this.mMainMenuModule.show();
	this.mLoadCampaignModule.hide();
};

IngameMenuScreen.prototype.showSaveCampaignMenu = function (_campaignData)
{
	this.mMainMenuModule.hide();
	this.mSaveCampaignModule.show(_campaignData);
};

IngameMenuScreen.prototype.hideSaveCampaignMenu = function ()
{
	this.mMainMenuModule.show();
	this.mSaveCampaignModule.hide();
};

IngameMenuScreen.prototype.showOptionsMenu = function (_data)
{
	this.mMainMenuModule.hide();
	this.mOptionsMenuModule.show(_data);
};

IngameMenuScreen.prototype.hideOptionsMenu = function ()
{
	this.mMainMenuModule.show();
	this.mOptionsMenuModule.hide();
};

IngameMenuScreen.prototype.getModule = function (_name)
{
	switch(_name)
	{
		case 'MainMenuModule': return this.mMainMenuModule;
		case 'LoadCampaignModule': return this.mLoadCampaignModule;
		case 'SaveCampaignModule': return this.mSaveCampaignModule;
		case 'OptionsMenuModule': return this.mOptionsMenuModule;
		default: return null;
	}
};

IngameMenuScreen.prototype.getModules = function ()
{
	return [
		{ name: 'MainMenuModule', module: this.mMainMenuModule },
		{ name: 'LoadCampaignModule', module: this.mLoadCampaignModule },
		{ name: 'SaveCampaignModule', module: this.mSaveCampaignModule },
		{ name: 'OptionsMenuModule', module: this.mOptionsMenuModule }
	];
};


IngameMenuScreen.prototype.notifyBackendOnConnected = function ()
{
	SQ.call(this.mSQHandle, 'onScreenConnected');
};

IngameMenuScreen.prototype.notifyBackendOnDisconnected = function ()
{
	SQ.call(this.mSQHandle, 'onScreenDisconnected');
};

IngameMenuScreen.prototype.notifyBackendOnShown = function ()
{
   SQ.call(this.mSQHandle, 'onScreenShown');
};

IngameMenuScreen.prototype.notifyBackendOnHidden = function ()
{
	if (this.mSQHandle != null)
	{
		SQ.call(this.mSQHandle, 'onScreenHidden');
	}
};

IngameMenuScreen.prototype.notifyBackendOnAnimating = function ()
{
   if (this.mSQHandle !== null)
   {
		SQ.call(this.mSQHandle, 'onScreenAnimating');
   }
};