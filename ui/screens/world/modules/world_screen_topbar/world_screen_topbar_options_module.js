/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			23.09.2017
 *  @Description:	World Screen: Options Bar Module JS
 */
"use strict";


var WorldScreenTopbarOptionsModule = function(_dataSource)
{
	this.mSQHandle  = null;
	this.mDataSource = _dataSource;

	// event listener
	this.mEventListener = null;

	// container
	this.mContainer = null;

	// buttons
	this.mBrothersButton = null;
	this.mRelationsButton = null;
	this.mPerksButton = null;
	this.mCampButton = null;
	this.mCenterButton = null;
	this.mCameraLockButton = null;
	this.mTrackingButton = null;
	this.mObituaryButton = null;
	this.mQuitButton = null;

	this.registerDatasourceListener();
};


WorldScreenTopbarOptionsModule.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

WorldScreenTopbarOptionsModule.prototype.onConnection = function (_handle)
{
	//if (typeof(_handle) == 'string')
	{
		this.mSQHandle = _handle;

		// notify listener
		if (this.mEventListener !== null && ('onModuleOnConnectionCalled' in this.mEventListener)) {
			this.mEventListener.onModuleOnConnectionCalled(this);
		}
	}
};

WorldScreenTopbarOptionsModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	// notify listener
	if (this.mEventListener !== null && ('onModuleOnDisconnectionCalled' in this.mEventListener)) {
		this.mEventListener.onModuleOnDisconnectionCalled(this);
	}
};


WorldScreenTopbarOptionsModule.prototype.createDIV = function (_parentDiv)
{
	var self = this;

	// create: container
	this.mContainer = $('<div class="topbar-options-module"></div>');
	_parentDiv.append(this.mContainer);

	// create: assets
	var assetContainer = $('<div class="asset-container is-brothers"></div>');
	this.mContainer.append(assetContainer);
	this.mBrothersButton = this.createImageButton(assetContainer, Path.GFX + Asset.ICON_ASSET_BROTHERS, function()
	{
		self.notifyBackendBrothersButtonPressed();
	});

	var layout = $('<div class="l-relations-button"/>');
	this.mContainer.append(layout);
	this.mRelationsButton = layout.createImageButton(Path.GFX + Asset.ICON_RELATIONS, function()
	{
		self.notifyBackendRelationsButtonPressed();
	}, '', 6);

	var layout = $('<div class="l-camp-button"/>');
	this.mContainer.append(layout);
	this.mCampButton = layout.createImageButton(Path.GFX + Asset.ICON_CAMP, function()
	{
		self.notifyBackendCampButtonPressed();
	}, '', 6);

	var layout = $('<div class="l-center-button"/>');
	this.mContainer.append(layout);
	this.mCenterButton = layout.createImageButton(Path.GFX + Asset.ICON_CENTER, function()
	{
		self.notifyBackendCenterButtonPressed();
	}, '', 6);

	var layout = $('<div class="l-cameralock-button"/>');
	this.mContainer.append(layout);
	this.mCameraLockButton = layout.createImageButton(Path.GFX + Asset.ICON_CAMERALOCK_DISABLED, function ()
	{
		self.notifyBackendCameraLockButtonPressed();
	}, '', 6);

	var layout = $('<div class="l-tracking-button"/>');
	this.mContainer.append(layout);
	this.mTrackingButton = layout.createImageButton(Path.GFX + Asset.ICON_TRACKING, function()
	{
		self.notifyBackendTrackingButtonPressed();
	}, '', 6);

	layout = $('<div class="l-perks-button"/>');
	this.mContainer.append(layout);
	this.mPerksButton = layout.createImageButton(Path.GFX + Asset.ICON_PERKS, function ()
	{
		self.notifyBackendPerksButtonPressed();
	}, '', 6);

	layout = $('<div class="l-obituary-button"/>');
	this.mContainer.append(layout);
	this.mObituaryButton = layout.createImageButton(Path.GFX + Asset.ICON_OBITUARY, function ()
	{
		self.notifyBackendObituaryButtonPressed();
	}, '', 6);

	layout = $('<div class="l-quit-button"/>');
	this.mContainer.append(layout);
	this.mQuitButton = layout.createImageButton(Path.GFX + Asset.BUTTON_QUIT, function()
	{
		self.notifyBackendQuitButtonPressed();
	}, '', 6);
};

WorldScreenTopbarOptionsModule.prototype.destroyDIV = function ()
{
	this.mBrothersButton.remove();
	this.mBrothersButton = null;
//	 this.mActiveContractButton.remove();
//	 this.mActiveContractButton = null;
	this.mRelationsButton.remove();
	this.mRelationsButton = null;
	this.mQuitButton.remove();
	this.mQuitButton = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};

WorldScreenTopbarOptionsModule.prototype.createImageButton = function (_parentDiv, _imagePath, _callback)
{
	var layout = $('<div class="l-assets-container"/>');
	var image = $('<img/>');
	image.attr('src', _imagePath);
	layout.append(image);
	var text = $('<div class="label text-font-small font-bold font-bottom-shadow font-color-assets-positive-value"/>');
	layout.append(text);

	if (_callback === undefined)
	{
		_parentDiv.append(layout);
		return layout;
	}
	else
	{
		return _parentDiv.createCustomButton(layout, _callback, '', 2);
	}
};

WorldScreenTopbarOptionsModule.prototype.bindTooltips = function ()
{
	this.mBrothersButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.Assets.Brothers });
	this.mRelationsButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldScreen.Topbar.OptionsModule.RelationsButton });
	this.mCameraLockButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldScreen.Topbar.OptionsModule.CameraLockButton });
	this.mCenterButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldScreen.Topbar.OptionsModule.CenterButton });
	this.mTrackingButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldScreen.Topbar.OptionsModule.TrackingButton });
	this.mCampButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldScreen.Topbar.OptionsModule.CampButton });
	this.mPerksButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldScreen.Topbar.OptionsModule.PerksButton });
	this.mObituaryButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldScreen.Topbar.OptionsModule.ObituaryButton });
	this.mQuitButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldScreen.Topbar.OptionsModule.QuitButton });
};

WorldScreenTopbarOptionsModule.prototype.unbindTooltips = function ()
{
	this.mBrothersButton.unbindTooltip();
	this.mCameraLockButton.unbindTooltip();
	this.mCenterButton.unbindTooltip();
	this.mTrackingButton.unbindTooltip();
	this.mCampButton.unbindTooltip();
	this.mPerksButton.unbindTooltip();
	this.mObituaryButton.unbindTooltip();
	this.mQuitButton.unbindTooltip();
};


WorldScreenTopbarOptionsModule.prototype.registerDatasourceListener = function()
{
	this.mDataSource.addListener(WorldScreenTopbarDatasourceIdentifier.AssetsInformation.Updated, jQuery.proxy(this.onAssetsInformation, this));
};


WorldScreenTopbarOptionsModule.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.bindTooltips();
};

WorldScreenTopbarOptionsModule.prototype.destroy = function()
{
	this.unbindTooltips();
	this.destroyDIV();
};


WorldScreenTopbarOptionsModule.prototype.register = function (_parentDiv)
{
	console.log('WorldScreenTopbarOptionsModule::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Options Bar Module. Reason: Options Bar Module is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

WorldScreenTopbarOptionsModule.prototype.unregister = function ()
{
	console.log('WorldScreenTopbarOptionsModule::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Options Bar Module. Reason: Options Bar Module is not initialized.');
		return;
	}

	this.destroy();
};

WorldScreenTopbarOptionsModule.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};


WorldScreenTopbarOptionsModule.prototype.registerEventListener = function (_listener)
{
	this.mEventListener = _listener;
};


WorldScreenTopbarOptionsModule.prototype.updateTrackingButton = function (_enabled)
{
	if(_enabled)
		this.mTrackingButton.changeButtonImage(Path.GFX + Asset.ICON_TRACKING);
	else
		this.mTrackingButton.changeButtonImage(Path.GFX + Asset.ICON_TRACKING_DISABLED);
};

WorldScreenTopbarOptionsModule.prototype.updateCameraLockButton = function (_enabled)
{
	if (_enabled)
		this.mCameraLockButton.changeButtonImage(Path.GFX + Asset.ICON_CAMERALOCK);
	else
		this.mCameraLockButton.changeButtonImage(Path.GFX + Asset.ICON_CAMERALOCK_DISABLED);
};


// WorldScreenTopbarOptionsModule.prototype.highlightCampButton = function (_highlight)
// {
// 	if(_highlight)
// 	{
// 		this.mCampButton.blinkColorIndefinitely();
// 	}
// 	else
// 	{
// 		this.mCampButton.stop();
// 	}
// };


WorldScreenTopbarOptionsModule.prototype.enableCampButton = function (_enabled)
{
	this.mCampButton.enableButton(_enabled);

	if(_enabled)
		this.mCampButton.changeButtonImage(Path.GFX + Asset.ICON_CAMP);
	else
		this.mCampButton.changeButtonImage(Path.GFX + Asset.ICON_CAMP_DISABLED);
};


WorldScreenTopbarOptionsModule.prototype.enablePerksButton = function (_enabled)
{
	this.mPerksButton.enableButton(_enabled);

	if(_enabled)
		this.mPerksButton.removeClass('display-none').addClass('display-block');
	else
		this.mPerksButton.removeClass('display-block').addClass('display-none');
};


WorldScreenTopbarOptionsModule.prototype.onAssetsInformation = function (_datasource, _data)
{
	if (_data === undefined || _data === null || typeof(_data) !== "object")
	{
		console.error('ERROR: Failed to query assets information data. Reason: Invalid result.');
		return;
	}

	this.updateAssetValue(_data, 'Brothers', 'BrothersMax', this.mBrothersButton);
};


WorldScreenTopbarOptionsModule.prototype.updateAssetValue = function (_data, _valueKey, _valueMaxKey, _button)
{
	var currentAssetInformation = _data.current;
	var previousAssetInformation = _data.previous;

	if (_valueKey in currentAssetInformation &&
		currentAssetInformation[_valueKey] !== null)
	{
		var value = currentAssetInformation[_valueKey];
		var valueMax = null;
		var valueDifference = null;

		if (_valueKey in previousAssetInformation &&
			previousAssetInformation[_valueKey] !== null)
		{
			valueDifference = value - previousAssetInformation[_valueKey];
		}

		if (_valueMaxKey !== null && _valueMaxKey in currentAssetInformation &&
			currentAssetInformation[_valueMaxKey] !== null)
		{
			valueMax = currentAssetInformation[_valueMaxKey];
		}

		var label = _button.find('.label:first');
		if (label.length > 0)
		{
			if (valueMax !== undefined && valueMax !== null)
			{
				label.html('' + Helper.numberWithCommas(value) + '/' + Helper.numberWithCommas(valueMax));
			}
			else
			{
				label.html(Helper.numberWithCommas(value));
			}

			if (valueDifference !== null && valueDifference !== 0)
			{
				label.animateValueAndFadeOut(valueDifference < 0, function (_element) {
					_element.html(valueDifference);
				});
			}

			if (value < 0)
			{
				label.removeClass('font-color-assets-positive-value').addClass('font-color-assets-negative-value');
			}
			else
			{
				label.removeClass('font-color-assets-negative-value').addClass('font-color-assets-positive-value');
			}
		}
	}
};


// WorldScreenTopbarOptionsModule.prototype.onContractLoaded = function (_datasource, _data)
// {
//	 if (_data === undefined || _data === null || !(typeof(_data) === 'object'))
//	 {
//		 return;
//	 }
// 
//	 this.mActiveContractButton.enableButton(true);
// 	this.mActiveContractButton.findButtonImage().attr('src', Path.GFX + Asset.ICON_CONTRACT_SCROLL);
// };
// 
// WorldScreenTopbarOptionsModule.prototype.onContractRemoved = function (_datasource, _data)
// {
//	 this.mActiveContractButton.enableButton(false);
// 	this.mActiveContractButton.findButtonImage().attr('src', Path.GFX + Asset.ICON_CONTRACT_SCROLL_DISABLED);
// };


WorldScreenTopbarOptionsModule.prototype.notifyBackendBrothersButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onBrothersButtonPressed');
};

WorldScreenTopbarOptionsModule.prototype.notifyBackendActiveContractButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onActiveContractButtonPressed');
};

WorldScreenTopbarOptionsModule.prototype.notifyBackendRelationsButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onRelationsButtonPressed');
};

WorldScreenTopbarOptionsModule.prototype.notifyBackendCampButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onCampButtonPressed');
};

WorldScreenTopbarOptionsModule.prototype.notifyBackendCameraLockButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onCameraLockButtonPressed');
};

WorldScreenTopbarOptionsModule.prototype.notifyBackendCenterButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onCenterButtonPressed');
};

WorldScreenTopbarOptionsModule.prototype.notifyBackendTrackingButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onTrackingButtonPressed');
};

WorldScreenTopbarOptionsModule.prototype.notifyBackendPerksButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onPerksButtonPressed');
};

WorldScreenTopbarOptionsModule.prototype.notifyBackendObituaryButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onObituaryButtonPressed');
};

WorldScreenTopbarOptionsModule.prototype.notifyBackendQuitButtonPressed = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onQuitButtonPressed');
	}
};