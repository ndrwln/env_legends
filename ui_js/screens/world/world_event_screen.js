/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2015
 * 
 *  @Author:		Overhype Studios
 *  @Date:			02.06.2015
 *  @Description:	Event Screen
 */
"use strict";


var WorldEventScreen = function()
{
	this.mSQHandle = null;

	// generic containers
	this.mContainer = null;
	this.mDialogContainer = null;
	this.mDialogFooterContainer = null;
	
	this.mContentContainer = null;
	this.mButtonContainer = null;
	
	this.mListContainer = null;
	this.mListScrollContainer = null;
   
	this.mButtons = null;

	this.mCharacterOverlayLeft = null;
	this.mCharacterOverlayRight = null;
	this.mOverlayMiddle = null;

	// generics
	this.mIsVisible = false;	
};


WorldEventScreen.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

WorldEventScreen.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;
	this.register($('.root-screen'));
};

WorldEventScreen.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;
	this.unregister();
};

WorldEventScreen.prototype.createDIV = function (_parentDiv)
{
	// create: containers (init hidden!)
	this.mContainer = $('<div class="world-event-screen ui-control dialog-modal-background display-none opacity-none"/>');
	_parentDiv.append(this.mContainer);

	// create: dialog
	var dialogLayout = $('<div class="l-dialog-container"/>');
	this.mContainer.append(dialogLayout);
	this.mDialogContainer = dialogLayout.createDialog('', null, '', false, 'dialog-800-720');

	// create: character overlays
	this.mCharacterOverlayLeft = $('<div class="world-event-character-left"/>');
	dialogLayout.append(this.mCharacterOverlayLeft);
	this.mCharacterOverlayLeft.createImage('', function (_image)
	{
		_image.centerImageWithinParent(0, 0, 1.0, false);
	}, null, 'display-block');

	this.mCharacterOverlayRight = $('<div class="world-event-character-right"/>');
	dialogLayout.append(this.mCharacterOverlayRight);
	this.mCharacterOverlayRight.createImage('', function (_image)
	{
		_image.centerImageWithinParent(0, 0, 1.0, false);
	}, null, 'display-block');

	this.mOverlayMiddle = $('<div class="world-event-overlay-middle"/>');
	dialogLayout.append(this.mOverlayMiddle);
	this.mOverlayMiddle.createImage('', null, null, 'display-block');

	// create: content
	var content = this.mDialogContainer.findDialogContentContainer();

	// create: list
	var listContainerLayout = $('<div class="l-list-container"/>');
	content.append(listContainerLayout);
	this.mListContainer = listContainerLayout.createList(5, null, true);
	this.mListScrollContainer = this.mListContainer.findListScrollContainer();

	// create :footer button bar
	this.mDialogFooterContainer = $('<div class="l-button-container"/>');
	this.mDialogContainer.findDialogFooterContainer().append(this.mDialogFooterContainer);

	 // create: containers
	this.mContentContainer = $('<div class="world-event-content"/>');
	//content.append(this.mContentContainer);
	this.mListScrollContainer.append(this.mContentContainer);

	// create: containers
	this.mButtonContainer = $('<div class="world-event-buttons"/>');
	this.mDialogFooterContainer.append(this.mButtonContainer);

	this.mIsVisible = false;
};

WorldEventScreen.prototype.destroyDIV = function ()
{
	this.mButtonContainer.empty();
	this.mButtonContainer.remove();
	this.mButtonContainer = null;

	this.mContentContainer.empty();
	this.mContentContainer.remove();
	this.mContentContainer = null;

	this.mListScrollContainer.empty();
	this.mListScrollContainer = null;
	this.mListContainer.destroyList();
	this.mListContainer.remove();
	this.mListContainer = null;

	this.mDialogFooterContainer.empty();
	this.mDialogFooterContainer.remove();
	this.mDialogFooterContainer = null;

	this.mCharacterOverlayLeft.empty();
	this.mCharacterOverlayLeft.remove();
	this.mCharacterOverlayLeft = null;

	this.mCharacterOverlayRight.empty();
	this.mCharacterOverlayRight.remove();
	this.mCharacterOverlayRight = null;

	this.mOverlayMiddle.empty();
	this.mOverlayMiddle.remove();
	this.mOverlayMiddle = null;

	this.mDialogContainer.empty();
	this.mDialogContainer.remove();
	this.mDialogContainer = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


WorldEventScreen.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
};

WorldEventScreen.prototype.destroy = function()
{
	this.destroyDIV();
};


WorldEventScreen.prototype.register = function (_parentDiv)
{
	console.log('WorldEventScreen::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register World Event Screen. Reason: World Event Screen is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

WorldEventScreen.prototype.unregister = function ()
{
	console.log('WorldEventScreen::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister World Event Screen. Reason: World Event Screen is not initialized.');
		return;
	}

	this.destroy();
};


WorldEventScreen.prototype.isVisible = function ()
{
	return this.mIsVisible;
};

WorldEventScreen.prototype.getButtonSize = function ()
{
	return this.mButtons !== null ? this.mButtons.length : 0;
};


WorldEventScreen.prototype.show = function (_data)
{
	this.loadEvent(_data);

	if(!this.mIsVisible)
	{
		var self = this;

		var withAnimation = true;//(_data !== undefined && _data['withSlideAnimation'] !== null) ? _data['withSlideAnimation'] : true;
		if (withAnimation === true)
		{
			var offset = -(this.mContainer.parent().width() + this.mContainer.width());
			this.mContainer.css({ 'left': offset });
			this.mContainer.velocity("finish", true).velocity({ opacity: 1, left: '0', right: '0' },
				{
				duration: Constants.SCREEN_SLIDE_IN_OUT_DELAY,
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
		}
		else
		{
			this.mContainer.css({ opacity: 0 });
			this.mContainer.velocity("finish", true).velocity({ opacity: 1 },
			{
				duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
				easing: 'swing',
				begin: function() {
					$(this).removeClass('display-none').addClass('display-block');
					self.notifyBackendOnAnimating();
				},
				complete: function() {
					self.mIsVisible = true;
					self.notifyBackendOnShown();
				}
			});
		}
	}
};

WorldEventScreen.prototype.hide = function (_eventData, _withSlideAnimation)
{
	var self = this;

	var withAnimation = true;//(_withSlideAnimation !== undefined && _withSlideAnimation !== null) ? _withSlideAnimation : true;
	if (withAnimation === true)
	{
		var offset = -(this.mContainer.parent().width() + this.mContainer.width());
		this.mContainer.velocity("finish", true).velocity({ opacity: 0, left: offset }, {
			duration: Constants.SCREEN_SLIDE_IN_OUT_DELAY,
			easing: 'swing',
			begin: function () {
				$(this).removeClass('is-center');
				self.notifyBackendOnAnimating();
			},
			complete: function () {
				self.mIsVisible = false;
				$(this).removeClass('display-block').addClass('display-none');
				self.notifyBackendOnHidden();
			}
		});
	}
	else
	{
		this.mContainer.velocity("finish", true).velocity({ opacity: 0 }, {
			duration: Constants.SCREEN_SLIDE_IN_OUT_DELAY,
			easing: 'swing',
			begin: function () {
				$(this).removeClass('is-center');
				self.notifyBackendOnAnimating();
			},
			complete: function () {
				self.mIsVisible = false;
				$(this).removeClass('display-block').addClass('display-none');
				self.notifyBackendOnHidden();
			}
		});
	}
};


WorldEventScreen.prototype.getModule = function (_name)
{
	switch(_name)
	{
		default: return null;
	}
};

WorldEventScreen.prototype.getModules = function ()
{
	return [
	];
};


WorldEventScreen.prototype.updateHeader = function (_data)
{
	if(WorldEventIdentifier.Event.Title in _data && _data['title'] !== null)
	{
		this.mDialogContainer.findDialogTitle().html(_data['title']);
	}

	if(WorldEventIdentifier.Event.HeaderImagePath in _data && _data['headerImagePath'] !== null)
	{
		this.mDialogContainer.findDialogHeaderImage().attr('src', Path.GFX + _data['headerImagePath']);
	}

	var characterLeft = this.mCharacterOverlayLeft.find('img:first');
	if(WorldEventIdentifier.Event.CharacterLeft in _data && _data['characterLeft'] !== null)
	{
		if (_data['characterLeft'].IsProcedural)
			characterLeft.attr('src', Path.PROCEDURAL + _data['characterLeft'].Image);
		else
			characterLeft.attr('src', Path.GFX + _data['characterLeft'].Image);

		characterLeft.removeClass('display-none').addClass('display-block');
	}
	else
	{
		characterLeft.attr('src', '');
		characterLeft.removeClass('display-block').addClass('display-none');
	}

	var characterRight = this.mCharacterOverlayRight.find('img:first');
	if(WorldEventIdentifier.Event.CharacterRight in _data && _data['characterRight'] !== null)
	{
		if (_data['characterRight'].IsProcedural)
			characterRight.attr('src', Path.PROCEDURAL + _data['characterRight'].Image);
		else
			characterRight.attr('src', Path.GFX + _data['characterRight'].Image);

		characterRight.removeClass('display-none').addClass('display-block');
	}
	else
	{
		characterRight.attr('src', '');
		characterRight.removeClass('display-block').addClass('display-none');
	}

	var overlayMiddle = this.mOverlayMiddle.find('img:first');
	if('overlayMiddle' in _data && _data['overlayMiddle'] !== null)
	{
		if(_data['overlayMiddle'].IsProcedural)
			overlayMiddle.attr('src', Path.PROCEDURAL + _data['overlayMiddle'].Image);
		else
			overlayMiddle.attr('src', Path.GFX + _data['overlayMiddle'].Image);

		overlayMiddle.removeClass('display-none').addClass('display-block');
	}
	else
	{
		overlayMiddle.attr('src', '');
		overlayMiddle.removeClass('display-block').addClass('display-none');
	}
};


WorldEventScreen.prototype.renderDescription = function (_data)
{
	if (!('text') in _data || _data['text'] === null)
	{
		console.error('Failed to render event description entry. Reason: No text value was given.');
		return;
	}

	var row = $('<div class="row" id="description-' + _data['id'] + '"/>');
	this.mContentContainer.append(row);

	var description = $('<div class="description text-font-medium font-bottom-shadow font-color-description"/>');
	row.append(description);

	var parsedDescriptionText = XBBCODE.process({
		text: _data['text'],
		removeMisalignedTags: false,
		addInLineBreaks: true
	});
	
	description.html(parsedDescriptionText.html);
};

WorldEventScreen.prototype.renderList = function (_data)
{
	var ppp = $('<div class="row"/>');
	this.mContentContainer.append(ppp);
	var description = $('<div class="description text-font-medium font-bottom-shadow font-color-description"/>');
	ppp.append(description);
	//description.html('<br/>');

	var row;
	if(_data.fixed)
		row = $('<div class="row list-container-fixed" id="list-' + _data['id'] + '"/>');
	else
		row = $('<div class="row list-container" id="list-' + _data['id'] + '"/>');

	this.mContentContainer.append(row);

	if('title' in _data && _data['title'] !== null)
	{
		var title = $('<div class="title title-font-normal font-bold font-bottom-shadow font-color-title"/>');
		row.append(title);

		var parsedTitleText = XBBCODE.process({
			text: _data[WorldEventIdentifier.Event.Content.Entry.Type.List.Title],
			removeMisalignedTags: false,
			addInLineBreaks: true
		});
		title.html(parsedTitleText.html);
	}

	if(WorldEventIdentifier.Event.Content.Entry.Type.List.Items.Key in _data &&
		_data[WorldEventIdentifier.Event.Content.Entry.Type.List.Items.Key] !== null &&
		jQuery.isArray(_data[WorldEventIdentifier.Event.Content.Entry.Type.List.Items.Key]) === true)
	{
		var items = _data[WorldEventIdentifier.Event.Content.Entry.Type.List.Items.Key];
		for (var i = 0; i < items.length; ++i)
		{
			this.renderListItem(row, items[i]);
		}
	}
};

WorldEventScreen.prototype.renderListItem = function (_container, _item)
{
	var row = $('<div class="row list"/>');
	_container.append(row);

	if (WorldEventIdentifier.Event.Content.Entry.Type.List.Items.Entry.ImagePath in _item && _item[WorldEventIdentifier.Event.Content.Entry.Type.List.Items.Entry.ImagePath] !== null)
	{
		var image = $('<img/>');
		image.attr('src', Path.GFX + _item[WorldEventIdentifier.Event.Content.Entry.Type.List.Items.Entry.ImagePath]);
		row.append(image);
	}

	if (WorldEventIdentifier.Event.Content.Entry.Type.List.Items.Entry.Text in _item && _item[WorldEventIdentifier.Event.Content.Entry.Type.List.Items.Entry.Text] !== null)
	{
		var text = $('<div class="text text-font-medium font-bottom-shadow font-color-subtitle"/>');
		row.append(text);

		var parsedText = XBBCODE.process({
			text: _item[WorldEventIdentifier.Event.Content.Entry.Type.List.Items.Entry.Text],
			removeMisalignedTags: false,
			addInLineBreaks: true
		});
		text.html(parsedText.html);
	}
};

WorldEventScreen.prototype.renderImage = function (_data)
{
	if (!(WorldEventIdentifier.Event.Content.Entry.Type.Image.ImagePath) in _data || _data[WorldEventIdentifier.Event.Content.Entry.Type.Image.ImagePath] === null)
	{
		console.error('Failed to render Event image entry. Reason: No image path value was given.');
		return;
	}

	var row = $('<div class="row" id="image-' + _data[WorldEventIdentifier.Event.Content.Entry.Id] + '"/>');
	this.mContentContainer.append(row);

	var image = $('<img/>');
	image.attr('src', Path.GFX + _data[WorldEventIdentifier.Event.Content.Entry.Type.Image.ImagePath]);
	row.append(image);
};


WorldEventScreen.prototype.renderContent = function (_data)
{
	this.mContentContainer.empty();

	for(var i = 0; i < _data.length; ++i)
	{
		var entry = _data[i];

		if (!('id' in entry) || entry['id'] === null)
		{
			console.error('Failed to parse event content entry. Reason: Id is missing.');
			continue;
		}
		var id = entry['id'];

		if (!(WorldEventIdentifier.Event.Content.Entry.Type.Key in entry) || entry[WorldEventIdentifier.Event.Content.Entry.Type.Key] === null)
		{
			console.error('Failed to parse event content entry. Reason: Type is missing.');
			continue;
		}

		var type = entry[WorldEventIdentifier.Event.Content.Entry.Type.Key];

		switch(type)
		{
			case WorldEventIdentifier.Event.Content.Entry.Type.Image.Value:
			{
				this.renderImage(entry);
				break;
			} 
			case WorldEventIdentifier.Event.Content.Entry.Type.Description.Value:
			{
				this.renderDescription(entry);
				break;
			} 
			case WorldEventIdentifier.Event.Content.Entry.Type.List.Value:
			{
				this.renderList(entry);
				break;
			}
			default:
			{
				console.error('Failed to parse event content entry. Reason: Unknown type "' + type + '".');
				break;
			}
		}
	}	
};

WorldEventScreen.prototype.renderButtons = function (_data, _hasBigButtons)
{
	this.mButtonContainer.empty();
	this.mButtons = [];

	for(var i = 0; i < _data.length; ++i)
	{
		var entry = _data[i];

		if (!(WorldEventIdentifier.Event.Buttons.Entry.Id in entry) || entry[WorldEventIdentifier.Event.Buttons.Entry.Id] === null)
		{
			console.error('Failed to parse Event buttons entry. Reason: Id is missing.');
			continue;
		}

		this.renderButton(entry, _hasBigButtons);
	}

	this.mDialogContainer.changeDialogFooterRows(this.getButtonSize(), _hasBigButtons);
};

WorldEventScreen.prototype.renderButton = function (_data, _bigButton)
{
	if (!(WorldEventIdentifier.Event.Buttons.Entry.Text) in _data || _data[WorldEventIdentifier.Event.Buttons.Entry.Text] === null)
	{
		console.error('Failed to render Event button entry. Reason: No text value was given.');
		return;
	}

	var buttonId = _data[WorldEventIdentifier.Event.Buttons.Entry.Id];
	var row = $('<div class="row" id="button-' + buttonId + '"/>');
	if (_bigButton) row.addClass('has-big-buttons');
	this.mButtonContainer.append(row);

	var buttonLayout = $('<div class="l-button"/>');
	row.append(buttonLayout);

	var parsedButtonText = XBBCODE.process({
		text: _data[WorldEventIdentifier.Event.Buttons.Entry.Text],
		removeMisalignedTags: false,
		addInLineBreaks: true
	});

	var self = this;
	var button = buttonLayout.createTextButton(parsedButtonText.html, function ()
	{
		self.notifyBackendButtonPressed(buttonId);
	}, '', _bigButton ? 9 : 5, "icon" in _data ? Path.GFX + _data.icon : null);

	if('tooltip' in _data && _data.tooltip != null)
		button.bindTooltip({ contentType: 'verbatim', tooltip: _data.tooltip });

	this.mButtons.push(button);
};


WorldEventScreen.prototype.loadEvent = function (_data)
{
	if (_data === undefined || _data === null || !(typeof(_data) === 'object'))
	{
		return;
	}

	if (WorldEventIdentifier.Event.Content.Key in _data &&
		_data[WorldEventIdentifier.Event.Content.Key] !== null &&
		jQuery.isArray(_data[WorldEventIdentifier.Event.Content.Key]) === true)
	{
		this.updateHeader(_data);
		this.renderContent(_data[WorldEventIdentifier.Event.Content.Key]);
		this.renderButtons(_data[WorldEventIdentifier.Event.Buttons.Key], _data.hasBigButtons);
	}
};

WorldEventScreen.prototype.notifyBackendOnConnected = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenConnected');
	}
};

WorldEventScreen.prototype.notifyBackendOnDisconnected = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenDisconnected');
	}
};

WorldEventScreen.prototype.notifyBackendOnShown = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenShown');
	}
};

WorldEventScreen.prototype.notifyBackendOnHidden = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenHidden');
	}
};

WorldEventScreen.prototype.notifyBackendOnAnimating = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onScreenAnimating');
	}
};

WorldEventScreen.prototype.notifyBackendButtonPressed = function (_buttonID)
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onButtonPressed', _buttonID);
	}
};