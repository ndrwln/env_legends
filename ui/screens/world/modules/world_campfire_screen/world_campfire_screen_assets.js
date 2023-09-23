
"use strict";

var WorldCampfireScreenAssets = function(_parent)
{
	// assets labels
	this.mMoneyAsset				= null;
	this.mBusinessRepuationAsset	= null;

	this.mParent					= _parent;
};


WorldCampfireScreenAssets.prototype.getValues = function ()
{
	return this.mParent.mAssetValues;
};

WorldCampfireScreenAssets.prototype.createDIV = function (_parentDiv)
{
	var self = this;

	this.mMoneyAsset = this.createAssetDIV(_parentDiv, Path.GFX + Asset.ICON_ASSET_MONEY, 'is-money');
	this.mBusinessRepuationAsset = this.createAssetDIV(_parentDiv, Path.GFX + Asset.ICON_ASSET_BUSINESS_REPUTATION, 'is-business-reputation');
};

WorldCampfireScreenAssets.prototype.destroyDIV = function ()
{
	this.mMoneyAsset.remove();
	this.mMoneyAsset = null;
	this.mBusinessRepuationAsset.remove();
	this.mBusinessRepuationAsset = null;
};

WorldCampfireScreenAssets.prototype.createAssetDIV = function (_parentDiv, _imagePath, _classExtra)
{
	var layout = $('<div class="l-tab-asset"/>');
	layout.addClass(_classExtra);
	_parentDiv.append(layout);

	var image = $('<img/>');
	image.attr('src', _imagePath);
	layout.append(image);
	var text = $('<div class="label text-font-normal font-color-assets-positive-value"/>');
	layout.append(text);

	return layout;
};

WorldCampfireScreenAssets.prototype.bindTooltips = function ()
{
	this.mMoneyAsset.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.Assets.Money });
	this.mBusinessRepuationAsset.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.Assets.BusinessReputation });
};

WorldCampfireScreenAssets.prototype.unbindTooltips = function ()
{
	this.mMoneyAsset.unbindTooltip();
	this.mBusinessRepuationAsset.unbindTooltip();
};

WorldCampfireScreenAssets.prototype.updateAssetValue = function (_container, _value, _valueMax, _valueDifference)
{
	var label = _container.find('.label:first');

	if(label.length > 0)
	{
		if(_valueMax !== undefined && _valueMax !== null)
		{
			label.html('' + Helper.numberWithCommas(_value) + '/' + Helper.numberWithCommas(_valueMax));
		}
		else
		{
			label.html(Helper.numberWithCommas(_value));
		}

		if(_valueDifference !== null && _valueDifference !== 0)
		{
			label.animateValueAndFadeOut(_valueDifference < 0, function (_element)
			{
				_element.html(_valueDifference);
			});
		}

		if(_value <= 0)
		{
			label.removeClass('font-color-assets-positive-value').addClass('font-color-assets-negative-value');
		}
		else
		{
			label.removeClass('font-color-assets-negative-value').addClass('font-color-assets-positive-value');
		}
	}
};

WorldCampfireScreenAssets.prototype.loadFromData = function (_data)
{
	if(_data === undefined || _data === null || !(typeof(_data) === 'object'))
	{
		return;
	}

	var value = null;
	var previousValue = null;
	var valueDifference = null;
	var currentAssetInformation = _data;
	var previousAssetInformation = this.getValues();

	if('Money' in currentAssetInformation && currentAssetInformation['Money'] !== null)
	{
		value = currentAssetInformation['Money'];
		valueDifference = null;
		if(previousAssetInformation !== null && 'Money' in previousAssetInformation && previousAssetInformation['Money'] !== null)
		{
			previousValue = previousAssetInformation['Money'];
			valueDifference = value - previousValue;
		}

		this.updateAssetValue(this.mMoneyAsset, value, null, valueDifference);
	}

	if ('BusinessReputation' in currentAssetInformation && currentAssetInformation['BusinessReputation'] !== null)
	{
		value = currentAssetInformation['BusinessReputation'];
		valueDifference = null;
		if (previousAssetInformation !== null && 'BusinessReputation' in previousAssetInformation && previousAssetInformation['BusinessReputation'] !== null)
		{
			previousValue = previousAssetInformation['BusinessReputation'];
			valueDifference = value - previousValue;
		}

		this.updateAssetValue(this.mBusinessRepuationAsset, value, null, valueDifference);
	}

	this.mParent.mAssetValues = currentAssetInformation;
};