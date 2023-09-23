/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 *
 *  @Author:		Overhype Studios
 *  @Date:			01.10.2017
 *  @Description:	Effects JS
 */

"use strict";


/**
 *	Shakes the Element left/right
 **/
$.fn.shakeLeftRight = function(_times)
{
	this.stop(true, true);
	var times = _times || 2;
	for (var i = 0; i < times; ++i)
	{
		this.velocity({ 'margin-left': '1.0rem' }, { duration: Constants.SHAKE_LEFT_RIGHT_DELAY }).velocity({ 'margin-left': 0 }, { duration: Constants.SHAKE_LEFT_RIGHT_DELAY });
	}
};

$.fn.animateDecreaseValueAndFadeOut = function(_onStartCallback)
{
	var clonedElement = this.clone();
	this.parent().append(clonedElement);
	clonedElement.css({ 'z-index': 100 });
	clonedElement.removeClass('font-color-assets-positive-value').addClass('font-color-assets-negative-value');
	clonedElement.velocity({ opacity: 0, top: '-=4.0rem' }, {
		duration: Constants.MOVE_VALUE_UP_DOWN_AND_FADE_OUT_DELAY,
		begin: function () {
			if (_onStartCallback !== undefined && _onStartCallback !== null && jQuery.isFunction(_onStartCallback))
			{
				_onStartCallback($(this));
			}
		},
		complete: function () {
			$(this).remove();
		}
	});

	return this;
};

$.fn.animateIncreasedValueAndFadeOut = function(_onStartCallback)
{
	var clonedElement = this.clone();
	this.parent().append(clonedElement);
	clonedElement.css({ 'opacity': 0, 'top': '4.0rem', 'z-index': 100 });
	clonedElement.removeClass('font-color-assets-negative-value').addClass('font-color-assets-positive-value');
	clonedElement.velocity({ opacity: 1, top: '-=4.0rem' }, {
		duration: Constants.MOVE_VALUE_UP_DOWN_AND_FADE_OUT_DELAY,
		begin: function () {
			if (_onStartCallback !== undefined && _onStartCallback !== null && jQuery.isFunction(_onStartCallback))
			{
				_onStartCallback($(this));
			}
		},
		complete: function () {
			$(this).remove();
		}
	});

	return this;
};

$.fn.animateValueAndFadeOut = function(_isDecreased, _onStartCallback)
{
	if (_isDecreased === true)
	{
		this.animateDecreaseValueAndFadeOut(_onStartCallback);
	}
	else
	{
		this.animateIncreasedValueAndFadeOut(_onStartCallback);
	}
};

$.fn.blinkColorIndefinitely = function()
{
	var self = this;
	self.animateBackgroundGreyAndTransparent();
}

$.fn.animateBackgroundGreyAndTransparent = function() 
{
	var self = this;
	self.velocity({
		backgroundColor: "rgb(129, 50, 24)"
	}, 2000, self.animateBackgroundTransparent());
}

$.fn.animateBackgroundTransparent = function() 
{
	var self = this;
	self.velocity({
		backgroundColor: "transparent"
	}, 2000, function() {
		self.blinkColorIndefinitely();
	});
}
