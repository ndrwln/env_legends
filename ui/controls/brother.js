/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 *
 *  @Author:		Overhype Studios
 *  @Date:			26.11.2017
 *  @Description:	Brother Control JS
 */
"use strict";

/**
 * Create List Brother
 */
 $.fn.createListBrother = function(_brotherId, _classes)
 {
	var result = $('<div class="ui-control brother is-list-brother"/>');

	if (_classes !== undefined && _classes !== null && typeof(_classes) === 'string')
	{
		result.addClass(_classes);
	}

	// highlight layer
	var highlightLayer = $('<div class="highlight-layer"/>');
	result.append(highlightLayer);
	highlightLayer.createImage(Path.GFX + 'ui/skin/inventory_highlight.png', null, null, null);

	// image layer
	var imageLayer = $('<div class="image-layer"/>');
	result.append(imageLayer);

	/*imageLayer.createImage(null, function (_image)
	{
		var data = result.data('brother');
		_image.removeClass('display-none').addClass('display-block');
		//_image.centerImageWithinParent(data.imageOffsetX, data.imageOffsetY, data.imageScale);
	}, null, 'display-none');*/

	imageLayer.createImage(null, null, null, '');

	// lock layer
	var lockLayer = $('<div class="lock-layer"/>');
	result.append(lockLayer);
	lockLayer.createImage(null, function (_image)
	{
		_image.removeClass('display-none').addClass('display-block');
	}, null, 'display-none');

 	// mood layer
	var moodLayer = $('<div class="mood-layer"/>');
	result.append(moodLayer);
	moodLayer.createImage(null, function (_image)
	{
		_image.removeClass('display-none').addClass('display-block');
	}, null, 'display-none');
	 

	// name layer
	/*var nameLayer = $('<div class="name-layer"/>');
	result.append(nameLayer);
	var nameLabel = $('<div class="label title-font-very-small font-color-brother-name"/>');
	nameLayer.append(nameLabel); */

	// asset layer
	var assetLayer = $('<div class="asset-layer"/>');
	result.append(assetLayer);
	 
	/*var dailyMoneyContainer = $('<div class="daily-money-container"/>');
	var dailyMoneyCostsText = $('<div class="label text-font-small font-color-progressbar-label"/>');
	dailyMoneyContainer.append(dailyMoneyCostsText);
	var dailyMoneyImage = $('<img/>');
	dailyMoneyImage.attr('src', Path.GFX + Asset.ICON_ASSET_DAILY_MONEY);
	dailyMoneyImage.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.Assets.DailyMoney });

	dailyMoneyContainer.append(dailyMoneyImage);
	assetLayer.append(dailyMoneyContainer);*/
	
	var statusContainer = $('<div class="primary-status-container"/>');
	assetLayer.append(statusContainer);

	var statusContainer = $('<div class="status-container"/>');
	assetLayer.append(statusContainer);
		  
	// add data
	var data = this.data('brother') || {};
	data.id = _brotherId || 0;
	data.imageOffsetX = 0;
	data.imageOffsetY = 0;
	data.imageScale = 0;

	result.data('brother', data);

	result.bindTooltip({ contentType: 'roster-entity', entityId: _brotherId });

	this.append(result);

	return result;
};

$.fn.assignListBrotherClickHandler = function(_callback)
{
	if (_callback !== undefined && _callback !== null && typeof(_callback) === 'function')
	{
		this.on('click', null, this, function (event)
		{
			_callback($(this), event);
			return false;
		});
	}
	else
	{
		this.off('click');
	}
};

$.fn.assignListBrotherImage = function(_imagePath, _imageOffsetX, _imageOffsetY, _imageScale)
{
	var imageLayer = this.find('.image-layer:first');
	if (imageLayer.length > 0 && _imagePath !== null)
	{
		var image = imageLayer.find('img:first');

		// update data
		var data = this.data('brother') || {};
		data.imageOffsetX = _imageOffsetX || data.imageOffsetX;
		data.imageOffsetY = _imageOffsetY || data.imageOffsetY;
		data.imageScale = _imageScale || data.imageScale;
		this.data('brother', data);

		if (image.attr('src') == _imagePath)
			return;

		var temp = new Image();
		temp.onload = function ()
		{
			image.attr('src', _imagePath);
			image.centerImageWithinParent(_imageOffsetX, _imageOffsetY, _imageScale, false);
			image.removeClass('display-none').addClass('display-block'); 
		};
		temp.src = _imagePath;
	}
};

$.fn.showListBrotherLockImage = function(_value)
{
	var lockLayer = this.find('.lock-layer:first');
	if (lockLayer.length > 0)
	{
		var image = lockLayer.find('img:first');
		if (_value === true)
		{
			image.attr('src', Path.GFX + Asset.ICON_LOCKED);
		}
		else
		{
			image.attr('src', '');
			image.removeClass('display-block').addClass('display-none');
		}
	}
};


$.fn.showListBrotherMoodImage = function (_value, _image)
{
	var moodLayer = this.find('.mood-layer:first');
	if(moodLayer.length > 0)
	{
		var image = moodLayer.find('img:first');

		if (_image !== undefined)
			image.attr('src', Path.GFX + _image);

		if(_value === true)
		{
			//image.removeClass('display-none').addClass('display-block');
			moodLayer.removeClass('display-none').addClass('display-block');
		}
		else
		{
			//image.removeClass('display-block').addClass('display-none');
			moodLayer.removeClass('display-block').addClass('display-none');
		}
	}
};

$.fn.assignListBrotherDailyMoneyCost = function(_value)
{
	var layer = this.find('.asset-layer:first');
	if (layer.length > 0)
	{
		var label = layer.find('.label:first');
		if (_value !== undefined && _value !== null)
		{
			label.html(_value);
		}
	}
};

$.fn.assignListBrotherDaysWounded = function()
{
	var layer = this.find('.asset-layer:first');
	
	if (layer.length > 0)
	{
		var statusContainer = layer.find('.status-container:first');
		var statusImage = $('<img/>');
		statusImage.attr('src', Path.GFX + Asset.ICON_DAYS_WOUNDED);
		statusContainer.append(statusImage);
		layer.append(statusContainer);
		
		statusImage.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.TacticalCombatResultScreen.StatisticsPanel.DaysWounded });
	}
}

$.fn.assignListBrotherStatusEffect = function (_img, _entityID, _statusEffectID)
{
	var layer = this.find('.asset-layer:first');

	if (layer.length > 0)
	{
		var statusContainer = layer.find('.status-container:first');
		var statusImage = $('<img/>');
		statusImage.attr('src', Path.GFX + _img);
		statusContainer.append(statusImage);
		layer.append(statusContainer);

		statusImage.bindTooltip({ contentType: 'status-effect', entityId: _entityID, statusEffectId: _statusEffectID });
	}
}

$.fn.removeListBrotherStatusEffects = function ()
{
	var layer = this.find('.asset-layer:first');

	if (layer.length > 0)
	{
		var statusContainer = layer.find('.status-container:first');
		statusContainer.empty();
	}
}

$.fn.assignListBrotherLeveledUp = function()
{
	var layer = this.find('.asset-layer:first');
	
	if (layer.length > 0)
	{
		var statusContainer = layer.find('.primary-status-container:first');
		var statusImage = $('<img/>');
		statusImage.attr('src', Path.GFX + Asset.ICON_LEVELED_UP);
		statusContainer.append(statusImage);
		layer.append(statusContainer);
		
		statusImage.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.CharacterScreen.BrothersListModule.LevelUp });
	}
}

$.fn.removeListBrotherLeveledUp = function()
{
	var layer = this.find('.asset-layer:first');
	
	if (layer.length > 0)
	{
		var statusContainer = layer.find('.primary-status-container:first');
		var statusImage = statusContainer.find('img:first');
		if (statusImage.length > 0) 
		{
			statusImage.remove();
		}
	}
}

$.fn.removeListBrotherDaysWounded = function()
{
	var layer = this.find('.asset-layer:first');
	
	if (layer.length > 0)
	{
		var statusContainer = layer.find('.status-container:first');
		var statusImage = statusContainer.find('img:eq(2)');
		if (statusImage.length > 0) 
		{
			statusImage.remove();
		}
	}
}

$.fn.assignListBrotherName = function(_value)
{
	var layer = this.find('.name-layer:first');
	if (layer.length > 0)
	{
		var label = layer.find('.label:first');
		if (_value !== undefined && _value !== null)
		{
			label.html(_value);
		}
	}
};

$.fn.assignListBrotherTooltip = function(_brotherId)
{
	if (_brotherId !== undefined && _brotherId !== null)
	{
		this.bindTooltip({ contentType: 'entity', entityId: _brotherId });
	}
	else
	{
		this.unbindTooltip();
	}
};