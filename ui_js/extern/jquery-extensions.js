/*
 *  @Project:		Untitled Project
 *
 *	@Copyright:		(c) Overhype Studios | 2013
 * 
 *  @Author:		Overhype Studios
 *  @Date:			16.10.2013
 *  @Description:	jquery extensions 
 */
 
/**
 * Computes the actual width of an emelent which contains text
 */
 $.fn.textWidth = function(text, font) {
	if (!$.fn.textWidth.fakeEl) $.fn.textWidth.fakeEl = $('<span>').hide().appendTo(document.body);
	$.fn.textWidth.fakeEl.html(text || this.val() || this.text()).css({'font': font || this.css('font'),
		'font-size': this.css('font-size'),
		'font-weight': this.css('font-weight'),
		'font-style': this.css('font-style'),
		'font-family': this.css('font-family'),
	});
	return $.fn.textWidth.fakeEl.width();
};


$.fn.getBackgroundColorAsString = function (_alpha)
{
	var bgColor = tinycolor(this.css('backgroundColor'));
	if (_alpha !== undefined && _alpha !== null)
	{
		var bgColorObject = bgColor.toRgb();
		var result = 'rgba(' + bgColorObject.r + ',' + bgColorObject.g + ',' + bgColorObject.b + ',' + _alpha + ')';
		return result;
	}
	return bgColor.toRgbString();
};


/**
 *	Center the Div ´within its parent while keeping the aspect ration
**/
/*
$.fn.centerToParent = function ()
{
	var parentDiv = this.parent();

	if (parentDiv.length === 0) {
		console.log('ERROR: Failed to center element. Reason: Element has no parent.');
		return;
	}

	this.css({ width: '', height: '' }); // reset previous styles

	var containerWidth = parentDiv.innerWidth();
	var containerHeight = parentDiv.innerHeight();

	var imageWidth = this[0].naturalWidth; // this.outerWidth(true);
	var imageHeight = this[0].naturalHeight; // this.outerHeight(true);
	var imageAspectRatio = imageHeight / (imageWidth > 0 ? imageWidth : 1);

	// adjust width
	if (imageWidth > containerWidth)
	{
		var widthOffset = imageWidth - containerWidth;
		imageWidth = imageWidth - widthOffset;
		imageHeight = imageWidth * imageAspectRatio;
		this.css({ width: imageWidth, height: imageHeight });
	}

	//console.dir(this);
	//console.info('imageWidth: ' + imageWidth  + ' - imageHeight: ' + imageHeight + ' - containerWidth: ' + containerWidth + ' - containerHeight: ' + containerHeight);

	// center image
	var imageLeft = (containerWidth / 2) - (imageWidth / 2);
	var imageTop = (containerHeight / 2) - (imageHeight / 2);
	this.css({ top: imageTop, left: imageLeft });
};
*/

/**
 *	Checks if the Element within the DOM
**/
$.fn.isInDOM = function()
{
	return this.parents(document).length > 0;
};

/**
 *	Checks if the Element within the DOM
**/
$.fn.nodeInserted = function(_callback)
{
	var _insertListener = function(_event) {
		var event = _event.originalEvent || _event;
		if (event.animationName == "node-inserted-animation") {
			var element = $(_event.target);
			
			if (element.length > 0)
			{
				// cleanup
				element.removeClass('node-inserted-listener');
				element.off('.node-insert-listener');

				// callback
				if (_event.data !== undefined && typeof(_event.data) === 'function')
				{
					_event.data(element);
				}
			}

			_event.preventDefault();
		}
	};

	// register listener
	this.addClass('node-inserted-listener');
	this.on('animationstart.node-insert-listener', null, _callback, _insertListener);
	this.on('webkitAnimationStart.node-insert-listener', null, _callback, _insertListener);
};