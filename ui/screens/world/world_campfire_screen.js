/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			31.10.2017
 *  @Description:	World Town Screen JS
 */
"use strict";


var WorldCampfireScreen = function()
{
	this.mSQHandle					= null;

	// generic containers
	this.mContainer					= null;

	// modules
	this.mMainDialogModule			= null;
	this.mHireDialogModule			= null;
	this.mActiveModule				= null;

	this.mAssetValues				= null;

	this.createModules();
};


WorldCampfireScreen.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

WorldCampfireScreen.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
	this.register($('.root-screen'));
};

WorldCampfireScreen.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	this.mMainDialogModule.onDisconnection();
	this.mHireDialogModule.onDisconnection();

	this.unregister();
};

WorldCampfireScreen.prototype.onModuleOnConnectionCalled = function (_module)
{
	// check if every module is connected
	if ((this.mMainDialogModule !== null && this.mMainDialogModule.isConnected()) &&
		(this.mHireDialogModule !== null && this.mHireDialogModule.isConnected()) )
	{
		this.notifyBackendOnConnected();
	}
};

WorldCampfireScreen.prototype.onModuleOnDisconnectionCalled = function (_module)
{
	// check if every module is disconnected
	if ((this.mMainDialogModule === null && !this.mMainDialogModule.isConnected()) &&
		(this.mHireDialogModule === null && !this.mHireDialogModule.isConnected()) )
	{
		this.notifyBackendOnDisconnected();
	}
};

WorldCampfireScreen.prototype.createDIV = function (_parentDiv)
{
	// create: containers (init hidden!)
	this.mContainer = $('<div class="world-campfire-screen ui-control dialog-modal-background display-none opacity-none"/>');
	_parentDiv.append(this.mContainer);
};

WorldCampfireScreen.prototype.destroyDIV = function ()
{
	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};

WorldCampfireScreen.prototype.createModules = function()
{
	this.mMainDialogModule = new WorldCampfireScreenMainDialogModule(this);
	this.mHireDialogModule = new WorldCampfireScreenHireDialogModule(this);
};

WorldCampfireScreen.prototype.registerModules = function ()
{
	this.mMainDialogModule.register(this.mContainer);
	this.mHireDialogModule.register(this.mContainer);
};

WorldCampfireScreen.prototype.unregisterModules = function ()
{
	this.mMainDialogModule.unregister();
	this.mHireDialogModule.unregister();
};

WorldCampfireScreen.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.registerModules();
};

WorldCampfireScreen.prototype.destroy = function()
{
	this.unregisterModules();
	this.destroyDIV();
};


WorldCampfireScreen.prototype.register = function (_parentDiv)
{
	console.log('WorldCampfireScreen::REGISTER');

	if(this.mContainer !== null)
	{
		console.error('ERROR: Failed to register World Campfire Screen. Reason: World Campfire Screen is already initialized.');
		return;
	}

	if(_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

WorldCampfireScreen.prototype.unregister = function ()
{
	console.log('WorldCampfireScreen::UNREGISTER');

	if(this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister World Campfire Screen. Reason: World Campfire Screen is not initialized.');
		return;
	}

	this.destroy();
};

WorldCampfireScreen.prototype.show = function (_data)
{
	if(_data !== undefined && _data !== null && typeof(_data) === 'object')
	{
		this.mMainDialogModule.loadFromData(_data);
		this.loadAssetData(_data['Assets']);
	}

	this.mActiveModule = null;

	var self = this;
	this.mContainer.velocity("finish", true).velocity({ opacity: 1 },
	{
		duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
		easing: 'swing',
		begin: function ()
		{
			$(this).css({ opacity: 0 });
			$(this).removeClass('display-none').addClass('display-block');
			self.notifyBackendOnAnimating();
			self.showMainDialog(null);
		},
		complete: function ()
		{
			self.notifyBackendOnShown();
		}
	});
};

WorldCampfireScreen.prototype.hide = function ()
{
	var self = this;

	this.mActiveModule = null;

	this.mContainer.velocity("finish", true).velocity({ opacity: 0 },
	{
		duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
		easing: 'swing',
		begin: function()
		{
			self.notifyBackendOnAnimating();
		},
		complete: function()
		{
			$(this).css({ opacity: 0 });
			$(this).removeClass('display-block').addClass('display-none');
			self.mMainDialogModule.mDialogContainer.findDialogContentContainer().empty();
			self.notifyBackendOnHidden();
		}
	});
};

WorldCampfireScreen.prototype.hideAllDialogs = function (_withSlideAnimation)
{
	this.mMainDialogModule.hide(false);
	
	if(this.mActiveModule != null)
	{
		this.mActiveModule.hide(_withSlideAnimation);
		this.mActiveModule = null;
	}

	this.mContainer.removeClass('display-block').addClass('display-none');
};

WorldCampfireScreen.prototype.refresh = function (_data)
{
	if (_data !== undefined && _data !== null && typeof (_data) === 'object')
	{
		this.mMainDialogModule.loadFromData(_data);
		this.loadAssetData(_data['Assets']);
	}

	if (this.mActiveModule != null)
	{
		this.mActiveModule.hide();
		this.mActiveModule = null;
	}

	this.mMainDialogModule.show(false);
};


WorldCampfireScreen.prototype.showMainDialog = function (/*_withSlideAnimation,*/ _data)
{
	if(_data !== undefined && _data !== null && typeof(_data) === 'object')
	{
		this.mMainDialogModule.loadFromData(_data);
		this.loadAssetData(_data['Assets']);
	}

	var _withSlideAnimation = true;

	this.mContainer.addClass('display-block').removeClass('display-none');

	if(this.mActiveModule != null)
		this.mActiveModule.hide(false);

	this.mActiveModule = null;

	if (_data != null)
		this.mAssetValues = null;
	else
		_withSlideAnimation = false;

	this.mMainDialogModule.show(_withSlideAnimation);
};

WorldCampfireScreen.prototype.showHireDialog = function (/*_withSlideAnimation,*/ _data)
{
	var _withSlideAnimation = true;

	this.mContainer.addClass('display-block').removeClass('display-none');

	if(this.mActiveModule != null)
		this.mActiveModule.hide(_withSlideAnimation);
	else
		this.mMainDialogModule.hide();

	this.mActiveModule = this.mHireDialogModule;

	if(_data !== undefined && _data !== null && typeof(_data) === 'object')
	{
		this.loadAssetData(_data.Assets);
		this.mHireDialogModule.loadFromData(_data.Roster);
	}

	this.mHireDialogModule.show(_withSlideAnimation);
};

WorldCampfireScreen.prototype.loadAssetData = function (_data)
{
	if(_data !== undefined && _data !== null)
	{	 
		this.mMainDialogModule.updateAssets(_data);

		if(this.mActiveModule != null)
			this.mActiveModule.updateAssets(_data);

		this.mAssetValues = _data;
	}
};

WorldCampfireScreen.prototype.getModule = function (_name)
{
	switch(_name)
	{
		case 'MainDialogModule': return this.mMainDialogModule;
		case 'HireDialogModule': return this.mHireDialogModule;
		default: return null;
	}
};

WorldCampfireScreen.prototype.getModules = function ()
{
	return [
		{ name: 'MainDialogModule', module: this.mMainDialogModule },
		{ name: 'HireDialogModule', module: this.mHireDialogModule },
	];
};

WorldCampfireScreen.prototype.notifyBackendOnConnected = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenConnected');
	}
};

WorldCampfireScreen.prototype.notifyBackendOnDisconnected = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenDisconnected');
	}
};

WorldCampfireScreen.prototype.notifyBackendOnShown = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenShown');
	}
};

WorldCampfireScreen.prototype.notifyBackendOnHidden = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenHidden');
	}
};

WorldCampfireScreen.prototype.notifyBackendOnAnimating = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenAnimating');
	}
};

WorldCampfireScreen.prototype.notifyBackendSlotClicked = function (_data)
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onSlotClicked', _data);
	}
};