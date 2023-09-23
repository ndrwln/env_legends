/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			23.09.2017
 *  @Description:	World Screen JS
 */
"use strict";


var WorldScreen = function()
{
	this.mSQHandle = null;
	this.mTopbarDatasource = new WorldScreenTopbarDatasource();

	// generic containers
	this.mContainer = null;
	this.mDialogContainer = null;
	this.mTopBarContainer = null;
	this.mActiveContractPanelContainer = null;

	// module containers
	this.mLeftModuleContainer = null;
	this.mMiddleModuleContainer = null;
	this.mRightModuleContainer = null;

	// modules
	this.mTopbarOptionsModule  = null;
	this.mTopbarDayTimeModule = null;
	this.mTopbarAssetsModule = null;
	this.mTopbarAmbitionModule = null;
	this.mActiveContractPanelModule = null;

	// current popup dialog
	this.mCurrentPopupDialog = null;
	this.mIsPopupOpen = false;

	this.createModules();
};


WorldScreen.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

WorldScreen.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
	this.register($('.root-screen'));
};

WorldScreen.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;
	this.mTopbarDatasource.onDisconnection();

	this.mTopbarOptionsModule.onDisconnection();
	this.mTopbarDayTimeModule.onDisconnection();
	this.mTopbarAssetsModule.onDisconnection();
	this.mTopbarAmbitionModule.onDisconnection();
	this.mActiveContractPanelModule.onDisconnection();

	this.unregister();
};

WorldScreen.prototype.onModuleOnConnectionCalled = function (_module)
{
	// check if every module is connected
	if ((this.mTopbarOptionsModule !== null && this.mTopbarOptionsModule.isConnected()) &&
		(this.mTopbarDayTimeModule !== null && this.mTopbarDayTimeModule.isConnected()) &&
		(this.mActiveContractPanelModule !== null && this.mActiveContractPanelModule.isConnected()) &&
		(this.mTopbarAmbitionModule !== null && this.mTopbarAmbitionModule.isConnected()) &&
		(this.mTopbarAssetsModule !== null && this.mTopbarAssetsModule.isConnected()) )
	{
		this.notifyBackendOnConnected();
	}
};

WorldScreen.prototype.onModuleOnDisconnectionCalled = function (_module)
{
	// check if every module is disconnected
	if ((this.mTopbarOptionsModule === null && !this.mTopbarOptionsModule.isConnected()) &&
		(this.mTopbarDayTimeModule === null && !this.mTopbarDayTimeModule.isConnected()) &&
		(this.mActiveContractPanelModule === null && !this.mActiveContractPanelModule.isConnected()) &&
		(this.mTopbarAmbitionModule === null && !this.mTopbarAmbitionModule.isConnected()) &&
		(this.mTopbarAssetsModule === null && !this.mTopbarAssetsModule.isConnected()) )
	{
		this.notifyBackendOnDisconnected();
	}
};


WorldScreen.prototype.createDIV = function (_parentDiv)
{
	// create: containers (init hidden!)
	this.mContainer = $('<div class="world-screen ui-control display-none"/>');
	_parentDiv.append(this.mContainer);

	this.mDialogContainer = $('<div class="dialog-container"/>');
	this.mContainer.append(this.mDialogContainer);

	this.mTopBarContainer = $('<div class="topbar-container"/>');
	this.mContainer.append(this.mTopBarContainer);

	// create: module container
	this.mLeftModuleContainer = $('<div class="left-module-container"/>');
	this.mTopBarContainer.append(this.mLeftModuleContainer);
	this.mMiddleModuleContainer = $('<div class="middle-module-container"/>');
	this.mTopBarContainer.append(this.mMiddleModuleContainer);
	this.mRightModuleContainer = $('<div class="right-module-container"/>');
	this.mTopBarContainer.append(this.mRightModuleContainer);

	this.mActiveContractPanelContainer = $('<div class="active-contract-panel-container"/>');
	this.mContainer.append(this.mActiveContractPanelContainer);
};

WorldScreen.prototype.destroyDIV = function ()
{
	this.mLeftModuleContainer.empty();
	this.mLeftModuleContainer = null;
	this.mMiddleModuleContainer.empty();
	this.mMiddleModuleContainer = null;
	this.mRightModuleContainer.empty();
	this.mRightModuleContainer = null;

	this.mDialogContainer.empty();
	this.mDialogContainer = null;

	this.mTopBarContainer.empty();
	this.mTopBarContainer = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


WorldScreen.prototype.createModules = function()
{
	this.mTopbarOptionsModule = new WorldScreenTopbarOptionsModule(this.mTopbarDatasource);
	this.mTopbarOptionsModule.registerEventListener(this);

	this.mTopbarDayTimeModule = new WorldScreenTopbarDayTimeModule(this.mTopbarDatasource);
	this.mTopbarDayTimeModule.registerEventListener(this);

	this.mTopbarAssetsModule = new WorldScreenTopbarAssetsModule(this.mTopbarDatasource);
	this.mTopbarAssetsModule.registerEventListener(this);

	this.mTopbarAmbitionModule = new WorldScreenTopbarAmbitionModule(this.mTopbarDatasource);
	this.mTopbarAmbitionModule.registerEventListener(this);

	this.mActiveContractPanelModule = new WorldScreenActiveContractPanelModule();
	this.mActiveContractPanelModule.registerEventListener(this);
};

WorldScreen.prototype.registerModules = function ()
{
	this.mTopbarOptionsModule.register(this.mRightModuleContainer);
	this.mTopbarDayTimeModule.register(this.mMiddleModuleContainer);
	this.mTopbarAssetsModule.register(this.mLeftModuleContainer);
	this.mTopbarAmbitionModule.register(this.mLeftModuleContainer);
	this.mActiveContractPanelModule.register(this.mActiveContractPanelContainer);
};

WorldScreen.prototype.unregisterModules = function ()
{
	this.mTopbarOptionsModule.unregister();
	this.mTopbarDayTimeModule.unregister();
	this.mTopbarAssetsModule.unregister();
	this.mTopbarAmbitionModule.unregister();
	this.mActiveContractPanelModule.unregister();
};


WorldScreen.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.registerModules();
};

WorldScreen.prototype.destroy = function()
{
	this.unregisterModules();
	this.destroyDIV();
};


WorldScreen.prototype.register = function (_parentDiv)
{
	console.log('WorldScreen::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register World Screen. Reason: World Screen is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

WorldScreen.prototype.unregister = function ()
{
	console.log('WorldScreen::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister World Screen. Reason: World Screen is not initialized.');
		return;
	}

	this.destroy();
};


WorldScreen.prototype.showModules = function (_startCallback, _finishCallback)
{
	if (jQuery.isFunction(_startCallback))
	{
		_startCallback();
	}

	// chain animations
	jQuery.when(
		this.mTopBarContainer.velocity("finish", true).velocity({ top: '0' },
		{
			duration: Constants.MODULE_FADE_IN_OUT_DELAY,
			easing: 'swing',
			begin: function ()
			{
				$(this).removeClass('display-none').addClass('display-block');
			}
		}).promise(),

		this.mActiveContractPanelContainer.velocity("finish", true).velocity({ right: '0.3rem' },
		{
			duration: Constants.MODULE_FADE_IN_OUT_DELAY,
			easing: 'swing',
			begin: function ()
			{
				$(this).removeClass('display-none').addClass('display-block');
			}
		}).promise()
	).done(function ()
	{
		if (jQuery.isFunction(_finishCallback))
		{
			_finishCallback();
		}
	});
};

WorldScreen.prototype.hideModules = function (_startCallback, _finishCallback)
{
	if (jQuery.isFunction(_startCallback))
	{
		_startCallback();
	}

	var topBarContainerYOffset = -(this.mTopBarContainer.parent().height() + this.mTopBarContainer.height());
	var activeContractPanelContainerXOffset = -(this.mActiveContractPanelContainer.parent().width() + this.mActiveContractPanelContainer.width());

	// chain animations
	jQuery.when(
		this.mTopBarContainer.velocity("finish", true).velocity({ top: topBarContainerYOffset },
		{
			duration: Constants.MODULE_FADE_IN_OUT_DELAY,
			easing: 'swing',
			complete: function ()
			{
				$(this).removeClass('display-block').addClass('display-none');
			}
		}).promise(),

		this.mActiveContractPanelContainer.velocity("finish", true).velocity({ right: activeContractPanelContainerXOffset },
		{
			duration: Constants.MODULE_FADE_IN_OUT_DELAY,
			easing: 'swing',
			complete: function ()
			{
				$(this).removeClass('display-block').addClass('display-none');
			}
		}).promise()
	).done(function ()
	{
		if (jQuery.isFunction(_finishCallback))
		{
			_finishCallback();
		}
	});
};


WorldScreen.prototype.show = function (_immediately)
{
	if (_immediately !== undefined && _immediately !== null && _immediately === true)
	{
		this.mTopBarContainer.css({ top: '0' });
		this.mActiveContractPanelContainer.css({ right: '0.3rem' });
		this.mContainer.removeClass('display-none').addClass('display-block');
		this.notifyBackendOnShown();
	}
	else
	{
		this.showModules(jQuery.proxy(function ()
		{
			this.mContainer.removeClass('display-none').addClass('display-block');
			this.notifyBackendOnAnimating();
		}, this),
		jQuery.proxy(function ()
		{
			this.notifyBackendOnShown();
		}, this));
	}
};

WorldScreen.prototype.hide = function (_immediately)
{
	if (_immediately !== undefined && _immediately !== null && _immediately === true)
	{
		var topBarContainerYOffset = -(this.mTopBarContainer.parent().height() + this.mTopBarContainer.height());
		var activeContractPanelContainerXOffset = -(this.mActiveContractPanelContainer.parent().width() + this.mActiveContractPanelContainer.width());

		this.mTopBarContainer.css({ top: topBarContainerYOffset });
		this.mActiveContractPanelContainer.css({ right: activeContractPanelContainerXOffset });

		this.mContainer.removeClass('display-block').addClass('display-none');
		this.notifyBackendOnHidden();
	}
	else
	{
		this.hideModules(jQuery.proxy(function ()
		{
			this.notifyBackendOnAnimating();
		}, this),
		jQuery.proxy(function ()
		{
			this.mContainer.removeClass('display-block').addClass('display-none');
			this.notifyBackendOnHidden();
		}, this));
	}
};


WorldScreen.prototype.getModule = function (_name)
{
	switch(_name)
	{
		case 'TopbarOptionsModule': return this.mTopbarOptionsModule;
		case 'TopbarDayTimeModule': return this.mTopbarDayTimeModule;
		case 'TopbarAssetsModule': return this.mTopbarAssetsModule;
		case 'TopbarAmbitionModule': return this.mTopbarAmbitionModule;
		case 'ActiveContractPanelModule': return this.mActiveContractPanelModule;
		case 'TopbarDatasourceModule': return this.mTopbarDatasource;
		default: return null;
	}
};

WorldScreen.prototype.getModules = function ()
{
	return [
		{ name: 'TopbarOptionsModule', module: this.mTopbarOptionsModule },
		{ name: 'TopbarDayTimeModule', module: this.mTopbarDayTimeModule },
		{ name: 'TopbarAssetsModule', module: this.mTopbarAssetsModule },
		{ name: 'TopbarAmbitionModule', module: this.mTopbarAmbitionModule },
		{ name: 'ActiveContractPanelModule', module: this.mActiveContractPanelModule },
		{ name: 'TopbarDatasourceModule', module: this.mTopbarDatasource }
	];
};


WorldScreen.prototype.notifyBackendOnConnected = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenConnected');
	}
};

WorldScreen.prototype.notifyBackendOnDisconnected = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenDisconnected');
	}
};

WorldScreen.prototype.notifyBackendOnShown = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenShown');
	}
};

WorldScreen.prototype.notifyBackendOnHidden = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenHidden');
	}
};

WorldScreen.prototype.notifyBackendOnAnimating = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenAnimating');
	}
};

WorldScreen.prototype.notifyBackendDevConsoleIsVisible = function (_visible)
{
	this.mIsPopupOpen = _visible;
	SQ.call(this.mSQHandle, 'onDevConsoleIsVisible', [_visible]);
};


WorldScreen.prototype.showDevConsole = function (_immediately)
{
	var self = this;
	self.notifyBackendDevConsoleIsVisible(true);
	self.mCurrentPopupDialog = $('.dialog-container').createPopupDialog('Dev Input', null, null, 'dev-input-popup');

	self.mCurrentPopupDialog.addPopupDialogOkButton(function (_dialog)
	{
		var contentContainer = _dialog.findPopupDialogContentContainer();
		var inputFields = contentContainer.find('input');
		SQ.call(self.mSQHandle, 'onDevConsoleCommand', [ $(inputFields[0]).getInputText(),  $(inputFields[1]).getInputText()]);

		self.mCurrentPopupDialog = null;
		_dialog.destroyPopupDialog();
		self.notifyBackendDevConsoleIsVisible(false);
	});
	
	self.mCurrentPopupDialog.addPopupDialogCancelButton(function (_dialog)
	{
		self.mCurrentPopupDialog = null;
		_dialog.destroyPopupDialog();
		self.notifyBackendDevConsoleIsVisible(false);
	});

	self.mCurrentPopupDialog.addPopupDialogContent(self.createDevConsoleContent(self.mCurrentPopupDialog));

	// focus!
	var inputFields = self.mCurrentPopupDialog.findPopupDialogContentContainer().find('input');
	$(inputFields[0]).focus();
	
};


WorldScreen.prototype.hideDevConsole = function (_immediately)
{
	if (this.mCurrentPopupDialog)
	{
		this.mCurrentPopupDialog.destroyPopupDialog();
		this.mCurrentPopupDialog = null;
		this.notifyBackendDevConsoleIsVisible(false);
	}
};


WorldScreen.prototype.createDevConsoleContent = function (_dialog)
{
	var result = $('<div class="dev-input-container"/>');

	// create & set name
	var row = $('<div class="row"/>');
	result.append(row);
	var label = $('<div class="label text-font-normal font-color-label font-bottom-shadow">Command</div>');
	row.append(label);

	var inputLayout = $('<div class="l-input"/>');
	row.append(inputLayout);
	inputLayout.createInput('', 0, 1024, 1, null, 'title-font-big font-bold font-color-brother-name', function (_input)
	{
		var button = _dialog.findPopupDialogOkButton();
		button.click();
	});

	row = $('<div class="row"/>');
	result.append(row);
	label = $('<div class="label text-font-normal font-color-label font-bottom-shadow">Arguments</div>');
	row.append(label);

	inputLayout = $('<div class="l-input"/>');
	row.append(inputLayout);
	inputLayout.createInput('',0, 255, 2, null, 'title-font-big font-bold font-color-brother-name', function (_input)
	{
		var button = _dialog.findPopupDialogOkButton();
		button.click();
	});

	return result;
};