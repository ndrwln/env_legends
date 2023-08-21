/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			01.10.2017
 *  @Description:	Credits JS
 */
"use strict";


var CreditsModule = function(_alignment)
{
	this.mSQHandle = null;

	// event listener
	this.mEventListener = null;

	// generic containers
	this.mContainer = null;
	this.mText = null;

	// generics
	this.mIsVisible = false;
};


CreditsModule.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

CreditsModule.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;

	// notify listener
	if (this.mEventListener !== null && ('onModuleOnConnectionCalled' in this.mEventListener))
	{
		this.mEventListener.onModuleOnConnectionCalled(this);
	}
};

CreditsModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	// notify listener
	if (this.mEventListener !== null && ('onModuleOnDisconnectionCalled' in this.mEventListener))
	{
		this.mEventListener.onModuleOnDisconnectionCalled(this);
	}
};


CreditsModule.prototype.createDIV = function (_parentDiv)
{
	// create: containers (init hidden!)
	this.mContainer = $('<div class="credits-module ui-control display-none"></div>');
	this.mContainer.addClass(this.mAlignmentClass);
	_parentDiv.append(this.mContainer);

	// text
	this.mText = $('<div class="crawler text-font-very-big font-shadow-silhouette font-color-white"/>');
	this.mContainer.append(this.mText);

	this.mIsVisible = false;
};

CreditsModule.prototype.destroyDIV = function ()
{
	this.mText = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


CreditsModule.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
};

CreditsModule.prototype.destroy = function()
{
	this.destroyDIV();
};


CreditsModule.prototype.register = function (_parentDiv)
{
	console.log('CreditsModule::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Credits Module. Reason: Already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

CreditsModule.prototype.unregister = function ()
{
	console.log('CreditsModule::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Credits Module. Reason: Not initialized.');
		return;
	}

	this.destroy();
};

CreditsModule.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};


CreditsModule.prototype.registerEventListener = function(_listener)
{
	this.mEventListener = _listener;
};


CreditsModule.prototype.show = function (_text)
{
	var parsedText = XBBCODE.process({
		text: _text,
		removeMisalignedTags: false,
		addInLineBreaks: true
	});
	
	this.mText.html(parsedText.html);

	this.notifyBackendModuleShown();

	var self = this;
	var offset = this.mContainer.height();
	var textHeight = 5500;
	/*var textHeight = this.mText.height();*/

	this.mContainer.css({ top: offset * 2, opacity: 1 });
	this.mContainer.velocity("finish", true).velocity({ top: -textHeight },
	{
		duration: textHeight * 20,
		easing: 'linear',
		begin: function ()
		{
			$(this).removeClass('display-none').addClass('display-block');
			self.mIsVisible = true;
			//self.notifyBackendModuleAnimating();
		},
		complete: function ()
		{
			self.mIsVisible = true;
			self.notifyBackendDone();
		}
	});
};

CreditsModule.prototype.hide = function ()
{
	var self = this;

	this.mContainer.velocity("finish", true).velocity({ opacity: 0 },
	{
		duration: Constants.SCREEN_SLIDE_IN_OUT_DELAY,
		easing: 'swing',
		begin: function ()
		{
			self.notifyBackendModuleAnimating();
		},
		complete: function ()
		{
			self.mIsVisible = false;
			$(this).removeClass('display-block').addClass('display-none');
			self.notifyBackendModuleHidden();
		}
	});
};

CreditsModule.prototype.isVisible = function ()
{
	return this.mIsVisible;
};


CreditsModule.prototype.notifyBackendModuleShown = function ()
{
	SQ.call(this.mSQHandle, 'onModuleShown');
};

CreditsModule.prototype.notifyBackendModuleHidden = function ()
{
	SQ.call(this.mSQHandle, 'onModuleHidden');
};

CreditsModule.prototype.notifyBackendModuleAnimating = function ()
{
	SQ.call(this.mSQHandle, 'onModuleAnimating');
};

CreditsModule.prototype.notifyBackendDone = function ()
{
	SQ.call(this.mSQHandle, 'onDone');
};