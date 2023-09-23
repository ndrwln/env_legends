/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			15.02.2017
 *  @Description:	Loading Screen JS
 */
"use strict";


var LoadingScreen = function()
{
	this.mSQHandle = null;
	
	// generic containers
	this.mContainer	   = null;
	this.mBackgroundImage = null;
	this.mTipContainer	= null;
	this.mTipOfTheDayLabel = null;

	// timing	
	this.mFadeInOutDelay = 800;//500;
};


LoadingScreen.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

LoadingScreen.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
	this.register($('.root-screen'));
};

LoadingScreen.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	this.unregister();
};


LoadingScreen.prototype.createDIV = function (_parentDiv)
{
	var self = this;

	// create: containers (init hidden!)
	this.mContainer = $('<div class="loading-screen display-none"/>');
	_parentDiv.append(this.mContainer);

	var header = $('<div class="screen-header ui-control"/>');
	// var textContainer = $('<div class="text-container"></div>');
	// header.append(textContainer);
	// var title = $('<div class="title title-font-big font-align-center font-color-subtitle">Progress</div>');
	// textContainer.append(title);
	// this.mTipProgressLabel = $('<div class="text description-font-normal font-color-description"></div>');
	// textContainer.append(this.mTipProgressLabel);
	this.mContainer.append(header);

/* NOTE: Not needed
	var content = $('<div class="screen-content"></div>');
	this.mContainer.append(content);
*/

	this.mBackgroundImage = this.mContainer.createImage(null, function (_image)
	{
		_image.removeClass('display-none').addClass('display-block');
		_image.fitImageToParent();

		self.mContainer.css({ opacity: 0 });
		self.mContainer.velocity("finish", true).velocity({ opacity: 1 },
		{
			duration: self.mFadeInOutDelay,
			easing: 'swing',
			begin: function ()
			{
				$(this).removeClass('display-none').addClass('display-block');
				self.notifyBackendScreenAnimating();
			},
			complete: function ()
			{
				self.notifyBackendScreenShown();
			}
		});
	}, function (_image)
	{
		_image.fitImageToParent();
	}, 'display-none');

	var footer = $('<div class="screen-footer ui-control"></div>');
	this.mContainer.append(footer);
	var textContainer = $('<div class="text-container"></div>');
	footer.append(textContainer);
	var title = $('<div class="title title-font-big font-align-center font-color-subtitle">Tip</div>');
	textContainer.append(title);
	this.mTipContainer = textContainer;
	this.mTipOfTheDayLabel = $('<div class="text description-font-normal font-color-description"></div>');
	textContainer.append(this.mTipOfTheDayLabel);
};

LoadingScreen.prototype.destroyDIV = function ()
{
	this.mTipOfTheDayLabel.remove();
	this.mTipOfTheDayLabel = null;
	
	this.mBackgroundImage.remove();
	this.mBackgroundImage = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


LoadingScreen.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
};

LoadingScreen.prototype.destroy = function()
{
	this.destroyDIV();
};


LoadingScreen.prototype.register = function (_parentDiv)
{
	console.log('LoadingScreen::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Loading Screen. Reason: Main Menu Screen is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

LoadingScreen.prototype.unregister = function ()
{
	console.log('LoadingScreen::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Loading Screen. Reason: Main Menu Screen is not initialized.');
		return;
	}

	this.destroy();
};


LoadingScreen.prototype.show = function (_data)
{
	if (this.mContainer.filter(':animated').length > 0)
	{
		console.log('WARNING: Failed to show Loading Screen. Reason: Loading Screen is currently animating (#1).');
		return;
	}

	if (_data === null || !(LoadingScreenIdentifier.Data.ImagePath in _data) || !(LoadingScreenIdentifier.Data.Text in _data))
	{
		console.log('ERROR: Failed to show Loading Screen. Reason: Invalid data.');
		return;
	}

	this.mTipOfTheDayLabel.html(_data[LoadingScreenIdentifier.Data.Text]);

	// load image
	this.mBackgroundImage.attr('src', Path.GFX + _data[LoadingScreenIdentifier.Data.ImagePath]);
};

LoadingScreen.prototype.hide = function ()
{
	var self = this;
	this.mContainer.velocity("finish", true).velocity({ opacity: 0 },
	{
		duration: this.mFadeInOutDelay,
		easing: 'swing',
		begin: function ()
		{
			self.notifyBackendScreenAnimating();
		},
		complete: function ()
		{
			$(this).removeClass('display-block').addClass('display-none');
			self.mBackgroundImage.attr('src', '');
			self.notifyBackendScreenHidden();
		}
	});
};

LoadingScreen.prototype.updateProgress = function ( _text )
{
	this.mTipOfTheDayLabel.remove();
	this.mTipOfTheDayLabel = $('<div class="text description-font-normal font-color-description">' + _text + '</div>');
	this.mTipContainer.append(this.mTipOfTheDayLabel);
	//this.mTipOfTheDayLabel.html( _text );
}

LoadingScreen.prototype.getModule = function (_name)
{
	switch(_name)
	{
		default: return null;
	}
};

LoadingScreen.prototype.getModules = function ()
{
	return [];
};


LoadingScreen.prototype.notifyBackendScreenShown = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenShown');
	}
};

LoadingScreen.prototype.notifyBackendScreenHidden = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenHidden');
	}
};

LoadingScreen.prototype.notifyBackendScreenAnimating = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenAnimating');
	}
};