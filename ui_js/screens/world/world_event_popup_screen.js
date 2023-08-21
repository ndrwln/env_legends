/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2015
 * 
 *  @Author:		Overhype Studios
 *  @Date:			01.03.2015
 *  @Description:	World Event Popup JS
 */
"use strict";


var WorldEventPopupScreen = function()
{
	this.mSQHandle = null;
	//this.mDataSource = new WorldEventPopupScreen();

	// generic containers
	this.mContainer = null;
	this.mDialogContainer = null;

	// buttons
	this.mLeaveButton = null;
	this.mText = null;

	//this.registerDatasourceListener();
};


WorldEventPopupScreen.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

WorldEventPopupScreen.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
	this.register($('.root-screen'));
};

WorldEventPopupScreen.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	this.unregister();
};


WorldEventPopupScreen.prototype.createDIV = function (_parentDiv)
{
	var self = this;

	// create: containers (init hidden!)
	this.mContainer = $('<div class="world-event-popup ui-control dialog-modal-background display-none opacity-none"/>');
	_parentDiv.append(this.mContainer);
};

WorldEventPopupScreen.prototype.destroyDIV = function ()
{
	if(this.mLeaveButton != null)
	{
		this.mLeaveButton.remove();
		this.mLeaveButton = null;
	}

	if(this.mContentContainer != null)
	{
		this.mContentContainer.remove();
		this.mContentContainer = null;
	}

	if(this.mDialogContainer != null)
	{
		this.mDialogContainer.empty();
		this.mDialogContainer.remove();
		this.mDialogContainer = null;
	}

	if(this.mContainer != null)
	{
		this.mContainer.empty();
		this.mContainer.remove();
		this.mContainer = null;
	}
};


WorldEventPopupScreen.prototype.registerDatasourceListener = function()
{
	//this.mDataSource.addListener(Tactical.CombatInformation.Loaded, jQuery.proxy(this.onCombatInformation, this));
};


WorldEventPopupScreen.prototype.bindTooltips = function ()
{
	//this.mFleeButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.TacticalCombatResultScreen.LeaveButton });
};

WorldEventPopupScreen.prototype.unbindTooltips = function ()
{
	//this.mFleeButton.unbindTooltip();
};

WorldEventPopupScreen.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.bindTooltips();
};

WorldEventPopupScreen.prototype.destroy = function()
{
	this.unbindTooltips();
	this.destroyDIV();
};


WorldEventPopupScreen.prototype.register = function (_parentDiv)
{
	console.log('WorldEventPopupScreen::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register World Event Popup. Reason: World Event Popup is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

WorldEventPopupScreen.prototype.unregister = function ()
{
	console.log('WorldEventPopupScreen::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister World Event Popup. Reason: World Event Popup is not initialized.');
		return;
	}

	this.destroy();
};


WorldEventPopupScreen.prototype.show = function ()
{
	var self = this;
	this.mContainer.velocity("finish", true).velocity({ opacity: 1 },
	{
		duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
		easing: 'swing',
		begin: function ()
		{
			$(this).removeClass('display-none').addClass('display-block');
			self.notifyBackendOnAnimating();
		},
		complete: function ()
		{
			self.mIsVisible = true;
			self.notifyBackendOnShown();
		}
	});
};

WorldEventPopupScreen.prototype.hide = function ()
{
	var self = this;

	this.mContainer.velocity("finish", true).velocity({ opacity: 0 },
	{
		duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
		easing: 'swing',
		begin: function ()
		{
			self.notifyBackendOnAnimating();
		},
		complete: function ()
		{
			self.mIsVisible = false;
			$(this).removeClass('display-block').addClass('display-none');
			self.notifyBackendOnHidden();
		}
	});
};


WorldEventPopupScreen.prototype.getModule = function (_name)
{
	switch(_name)
	{
		default: return null;
	}
};

WorldEventPopupScreen.prototype.getModules = function ()
{
	return [
	];
};

WorldEventPopupScreen.prototype.loadFromData = function (_data)
{
	if (_data === undefined || _data == null || typeof(_data) !== 'object')
	{
		console.error('ERROR: Failed to query event popup screen data. Reason: Invalid result.');
		return;
	}

	var self = this;
	var size = _data['Size'];
	var title = _data['Title'];
	var subtitle = _data['SubTitle'];
	var text = XBBCODE.process({
		text: _data['Text'],
		removeMisalignedTags: false,
		addInLineBreaks: true
	});
	var buttonLabel = _data['ButtonLabel'];

	// set dialog container
	if(this.mDialogContainer != null)
	{
		this.mDialogContainer.remove();
		this.mDialogContainer = null;
	}

	var dialogLayout = $('<div class="l-dialog-container"/>');
	this.mContainer.append(dialogLayout);
	this.mDialogContainer = dialogLayout.createDialog(title, subtitle == '' ? null : subtitle, null, false, 'dialog-800-720-2');

	this.mContainer.addClass('world-event-popup');
	
	// create footer button bar
	var footerButtonBar = $('<div class="l-button-bar"></div>');
	this.mDialogContainer.findDialogFooterContainer().append(footerButtonBar);

	// create: buttons
	var layout = $('<div class="l-event-leave-button"/>');
	footerButtonBar.append(layout);
	this.mLeaveButton = layout.createTextButton(buttonLabel, function ()
	{
		self.notifyBackendLeaveButtonPressed();
	}, '', 1);

	// set titles
	//this.mDialogContainer.findDialogTitle().html(title);
	//this.mDialogContainer.findDialogSubTitle().html(subtitle);

	// set content
	this.mContentContainer = this.mDialogContainer.findDialogContentContainer();

	var rightColumn = $('<div class="right-column "/>');
	this.mContentContainer.append(rightColumn);
	
	var titleLabel = $('<div class="event-title-label title-font-normal font-bold font-color-title">' + '' + '</div>');
	rightColumn.append(titleLabel);

	var textLabel = $('<div class="event-text text-font-medium font-color-description font-style-normal">' + text.html + '</div>');
	rightColumn.append(textLabel);

	// set button
	//this.mLeaveButton.find('.label:first').html(buttonLabel);
}

WorldEventPopupScreen.prototype.notifyBackendOnConnected = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenConnected');
	}
};

WorldEventPopupScreen.prototype.notifyBackendOnDisconnected = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenDisconnected');
	}
};

WorldEventPopupScreen.prototype.notifyBackendOnShown = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenShown');
	}
};

WorldEventPopupScreen.prototype.notifyBackendOnHidden = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenHidden');
	}
};

WorldEventPopupScreen.prototype.notifyBackendOnAnimating = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenAnimating');
	}
};

WorldEventPopupScreen.prototype.notifyBackendLeaveButtonPressed = function ()
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onLeavePressed');
	}
};