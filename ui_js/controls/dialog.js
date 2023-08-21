/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 *
 *  @Author:		Overhype Studios
 *  @Date:			01.10.2017
 *  @Description:	Dialog Control JS
 */

"use strict";


/**
 * Create Dialog
 */
 $.fn.createDialog = function(_title, _subTitle, _headerImagePath, _withTabs, _classes)
 {
	var result = $('<div class="ui-control dialog"/>');

	if (_classes !== undefined && _classes !== null && typeof(_classes) === 'string')
	{
		result.addClass(_classes);
	}

	var header = $('<div class="header"/>');
	result.append(header);

	var titleTextContainer = $('<div class="text-container"/>');
	header.append(titleTextContainer);

	// with header image ?
	if (_headerImagePath !== undefined && _headerImagePath !== null && typeof(_headerImagePath) === 'string')
	{
		var headerImageContainer = $('<div class="image-container"/>');
		header.append(headerImageContainer);

		var image = $('<img/>');
		if (_headerImagePath.length > 0)
		{
			image.attr('src', _headerImagePath);
		}
		headerImageContainer.append(image);
	}

	// with header title ?
	if (_title !== undefined && _title !== null && typeof(_title) === 'string')
	{
		var title = $('<div class="title has-no-sub-title title-font-very-big font-bold font-bottom-shadow font-color-title">' + _title + '</div>');
		titleTextContainer.append(title);
	}

	// with header sub-title ?
	if (_subTitle !== undefined && _subTitle !== null && typeof(_subTitle) === 'string')
	{
		if (title !== null)
		{
			title.removeClass('has-no-sub-title').addClass('has-sub-title');
		}
		var subTitle = $('<div class="sub-title text-font-normal font-style-italic font-bottom-shadow font-color-subtitle">' + _subTitle + '</div>');
		titleTextContainer.append(subTitle);
	}

	var content = $('<div class="content"/>');
	result.append(content);

	// with tabs ?
	if (_withTabs !== undefined && _withTabs !== null && _withTabs === true)
	{
		result.addClass('has-tab-container');

		var tabContainer = $('<div class="tab-container"/>');
		content.before(tabContainer);
	}

	var footer = $('<div class="footer"/>');
	result.append(footer);

	this.append(result);

	return result;
};

$.fn.findDialogHeaderContainer = function()
{
	var result = this.find('.header:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findDialogTitle = function()
{
	var result = this.find('.title:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findDialogSubTitle = function()
{
	var result = this.find('.sub-title:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findDialogHeaderImage = function()
{
	var result = this.find('img:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findDialogTabContainer = function()
{
	var result = this.find('.tab-container:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findDialogContentContainer = function()
{
	var result = this.find('.content:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findDialogFooterContainer = function()
{
	var result = this.find('.footer:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.changeDialogFooterRows = function(_rows, _big)
{
	this.removeClass('has-one-row-footer has-two-rows-footer has-three-rows-footer has-four-rows-footer has-five-rows-footer has-six-rows-footer has-big-footer');
	switch(_rows)
	{
		case 1: this.addClass('has-one-row-footer'); break;
		case 2: this.addClass('has-two-rows-footer'); break;
		case 3: this.addClass('has-three-rows-footer'); break;
		case 4: this.addClass('has-four-rows-footer'); break;
		case 5: this.addClass('has-five-rows-footer'); break;
		case 6: this.addClass('has-six-rows-footer'); break;
		default: this.addClass('has-one-row-footer'); break;
	}

	if(_big !== null && _big === true)
	{
		this.addClass('has-big-footer');
	}

	return this;
};