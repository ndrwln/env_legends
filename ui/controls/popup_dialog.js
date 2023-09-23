/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 *
 *  @Author:		Overhype Studios
 *  @Date:			05.10.2017
 *  @Description:	Popup Dialog Control JS
 */

"use strict";

/*
 Identifiers
 */
var PopupDialogIdentifier = {
	KeyEvent: {
		Namespace: '.popup-dialog'
	}
};

/**
 * Create Popup Dialog
 */
$.fn.createPopupDialog = function(_title, _subTitle, _headerImagePath, _classes, _modalBackground)
{
	var result;
	
	if(_modalBackground === false)
		result = $('<div class="ui-control popup-dialog-dialog-modal-background-transparent"/>');
	else
		result = $('<div class="ui-control popup-dialog-dialog-modal-background"/>');

	var dialog = $('<div class="ui-control popup-dialog"/>');
	result.append(dialog);

	// keep popup centered
	$(window).on('resize' + PopupDialogIdentifier.KeyEvent.Namespace, function ()
	{
		dialog.centerPopupDialogWithinParent();
	});

	if (_classes !== undefined && _classes !== null && typeof(_classes) === 'string')
	{
		dialog.addClass(_classes);
	}

	var header = $('<div class="header has-no-sub-title"/>');
	dialog.append(header);

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
		var title = $('<div class="title title-font-very-big font-bold font-bottom-shadow font-color-title">' + _title + '</div>');
		titleTextContainer.append(title);
	}

	// with header sub-title ?
	if (_subTitle !== undefined && _subTitle !== null && typeof(_subTitle) === 'string')
	{
		header.removeClass('has-no-sub-title').addClass('has-sub-title');
		/*
		if (title !== null)
		{
			title.removeClass('has-no-sub-title').addClass('has-sub-title');
		}*/
		var subTitle = $('<div class="sub-title text-font-normal font-style-italic font-bottom-shadow font-color-subtitle">' + _subTitle + '</div>');
		titleTextContainer.append(subTitle);
	}

	var subHeader = $('<div class="sub-header display-none"/>');
	dialog.append(subHeader);

	var content = $('<div class="content"/>');
	dialog.append(content);

	var footer = $('<div class="footer"/>');
	dialog.append(footer);

	var buttonBar = $('<div class="l-button-bar"/>');
	footer.append(buttonBar);

	this.append(result);

	return result;
};

$.fn.destroyPopupDialog = function()
{
	$(window).off('resize' + PopupDialogIdentifier.KeyEvent.Namespace);
	$(document).off('keyup' + PopupDialogIdentifier.KeyEvent.Namespace);

//	 $(window).off(PopupDialogIdentifier.KeyEvent.Namespace);
//	 $(document).off(PopupDialogIdentifier.KeyEvent.Namespace);

 	this.empty();
 	this.remove();
};

$.fn.findPopupDialog = function()
{
	var result = this.find('.popup-dialog:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findPopupDialogTitle = function()
{
	var result = this.find('.title:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findPopupDialogSubTitle = function()
{
	var result = this.find('.sub-title:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findPopupDialogHeaderImage = function()
{
	var result = this.find('img:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findPopupDialogSubHeaderContainer = function()
{
	var result = this.find('.sub-header:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.findPopupDialogContentContainer = function()
{
	var result = this.find('.content:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};


$.fn.findPopupDialogFooterContainer = function()
{
	var result = this.find('.footer:first');
	if (result.length > 0)
	{
		return result;
	}
	return null;
};

$.fn.addPopupDialogSubHeader = function(_contentDiv)
{
	var result = this.find('.sub-header:first');
	if (result.length > 0 && _contentDiv !== undefined && _contentDiv !== null && _contentDiv.length > 0)
	{
		result.removeClass('display-none').addClass('display-block');
		result.empty();
		result.append(_contentDiv);

		return _contentDiv;
	}
	return null;
};

$.fn.addPopupDialogContent = function(_contentDiv)
{
	var result = this.find('.content:first');
	if (result.length > 0 && _contentDiv !== undefined && _contentDiv !== null && _contentDiv.length > 0)
	{
		result.empty();
		result.append(_contentDiv);

		var dialog = this.find('.popup-dialog:first');
		dialog.css({ width: _contentDiv.outerWidth(true) }); //, height: header.height() + _contentDiv.height() + footer.height() });
		dialog.centerPopupDialogWithinParent();

		return _contentDiv;
	}
	return null;
};

$.fn.findPopupDialogButton = function(_class)
{
	var footer = this.find('.footer:first');
	if (footer.length === 0)
	{
		return null;
	}

	var result = footer.find('.' + _class + ':first');
	if (result.length === 0)
	{
		return null;
	}

	var button = result.find('.button-1:first');
	if (button.length === 0)
	{
		return null;
	}

	return button;
};

$.fn.findPopupDialogOkButton = function()
{
	return this.findPopupDialogButton('l-ok-button');
};

$.fn.findPopupDialogCancelButton = function()
{
	return this.findPopupDialogButton('l-cancel-button');
};

$.fn.addPopupDialogButton = function(_label, _class, _callback, _initiallyDisabled)
{
	var footer = this.find('.footer:first');
	if (footer.length > 0 && _callback !== undefined && jQuery.isFunction(_callback))
	{
		var buttonBar = footer.find('.l-button-bar');
		var buttonLayout = buttonBar.find('.' + _class);
		if (buttonLayout.length === 0)
		{
			buttonLayout = $('<div class="' + _class + '"/>');
			buttonBar.append(buttonLayout);

			var button = buttonLayout.createTextButton(_label, jQuery.proxy(function ()
			{
				_callback(this);
			}, this), '', 1);

			if (_initiallyDisabled !== undefined && _initiallyDisabled === true)
			{
				button.enableButton(false);
			}
		}

		switch(buttonBar.children().length)
		{
			case 2: buttonBar.addClass('has-two-buttons'); break;
		}
	}
	return this;
};

$.fn.addPopupDialogOkButton = function(_callback, _initiallyDisabled)
{
	return this.addPopupDialogButton('Ok', 'l-ok-button', _callback, _initiallyDisabled);
};

$.fn.addPopupDialogCancelButton = function(_callback, _initiallyDisabled)
{
	this.addPopupDialogButton('Cancel', 'l-cancel-button', _callback, _initiallyDisabled);

	// bind global key event handler
	$(document).on('keyup' + PopupDialogIdentifier.KeyEvent.Namespace, null, this, function (_event)
	{
		var self = _event.data;

		switch(_event.which)
		{
			case KeyConstants.Escape:
			{
				if ( _callback !== undefined && jQuery.isFunction(_callback))
				{
					_callback(self);
				}

				_event.preventDefault();
				_event.stopPropagation();

				 break;
			}
		}
	});

	return this;
};

$.fn.centerPopupDialogWithinParent = function()
{
	var dialog = this;
	if (this.hasClass('popup-dialog') !== true)
	{
		dialog = this.find('.popup-dialog:first');
		if (dialog.length === 0)
		{
			return this;
		}
	}

	var parent = this.parent();
	var newWidth = dialog.width();
	var newHeight = dialog.height();
	var marginLeft = (parent.width() - newWidth) / 2;
	var marginTop = (parent.height() - newHeight) / 2;

	this.css({ 'margin-left': marginLeft, 'margin-top': marginTop });

	return this;
};