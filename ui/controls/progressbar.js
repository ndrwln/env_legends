/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 *
 *  @Author:		Overhype Studios
 *  @Date:			02.12.2017
 *  @Description:	Progressbar Control JS
 */

"use strict";


/**
 * Create Progressbar
 */
$.fn.createProgressbar = function(_withoutPreview, _classes)
{
	var result = $('<div class="ui-control progressbar has-frame"/>');

	var normalBar = $('<div class="normal-bar"/>');
	result.append(normalBar);

	if (!(_withoutPreview !== undefined && _withoutPreview === true))
	{
		var previewBar = $('<div class="preview-bar"/>');
		result.append(previewBar);
	}

	var label = $('<div class="label text-font-small font-color-progressbar-label"/>');
	result.append(label);

	if (_classes !== undefined && _classes !== null && typeof(_classes) === 'string')
	{
		result.addClass(_classes);
	}

	this.append(result);

	return result;
};

$.fn.changeProgressbarWidth = function(_barDiv, _value, _valueMax, _withoutAnimation)
{
	if (_barDiv !== null && _barDiv.length > 0)
	{
		var width = 0;
		if (_value !== undefined && _value !== null && typeof(_value) === 'number' &&
			_valueMax !== undefined && _valueMax !== null && typeof(_value) === 'number' && _valueMax > 0)
		{
			width = (_value * 100) / _valueMax;
			width = Math.max(Math.min(width, 100), 0);
		}

		if (_withoutAnimation !== undefined && _withoutAnimation !== null && _withoutAnimation == true)
		{
			_barDiv.css({ 'width' : width + '%' });
		}
		else
		{
			_barDiv.velocity("stop", true).velocity({ 'width' : width + '%' }, { duration: Constants.PROGRESSBAR_CHANGE_DELAY }); // velocity doesn't always work here?!
		}
	}
	return this;
};

$.fn.changeProgressbarNormalWidth = function(_value, _valueMax, _withoutAnimation)
{
	return this.changeProgressbarWidth(this.find('.normal-bar:first'), _value, _valueMax, _withoutAnimation);
};

$.fn.changeProgressbarPreviewWidth = function(_value, _valueMax, _withoutAnimation)
{
	return this.changeProgressbarWidth(this.find('.preview-bar:first'), _value, _valueMax, _withoutAnimation);
};

$.fn.changeProgressbarNormalAndPreviewWidth = function(_value, _valueMax, _withoutAnimation)
{
	this.changeProgressbarNormalWidth(_value, _valueMax, _withoutAnimation);
	this.changeProgressbarPreviewWidth(_value, _valueMax, _withoutAnimation);
	return this;
};

$.fn.changeProgressbarLabel = function(_value)
{
	var label = this.find('.label:first');
	if (label.length > 0 && _value !== undefined && _value !== null)
	{
		label.html(_value);
	}
	return this;
};

$.fn.bindProgressbarTooltip = function(_tooltipId)
{
	if (_tooltipId === undefined || _tooltipId === null)
	{
		this.unbindTooltip();
	}
	else
	{
		this.bindTooltip({ contentType: 'ui-element', elementId: _tooltipId });
	}
	return this;
};