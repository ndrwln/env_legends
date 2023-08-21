/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			22.10.2017
 *  @Description:	Tactical Combat Result Screen - Statistics Panel JS
 */
"use strict";


var TacticalCombatResultScreenStatisticsPanel = function(_dataSource)
{
	this.mDataSource = _dataSource;
 
	// container
	this.mContainer = null;
	this.mStatisticsContainer = null;

	this.registerDatasourceListener();
};


TacticalCombatResultScreenStatisticsPanel.prototype.createDIV = function (_parentDiv)
{
	// create: loot panel (init hidden!)
	this.mContainer = $('<div class="statistics-panel opacity-none"/>');
	_parentDiv.append(this.mContainer);

	// create list
	this.mStatisticsContainerArch = $('<div/>');
	this.mContainer.append(this.mStatisticsContainerArch);

	this.mListContainer = this.mStatisticsContainerArch.createList(2.41, null, true);
	this.mListScrollContainer = this.mListContainer.findListScrollContainer();
	this.mStatisticsContainer = $('<div class="l-list-container"/>');
	this.mListScrollContainer.append(this.mStatisticsContainer);

	this.setupEventHandler();
};

TacticalCombatResultScreenStatisticsPanel.prototype.destroyDIV = function ()
{
	this.mStatisticsContainer.empty();
	this.mStatisticsContainer = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};

TacticalCombatResultScreenStatisticsPanel.prototype.createStatisticEntry = function (_data, _isMiddle)
{
	var entityId = _data[TacticalCombatResultScreenIdentifier.Statistic.Id];

	var statisticContainer = $('<div class="statistic-container"/>');

	if (_isMiddle === true)
	{
		statisticContainer.addClass('is-middle');
	}

	if ('isDead' in _data && _data.isDead == true)
	{
		statisticContainer.addClass('is-dead');
	}
	else if ('isSurvivor' in _data && _data.isSurvivor == true)
	{
		statisticContainer.addClass('is-survivor');
	}

	var columnLeft = $('<div class="column is-left"/>');
	statisticContainer.append(columnLeft);
	var columnRight = $('<div class="column is-right"/>');
	statisticContainer.append(columnRight);

	// left
	var imageOffsetX = (TacticalCombatResultScreenIdentifier.Statistic.ImageOffsetX in _data ? _data[TacticalCombatResultScreenIdentifier.Statistic.ImageOffsetX] : 0);
	var imageOffsetY = (TacticalCombatResultScreenIdentifier.Statistic.ImageOffsetY in _data ? _data[TacticalCombatResultScreenIdentifier.Statistic.ImageOffsetY] : 0);
	var image = columnLeft.createImage(Path.PROCEDURAL + _data[TacticalCombatResultScreenIdentifier.Statistic.ImagePath], function (_image)
	{
		_image.centerImageWithinParent(imageOffsetX, imageOffsetY, 1.0, false);
		_image.removeClass('opacity-none');
	}, null, 'opacity-none');

	image.bindTooltip({ contentType: 'roster-entity', entityId: _data.id });

	// add overlays
	var levelUpContainer = $('<div class="levelup-overlays-container"/>');
	columnLeft.append(levelUpContainer);
	if (TacticalCombatResultScreenIdentifier.Statistic.LeveledUp in _data && _data[TacticalCombatResultScreenIdentifier.Statistic.LeveledUp] === true)
	{
		var valueImage = $('<img/>');
		valueImage.attr('src', Path.GFX + Asset.ICON_LEVELED_UP);
		levelUpContainer.append(valueImage);

		valueImage.bindTooltip({ contentType: 'ui-element', entityId: entityId, elementId: TooltipIdentifier.TacticalCombatResultScreen.StatisticsPanel.LeveledUp });
	}

	var overlaysContainer = $('<div class="overlays-container"/>');
	columnLeft.append(overlaysContainer);

	if (TacticalCombatResultScreenIdentifier.Statistic.DaysWounded in _data && typeof (_data[TacticalCombatResultScreenIdentifier.Statistic.DaysWounded]) === 'number' && _data[TacticalCombatResultScreenIdentifier.Statistic.DaysWounded] > 0)
	{
		var valueImage = $('<img/>');
		valueImage.attr('src', Path.GFX + Asset.ICON_DAYS_WOUNDED);
		overlaysContainer.append(valueImage);

		valueImage.bindTooltip({ contentType: 'ui-element', entityId: entityId, elementId: TooltipIdentifier.TacticalCombatResultScreen.StatisticsPanel.DaysWounded });
	}

	if ('injuries' in _data && _data.injuries != null && _data.injuries.length != 0)
	{
		for (var i = 0; i < _data.injuries.length && i < 3; ++i)
		{
			var valueImage = $('<img/>');
			valueImage.attr('src', Path.GFX + _data.injuries[i].icon);
			overlaysContainer.append(valueImage);

			valueImage.bindTooltip({ contentType: 'status-effect', entityId: entityId, statusEffectId: _data.injuries[i].id });
		}
	}

	// right
	var nameRow = $('<div class="row is-name-container"/>');
	columnRight.append(nameRow);
/*
	var nameContainer = $('<div class="name-container"/>');
	nameRow.append(nameContainer);
*/

	var name;
	if ('isDead' in _data && _data.isDead)
		name = $('<div class="name title-font-normal font-bold font-color-progressbar-label"/>');
	else
		name = $('<div class="name title-font-normal font-bold font-color-subtitle"/>');

	nameRow.append(name);
	if (_data[TacticalCombatResultScreenIdentifier.Statistic.Name] !== null)
	{
		if (_data[TacticalCombatResultScreenIdentifier.Statistic.Title] !== null && _data[TacticalCombatResultScreenIdentifier.Statistic.Title].length > 0)
		{
			name.html(_data[TacticalCombatResultScreenIdentifier.Statistic.Name] + '<br/>' + _data[TacticalCombatResultScreenIdentifier.Statistic.Title]);
		}
		else
		{
			name.html(_data[TacticalCombatResultScreenIdentifier.Statistic.Name]);
		}
	}

	var centerValuesRow = $('<div class="row is-center-container"/>');
	columnRight.append(centerValuesRow);

	// kills
	var value = this.createStatisticValue(Asset.ICON_KILLS, _data[TacticalCombatResultScreenIdentifier.Statistic.KillsMade], entityId, TooltipIdentifier.TacticalCombatResultScreen.StatisticsPanel.KillsValue, _data.isDead);
	centerValuesRow.append(value);
	// damage dealt
	value = this.createStatisticValue(Asset.ICON_DAMAGE_DEALT, _data[TacticalCombatResultScreenIdentifier.Statistic.DamageDealt], entityId, TooltipIdentifier.TacticalCombatResultScreen.StatisticsPanel.DamageDealtValue, _data.isDead);
	centerValuesRow.append(value);
	// xp
	value = this.createStatisticValue(Asset.ICON_XP_RECEIVED, _data[TacticalCombatResultScreenIdentifier.Statistic.XpReceived], entityId, TooltipIdentifier.TacticalCombatResultScreen.StatisticsPanel.XPReceivedValue, _data.isDead);
	centerValuesRow.append(value);
	// damage received
	value = this.createStatisticValue(Asset.ICON_DAMAGE_RECEIVED, _data[TacticalCombatResultScreenIdentifier.Statistic.DamageReceived], entityId, TooltipIdentifier.TacticalCombatResultScreen.StatisticsPanel.DamageReceivedValue, _data.isDead);
	centerValuesRow.append(value);

	return statisticContainer;
};

TacticalCombatResultScreenStatisticsPanel.prototype.createStatisticValue = function (_imagePath, _value, _entityId, _tooltipId, _isDead)
{
	var valueContainer = $('<div class="value-container"/>');
	var valueImage = $('<img/>');
	valueImage.attr('src', Path.GFX + _imagePath);
	valueContainer.append(valueImage);

	if (!_isDead)
	{
		var value = $('<div class="value text-font-normal font-color-description">' + _value + '</div>');
		valueContainer.append(value);
	}
	else
	{
		var value = $('<div class="value text-font-normal font-color-progressbar-label">' + _value + '</div>');
		valueContainer.append(value);
	}

	valueContainer.bindTooltip({ contentType: 'ui-element', entityId: _entityId, elementId: _tooltipId });

	return valueContainer;
};

TacticalCombatResultScreenStatisticsPanel.prototype.addStatistics = function (_data)
{
	this.mStatisticsContainer.empty();

	for (var i = 0; i < _data.length; ++i)
	{
		var result = this.createStatisticEntry(_data[i], _data.length <= 12 && i % 3 == 1);
		if (result !== null)
		{
			this.mStatisticsContainer.append(result);
		}
	}
};


TacticalCombatResultScreenStatisticsPanel.prototype.setupEventHandler = function ()
{
};


TacticalCombatResultScreenStatisticsPanel.prototype.bindTooltips = function ()
{
};

TacticalCombatResultScreenStatisticsPanel.prototype.unbindTooltips = function ()
{
};


TacticalCombatResultScreenStatisticsPanel.prototype.registerDatasourceListener = function()
{
	this.mDataSource.addListener(TacticalCombatResultScreenDatasourceIdentifier.Statistics.Loaded, jQuery.proxy(this.onStatisticsLoaded, this));
};


TacticalCombatResultScreenStatisticsPanel.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.bindTooltips();
};

TacticalCombatResultScreenStatisticsPanel.prototype.destroy = function()
{
	this.unbindTooltips();
	this.destroyDIV();
};


TacticalCombatResultScreenStatisticsPanel.prototype.register = function (_parentDiv)
{
	console.log('TacticalCombatResultScreenStatisticsPanel::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Statistics Panel Module. Reason: Statistics Panel Module is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

TacticalCombatResultScreenStatisticsPanel.prototype.unregister = function ()
{
	console.log('TacticalCombatResultScreenStatisticsPanel::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Statistics Panel Module. Reason: Statistics Panel Module is not initialized.');
		return;
	}

	this.destroy();
};

TacticalCombatResultScreenStatisticsPanel.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};


TacticalCombatResultScreenStatisticsPanel.prototype.show = function ()
{
	// NOTE: (js) HACK which prevents relayouting..
	this.mContainer.removeClass('opacity-none').addClass('opacity-full is-top');
};

TacticalCombatResultScreenStatisticsPanel.prototype.hide = function ()
{
	//this.mContainer.removeClass('display-block').addClass('display-none');
	// NOTE: (js) HACK which prevents relayouting..
	this.mContainer.removeClass('opacity-full is-top').addClass('opacity-none');
};


TacticalCombatResultScreenStatisticsPanel.prototype.onStatisticsLoaded = function (_dataSource, _data)
{
	if (_data === undefined || _data === null || !jQuery.isArray(_data))
	{
		return;
	}

	this.addStatistics(_data);
};