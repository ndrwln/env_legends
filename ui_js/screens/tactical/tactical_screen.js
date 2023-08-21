/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			21.02.2017
 *  @Description:	Tactical Screen JS
 */
"use strict";


/* Tactical Screen */
var TacticalScreen = function()
{
	this.mSQHandle = null;
	
	// generic containers
	this.mContainer = null;
	this.mTopBarContainer = null;

	// module containers
	this.mLeftModuleContainer = null;
	this.mMiddleModuleContainer = null;
	this.mRightModuleContainer = null;

	// modules
	this.mTurnSequenceBarModule = null;
	this.mTopbarRoundInformationModule = null;
	this.mTopbarEventLogModule = null;
	this.mTopbarOptionsModule = null;
	this.mOrientationOverlayModule = null;

	// timer
	this.mShowHideModulesDelay = 200;

	// create
	this.createModules();
};


TacticalScreen.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

TacticalScreen.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
	this.register($('.root-screen'));
};

TacticalScreen.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	this.mTurnSequenceBarModule.onDisconnection();
	this.mTopbarRoundInformationModule.onDisconnection();
	this.mTopbarEventLogModule.onDisconnection();
	this.mTopbarOptionsModule.onDisconnection();
	this.mOrientationOverlayModule.onDisconnection();

	this.unregister();
};

TacticalScreen.prototype.onModuleOnConnectionCalled = function (_module)
{
	// check if every module is connected
	if ((this.mTurnSequenceBarModule !== null && this.mTurnSequenceBarModule.isConnected()) &&
		(this.mTopbarRoundInformationModule !== null && this.mTopbarRoundInformationModule.isConnected()) &&
		(this.mTopbarEventLogModule !== null && this.mTopbarEventLogModule.isConnected()) &&
		(this.mTopbarOptionsModule !== null && this.mTopbarOptionsModule.isConnected()) &&
		(this.mOrientationOverlayModule !== null && this.mOrientationOverlayModule.isConnected()) )
	{
		this.notifyBackendOnConnected();
	}
};

TacticalScreen.prototype.onModuleOnDisconnectionCalled = function (_module)
{
	// check if every module is disconnected
	if ((this.mTurnSequenceBarModule === null || !this.mTurnSequenceBarModule.isConnected()) &&
		(this.mTopbarRoundInformationModule === null || !this.mTopbarRoundInformationModule.isConnected()) &&
		(this.mTopbarEventLogModule === null && !this.mTopbarEventLogModule.isConnected()) &&
		(this.mTopbarOptionsModule === null && !this.mTopbarOptionsModule.isConnected()) &&
		(this.mOrientationOverlayModule === null && !this.mOrientationOverlayModule.isConnected()) )
	{
		this.notifyBackendOnDisconnected();
	}
};

TacticalScreen.prototype.createDIV = function (_parentDiv)
{
	// create: containers
	this.mContainer = $('<div class="tactical-screen ui-control display-none"/>');
	_parentDiv.append(this.mContainer);

	this.mTopBarContainer = $('<div class="topbar-container"/>');
	this.mContainer.append(this.mTopBarContainer);

	// create: module container
	this.mLeftModuleContainer = $('<div class="left-module-container"/>');
	this.mTopBarContainer.append(this.mLeftModuleContainer);
	this.mMiddleModuleContainer = $('<div class="middle-module-container"/>');
	this.mTopBarContainer.append(this.mMiddleModuleContainer);
	this.mRightModuleContainer = $('<div class="right-module-container"/>');
	this.mTopBarContainer.append(this.mRightModuleContainer);
};

TacticalScreen.prototype.destroyDIV = function ()
{
	this.mLeftModuleContainer.empty();
	this.mLeftModuleContainer = null;
	this.mMiddleModuleContainer.empty();
	this.mMiddleModuleContainer = null;
	this.mRightModuleContainer.empty();
	this.mRightModuleContainer = null;

	this.mTopBarContainer.empty();
	this.mTopBarContainer = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


TacticalScreen.prototype.createModules = function()
{
	this.mTurnSequenceBarModule = new TacticalScreenTurnSequenceBarModule();
	this.mTurnSequenceBarModule.registerEventListener(this);

	this.mOrientationOverlayModule = new TacticalScreenOrientationOverlayModule();
	this.mOrientationOverlayModule.registerEventListener(this);

	this.mTopbarEventLogModule = new TacticalScreenTopbarEventLogModule();
	this.mTopbarEventLogModule.registerEventListener(this);

	this.mTopbarRoundInformationModule = new TacticalScreenTopbarRoundInformationModule();
	this.mTopbarRoundInformationModule.registerEventListener(this);

	this.mTopbarOptionsModule = new TacticalScreenTopbarOptionsModule();
	this.mTopbarOptionsModule.registerEventListener(this);
};

TacticalScreen.prototype.registerModules = function ()
{
	this.mTurnSequenceBarModule.register(this.mContainer);
	this.mOrientationOverlayModule.register(this.mContainer);

	this.mTopbarEventLogModule.register(this.mLeftModuleContainer);
	this.mTopbarRoundInformationModule.register(this.mMiddleModuleContainer);
	this.mTopbarOptionsModule.register(this.mRightModuleContainer);
};

TacticalScreen.prototype.unregisterModules = function ()
{
	this.mTurnSequenceBarModule.unregister();
	this.mOrientationOverlayModule.unregister();

	this.mTopbarEventLogModule.unregister();
	this.mTopbarRoundInformationModule.unregister();
	this.mTopbarOptionsModule.unregister();
};


TacticalScreen.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.registerModules();
};

TacticalScreen.prototype.destroy = function()
{
	this.unregisterModules();
	this.destroyDIV();
};


TacticalScreen.prototype.register = function (_parentDiv)
{
	console.log('TacticalScreen::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Tactical Screen. Reason: Tactical Screen is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

TacticalScreen.prototype.unregister = function ()
{
	console.log('TacticalScreen::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Tactical Screen. Reason: Tactical Screen is not initialized.');
		return;
	}

	this.destroy();
};


TacticalScreen.prototype.showTopbar = function (_startFallback, _finishFallback)
{
	this.mTopBarContainer.velocity("finish", true).velocity({ top: '0' }, {
		duration: this.mShowHideModulesDelay,
		easing: 'swing',
		begin: function() {
			$(this).removeClass('display-none').addClass('display-block');
			if (jQuery.isFunction(_startFallback))
			{
				_startFallback();
			}
		},
		complete: function() {
			if (jQuery.isFunction(_finishFallback))
			{
				_finishFallback();
			}
		}
	});
};

TacticalScreen.prototype.hideTopbar = function (_startFallback, _finishFallback)
{
	this.mTopBarContainer.velocity("finish", true).velocity({ top: '-10.0rem' }, {
		duration: this.mShowHideModulesDelay,
		easing: 'swing',
		begin: function() {
			if (jQuery.isFunction(_startFallback))
			{
				_startFallback();
			}
		},
		complete: function() {
			$(this).removeClass('display-block').addClass('display-none');
			if (jQuery.isFunction(_finishFallback))
			{
				_finishFallback();
			}
		}
	});
};


TacticalScreen.prototype.show = function ()
{
	this.showTopbar(jQuery.proxy(function () {
			this.mContainer.removeClass('display-none').addClass('display-block');
			this.notifyBackendOnAnimating();
		}, this),
		jQuery.proxy(function () {
			this.notifyBackendOnShown();
		}, this));
	this.mTurnSequenceBarModule.show(this.mShowHideModulesDelay);
};

TacticalScreen.prototype.hide = function ()
{
	this.hideTopbar(jQuery.proxy(function () {
			this.notifyBackendOnAnimating();
		}, this),
		jQuery.proxy(function () {
			this.mContainer.removeClass('display-block').addClass('display-none');
			this.notifyBackendOnHidden();
		}, this));
	this.mTurnSequenceBarModule.hide(this.mShowHideModulesDelay);
};


TacticalScreen.prototype.getModule = function (_name)
{
	switch(_name)
	{
		case 'TopbarRoundInformationModule': return this.mTopbarRoundInformationModule;
		case 'TopbarEventLogModule': return this.mTopbarEventLogModule;
		case 'TopbarOptionsModule': return this.mTopbarOptionsModule;
		case 'OrientationOverlayModule': return this.mOrientationOverlayModule;
		case 'TurnSequenceBarModule': return this.mTurnSequenceBarModule;
		default: return null;
	}
};

TacticalScreen.prototype.getModules = function ()
{
	return [
		{ name: 'TopbarRoundInformationModule', module: this.mTopbarRoundInformationModule },
		{ name: 'TopbarEventLogModule', module: this.mTopbarEventLogModule },
		{ name: 'TopbarOptionsModule', module: this.mTopbarOptionsModule },
		{ name: 'OrientationOverlayModule', module: this.mOrientationOverlayModule },
		{ name: 'TurnSequenceBarModule', module: this.mTurnSequenceBarModule }
	];
};


TacticalScreen.prototype.notifyBackendOnConnected = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenConnected');
	}
};

TacticalScreen.prototype.notifyBackendOnDisconnected = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenDisconnected');
	}
};

TacticalScreen.prototype.notifyBackendOnShown = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenShown');
	}
};

TacticalScreen.prototype.notifyBackendOnHidden = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenHidden');
	}
};

TacticalScreen.prototype.notifyBackendOnAnimating = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenAnimating');
	}
};