/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			09.10.2017
 *  @Description:	World Screen: Assets Bar Module JS
 */
"use strict";


var WorldScreenTopbarAssetsModule = function(_dataSource)
{
	this.mSQHandle  = null;
	this.mDataSource = _dataSource;

	// event listener
	this.mEventListener = null;

	// container
	this.mContainer = null;

	// buttons
	this.mMoneyButton = null;
	this.mFoodButton = null;
	this.mAmmoButton = null;
	this.mSuppliesButton = null;
	this.mMedicineButton = null;

	this.registerDatasourceListener();
};


WorldScreenTopbarAssetsModule.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

WorldScreenTopbarAssetsModule.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;

	// notify listener
	if (this.mEventListener !== null && ('onModuleOnConnectionCalled' in this.mEventListener))
	{
		this.mEventListener.onModuleOnConnectionCalled(this);
	}
};

WorldScreenTopbarAssetsModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	// notify listener
	if(this.mEventListener !== null && ('onModuleOnDisconnectionCalled' in this.mEventListener))
	{
		this.mEventListener.onModuleOnDisconnectionCalled(this);
	}
};


WorldScreenTopbarAssetsModule.prototype.createDIV = function (_parentDiv)
{
	// create: container
	this.mContainer = $('<div class="topbar-assets-module"></div>');
	_parentDiv.append(this.mContainer);

	// create: asset container & buttons
	var assetContainer = $('<div class="asset-container is-money has-frame"></div>');
	this.mContainer.append(assetContainer);
	this.mMoneyButton = this.createImageButton(assetContainer, Path.GFX + Asset.ICON_ASSET_MONEY);

	assetContainer = $('<div class="asset-container is-food has-frame"></div>');
	this.mContainer.append(assetContainer);
	this.mFoodButton = this.createImageButton(assetContainer, Path.GFX + Asset.ICON_ASSET_FOOD);

	assetContainer = $('<div class="asset-container is-supplies has-frame"></div>');
	this.mContainer.append(assetContainer);
	this.mSuppliesButton = this.createImageButton(assetContainer, Path.GFX + Asset.ICON_ASSET_SUPPLIES);

	assetContainer = $('<div class="asset-container is-ammo has-frame"></div>');
	this.mContainer.append(assetContainer);
	this.mAmmoButton = this.createImageButton(assetContainer, Path.GFX + Asset.ICON_ASSET_AMMO);

	assetContainer = $('<div class="asset-container is-medicine has-frame"></div>');
	this.mContainer.append(assetContainer);
	this.mMedicineButton = this.createImageButton(assetContainer, Path.GFX + Asset.ICON_ASSET_MEDICINE);
};

WorldScreenTopbarAssetsModule.prototype.destroyDIV = function ()
{
	this.mMoneyButton.remove();
	this.mMoneyButton = null;
	this.mFoodButton.remove();
	this.mFoodButton = null;
	this.mAmmoButton.remove();
	this.mAmmoButton = null;
	this.mSuppliesButton.remove();
	this.mSuppliesButton = null;
	this.mMedicineButton.remove();
	this.mMedicineButton = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


WorldScreenTopbarAssetsModule.prototype.createImageButton = function (_parentDiv, _imagePath, _callback)
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
		return _parentDiv.createCustomButton(layout, _callback);
	}
};

WorldScreenTopbarAssetsModule.prototype.bindTooltips = function ()
{
	this.mMoneyButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.Assets.Money });
	this.mFoodButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.Assets.Food });
	this.mAmmoButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.Assets.Ammo });
	this.mSuppliesButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.Assets.Supplies });
	this.mMedicineButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.Assets.Medicine });
};

WorldScreenTopbarAssetsModule.prototype.unbindTooltips = function ()
{
	this.mMoneyButton.unbindTooltip();
	this.mFoodButton.unbindTooltip();
	this.mAmmoButton.unbindTooltip();
	this.mSuppliesButton.unbindTooltip();
	this.mMedicineButton.unbindTooltip();
};

WorldScreenTopbarAssetsModule.prototype.registerDatasourceListener = function()
{
	this.mDataSource.addListener(WorldScreenTopbarDatasourceIdentifier.AssetsInformation.Updated, jQuery.proxy(this.onAssetsInformation, this));
};


WorldScreenTopbarAssetsModule.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.bindTooltips();
};

WorldScreenTopbarAssetsModule.prototype.destroy = function()
{
	this.unbindTooltips();
	this.destroyDIV();
};


WorldScreenTopbarAssetsModule.prototype.register = function (_parentDiv)
{
	console.log('WorldScreenTopbarAssetsModule::REGISTER');

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

WorldScreenTopbarAssetsModule.prototype.unregister = function ()
{
	console.log('WorldScreenTopbarAssetsModule::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Options Bar Module. Reason: Options Bar Module is not initialized.');
		return;
	}

	this.destroy();
};

WorldScreenTopbarAssetsModule.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};


WorldScreenTopbarAssetsModule.prototype.registerEventListener = function (_listener)
{
	this.mEventListener = _listener;
};


WorldScreenTopbarAssetsModule.prototype.onAssetsInformation = function (_datasource, _data)
{
	if(_data === undefined || _data === null || typeof(_data) !== "object")
	{
		console.error('ERROR: Failed to query assets information data. Reason: Invalid result.');
		return;
	}

	this.updateAssetValue(_data, 'Money', null, this.mMoneyButton);
	this.updateAssetValue(_data, 'Food', null, this.mFoodButton);
	this.updateAssetValue(_data, 'Ammo', null, this.mAmmoButton);
	this.updateAssetValue(_data, 'Supplies', null, this.mSuppliesButton);
	this.updateAssetValue(_data, 'Medicine', null, this.mMedicineButton);
};


WorldScreenTopbarAssetsModule.prototype.updateAssetValue = function (_data, _valueKey, _valueMaxKey, _button)
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

		if (_valueMaxKey !== null &&_valueMaxKey in currentAssetInformation &&
			currentAssetInformation[_valueMaxKey] !== null)
		{
			valueMax = currentAssetInformation[_valueMaxKey];
		}

		var label = _button.find('.label:first');
		if (label.length > 0)
		{
			if (valueMax !== undefined && valueMax !== null) {
				label.html('' + Helper.numberWithCommas(value) + '/' + Helper.numberWithCommas(valueMax));
			}
			else {
				label.html(Helper.numberWithCommas(value));
			}

			if (valueDifference !== null && valueDifference !== 0)
			{
				label.animateValueAndFadeOut(valueDifference < 0, function (_element)
				{
					_element.html(valueDifference);
				});
			}

			if (value <= 0)
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