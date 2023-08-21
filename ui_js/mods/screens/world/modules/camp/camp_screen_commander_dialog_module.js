
"use strict";

var CampScreenCommanderDialogModule = function(_parent)
{
	this.mSQHandle = null;
	this.mParent = _parent;

	this.mRoster = null;
	// assets labels
	this.mAssets = new WorldTownScreenAssets(_parent, true);

	// event listener
	this.mEventListener = null;

	// generic containers
	this.mContainer = null;
	this.mDialogContainer = null;

	//Brother list
	this.mListContainer = null;
	this.mListScrollContainer = null;
	this.mSelectedTent = null;
	this.mTentListContainer = null
	this.mTentListScrollContainer = null;
	this.mTentMap = {};
	
	this.mStatsContainer = null;
	this.mStatsList = [];

	this.mBroListContainer = null;
	this.mBroListScrollContainer = null;

	this.IsMoodVisible = true;

	// buttons
	this.mLeaveButton = null;

	// generics
	this.mIsVisible = false;
};


CampScreenCommanderDialogModule.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

CampScreenCommanderDialogModule.prototype.onConnection = function (_handle)
{
	//if (typeof(_handle) == 'string')
	{
		this.mSQHandle = _handle;

		// notify listener
		if (this.mEventListener !== null && ('onModuleOnConnectionCalled' in this.mEventListener))
		{
			this.mEventListener.onModuleOnConnectionCalled(this);
		}
	}
};

CampScreenCommanderDialogModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	// notify listener
	if (this.mEventListener !== null && ('onModuleOnDisconnectionCalled' in this.mEventListener))
	{
		this.mEventListener.onModuleOnDisconnectionCalled(this);
	}
};

CampScreenCommanderDialogModule.prototype.createDIV = function (_parentDiv)
{
	var self = this;

	// create: containers (init hidden!)
	this.mContainer = $('<div class="l-commander-dialog-container display-none opacity-none"/>');
	_parentDiv.append(this.mContainer);
	this.mDialogContainer = this.mContainer.createDialog('', '', '', true, 'dialog-1280-768');

	// create tabs
	var tabButtonsContainer = $('<div class="l-tab-container"/>');
	this.mDialogContainer.findDialogTabContainer().append(tabButtonsContainer);
		
	// create assets
	this.mAssets.createDIV(tabButtonsContainer);


	// create content
	var content = this.mDialogContainer.findDialogContentContainer();

	// var column = $('<div class="left-column"/>');
	// content.append(column);
	// var listContainerLayout = $('<div class="l-list-container"/>');
	// column.append(listContainerLayout);
	// this.mListContainer = listContainerLayout.createList(1.77/*8.85*/);
	// this.mListScrollContainer = this.mListContainer.findListScrollContainer();

	var column = $('<div class="right-column"/>');
	content.append(column);

	// top row
	var row = $('<div class="top-row"/>');
	column.append(row);
	var listContainerLayout = $('<div class="l-list-container"/>');
	row.append(listContainerLayout)
	this.mTentListContainer = listContainerLayout.createList(1.24/*8.63*/);
	this.mTentListScrollContainer = this.mTentListContainer.findListScrollContainer();

	var row = $('<div class="middle-row"/>');
	column.append(row);

	// bottom row
	row = $('<div class="bottom-row"/>');
	column.append(row);
	var listContainerLayout = $('<div class="l-list-container"/>');
	row.append(listContainerLayout);
	//this.mBroListContainer = listContainerLayout.createList(1.24/*8.63*/);
	this.mBroListScrollContainer = listContainerLayout;//this.mBroListContainer.findListScrollContainer();

	this.mStatsContainer = $('<div class="stats"/>');
	row.append(this.mStatsContainer);
	var tentButtonLayout = $('<div class="tent-button"/>');
	this.mStatsContainer.append(tentButtonLayout);
	this.mTentButton = tentButtonLayout.createTextButton("Building", function()
	{
		if(self.mSelectedTent !== null)
		{
			var data = self.mSelectedTent.data('ID');
			self.notifyBackendTentButtonPressed(data);
		}

	}, '', 1);

	// create footer button bar
	var footerButtonBar = $('<div class="l-button-bar"/>');
	this.mDialogContainer.findDialogFooterContainer().append(footerButtonBar);

	// create: buttons
	var layout = $('<div class="l-leave-button"/>');
	footerButtonBar.append(layout);
	this.mLeaveButton = layout.createTextButton("Leave", function() {
		self.notifyBackendLeaveButtonPressed();
	}, '', 1);

	this.mIsVisible = false;
};

CampScreenCommanderDialogModule.prototype.destroyDIV = function ()
{
	this.mAssets.destroyDIV();

	this.mLeaveButton.remove();
	this.mLeaveButton = null;
	this.mStatsList.forEach(function (c) {
		c.remove();
	})
	this.mStatsContainer.remove();
	this.mStatsContainer = null;



	// this.mListScrollContainer.empty();
	// this.mListScrollContainer = null;
	// this.mListContainer.destroyList();
	// this.mListContainer.remove();
	// this.mListContainer = null;

	this.mTentListScrollContainer.empty();
	this.mTentListScrollContainer = null;
	this.mTentListContainer.destroyList();
	this.mTentListContainer.remove();
	this.mTentListContainer = null;

	this.mBroListScrollContainer.empty();
	this.mBroListScrollContainer = null;
	//this.mBroListContainer.destroyList();
	//this.mBroListContainer.remove();
	//this.mBroListContainer = null;

	this.mDialogContainer.empty();
	this.mDialogContainer.remove();
	this.mDialogContainer = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};

CampScreenCommanderDialogModule.prototype.createBrotherSlots = function (_parentDiv)
{
	var self = this;

	var mSlots = [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null ];

	var dropHandler = function (ev, dd)
	{
		var drag = $(dd.drag);
		var drop = $(dd.drop);
		var proxy = $(dd.proxy);

		if (proxy === undefined || proxy.data('idx') === undefined || drop === undefined || drop.data('idx') === undefined)
		{
			return false;
		}

		drag.removeClass('is-dragged');

		if (drag.data('idx') == drop.data('idx'))
		{
			return false;
		}

		// number in formation is limited
		if (self.mNumActive >= self.mNumActiveMax && drag.data('idx') > 27 && drop.data('idx') <= 27 && self.mSlots[drop.data('idx')].data('child') == null)
		{
			return false;
		}

		// always keep at least 1 in formation
		if (self.mNumActive == 1 && drag.data('idx') <= 27 && drop.data('idx') > 27 && self.mSlots[drop.data('idx')].data('child') == null)
		{
			return false;
		}

		// do the swapping
		self.swapSlots(drag.data('idx'), drop.data('idx'));
	};

	for (var i = 0; i < 27; ++i)
	{
		// if(!reserve)
		//	 mSlots[i] = $('<div class="ui-control is-brother-slot is-roster-slot"/>');
		// else
		mSlots[i] = $('<div class="ui-control is-brother-slot is-roster-slot"/>');

		_parentDiv.append(mSlots[i]);

		mSlots[i].data('idx', i);
		mSlots[i].data('child', null);
		mSlots[i].drop("end", dropHandler);
	}
	return mSlots;

	/*$('.is-brother-slot')
	  .drop("start", function ()
	  {
		  $(this).addClass("is-active-slot");
	  })
	  .drop("end", function ()
	  {
		  $(this).removeClass("is-active-slot");
	  });*/
}


CampScreenCommanderDialogModule.prototype.bindTooltips = function ()
{
	this.mAssets.bindTooltips();
	this.mLeaveButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldTownScreen.HireDialogModule.LeaveButton });
};

CampScreenCommanderDialogModule.prototype.unbindTooltips = function ()
{
	this.mAssets.unbindTooltips();
	this.mLeaveButton.unbindTooltip();
};


CampScreenCommanderDialogModule.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.bindTooltips();
};

CampScreenCommanderDialogModule.prototype.destroy = function()
{
	this.unbindTooltips();
	this.destroyDIV();
};


CampScreenCommanderDialogModule.prototype.register = function (_parentDiv)
{
	console.log('CampScreenCommanderDialogModule::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register World Town Screen Hire Dialog Module. Reason: World Town Screen Hire Dialog Module is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

CampScreenCommanderDialogModule.prototype.unregister = function ()
{
	console.log('CampScreenCommanderDialogModule::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister World Town Screen Hire Dialog Module. Reason: World Town Screen Hire Dialog Module is not initialized.');
		return;
	}

	this.destroy();
};

CampScreenCommanderDialogModule.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};


CampScreenCommanderDialogModule.prototype.registerEventListener = function(_listener)
{
	this.mEventListener = _listener;
};


CampScreenCommanderDialogModule.prototype.show = function (_withSlideAnimation)
{
	var self = this;

	var withAnimation = (_withSlideAnimation !== undefined && _withSlideAnimation !== null) ? _withSlideAnimation : true;
	if (withAnimation === true)
	{
		var offset = -(this.mContainer.parent().width() + this.mContainer.width());
		this.mContainer.css({ 'left': offset });
		this.mContainer.velocity("finish", true).velocity({ opacity: 1, left: '0', right: '0' }, {
			duration: Constants.SCREEN_SLIDE_IN_OUT_DELAY,
			easing: 'swing',
			begin: function () {
				$(this).removeClass('display-none').addClass('display-block');
				self.notifyBackendModuleAnimating();
			},
			complete: function () {
				self.mIsVisible = true;
				self.notifyBackendModuleShown();
			}
		});
	}
	else
	{
		this.mContainer.css({ opacity: 0 });
		this.mContainer.velocity("finish", true).velocity({ opacity: 1 }, {
			duration: Constants.SCREEN_FADE_IN_OUT_DELAY,
			easing: 'swing',
			begin: function() {
				$(this).removeClass('display-none').addClass('display-block');
				self.notifyBackendModuleAnimating();
			},
			complete: function() {
				self.mIsVisible = true;
				self.notifyBackendModuleShown();
			}
		});
	}
};

CampScreenCommanderDialogModule.prototype.hide = function ()
{
	var self = this;

	var offset = -(this.mContainer.parent().width() + this.mContainer.width());
	this.mContainer.velocity("finish", true).velocity({ opacity: 0, left: offset },
	{
		duration: Constants.SCREEN_SLIDE_IN_OUT_DELAY,
		easing: 'swing',
		begin: function ()
		{
			$(this).removeClass('is-center');
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

CampScreenCommanderDialogModule.prototype.isVisible = function ()
{
	return this.mIsVisible;
};


CampScreenCommanderDialogModule.prototype.loadFromData = function (_data)
{
	if(_data === undefined || _data === null)
	{
		return;
	}
	
	if('Title' in _data && _data.Title !== null)
	{
		 this.mDialogContainer.findDialogTitle().html(_data.Title);
	}

	if('SubTitle' in _data && _data.SubTitle !== null)
	{
		 this.mDialogContainer.findDialogSubTitle().html(_data.SubTitle);
	}

	if('Assets' in _data && _data.Assets !== null)
	{
		this.mAssets.loadFromData(_data.Assets);
	}
	
	//this.onBrothersListLoaded(_data.brothers);
	var selectedID = null;
	if (this.mSelectedTent !== null)
	{
		selectedID = this.mSelectedTent.data('ID');
	}

	this.mTentListScrollContainer.empty();
	for(var i = 0; i < _data.buildings.length; ++i)
	{
		var entry = _data.buildings[i];
		var element = this.addTentEntry(entry, i);
		if (entry.id === selectedID)
		{
			this.mSelectedTent = element;
		}
	}

	//this.mListScrollContainer.empty();
	// for(var i = 0; i < _data.brothers.length; ++i)
	// {
	// 	var entry = _data.brothers[i];
	//	 this.addListEntry(entry);
	// }

	if (this.mSelectedTent === null)
	{
		this.selectTentEntry(this.mTentListContainer.findListEntryByIndex(0, '.tent-panel'), true);
	}
	else 
	{
		this.selectTentEntry(this.mSelectedTent);
	}

};

CampScreenCommanderDialogModule.prototype.notifyBackendModuleShown = function ()
{
	SQ.call(this.mSQHandle, 'onModuleShown');
};

CampScreenCommanderDialogModule.prototype.notifyBackendModuleHidden = function ()
{
	SQ.call(this.mSQHandle, 'onModuleHidden');
};

CampScreenCommanderDialogModule.prototype.notifyBackendModuleAnimating = function ()
{
	SQ.call(this.mSQHandle, 'onModuleAnimating');
};

CampScreenCommanderDialogModule.prototype.notifyBackendLeaveButtonPressed = function ()
{
	SQ.call(this.mSQHandle, 'onLeaveButtonPressed');
};


CampScreenCommanderDialogModule.prototype.selectTentEntry = function(_element, _scrollToEntry)
{
	if (_element !== null && _element.length > 0)
	{
		// check if this is already selected
		if (_element.hasClass('is-selected') !== true)
		{
			this.mTentListContainer.deselectListEntries();
			_element.addClass('is-selected');

			// give the renderer some time to layout his shit...
			if (_scrollToEntry !== undefined && _scrollToEntry === true)
			{
				this.mTentListContainer.scrollListToElement(_element);
			}

			this.mSelectedTent = _element;
			var id = _element.data('ID');
			var self = this;
			this.notifyBackendTentSelected(id, function(res) {
				self.onBrothersListLoaded(res.Roster);
				self.mTentButton.changeButtonText(res.Label);
				self.mTentButton.enableButton(res.Enabled);

				self.mStatsList.forEach(function (c) {
					c.remove();
				});
				if ('Modifiers' in res.Modifiers)
				{
					res.Modifiers.Modifiers.forEach(function (m) {
						var text = m[0].toFixed(2) + "% " + m[1];
						var stats = $('<div class="stats-row text-font-small">' + text + '</div>');
						self.mStatsList.push(stats);
						self.mStatsContainer.append(stats);
					})				
				}
			});			
		}
	}
	else
	{
		this.mSelectedTent = null;
	}
};


CampScreenCommanderDialogModule.prototype.addTentEntry = function (_data, _index)
{
	var self = this;
	var dropHandler = function (ev, dd)
	{
		var drag = $(dd.drag);
		var drop = $(dd.drop);
		var proxy = $(dd.proxy);

		if (proxy === undefined || proxy.data('idx') === undefined || drop === undefined || drop.data('idx') === undefined)
		{
			return false;
		}

		drag.removeClass('is-dragged');
		self.notifyBackendBrotherAssigned(drag.data('ID'), drop.data('id'), function( _load ) {
			self.loadFromData(_load);
		})
	};

	var result = $('<div class="ui-control is-camp-action-slot"/>');
	this.mTentListScrollContainer.append(result);
	result.data('idx', _index);
	result.data('id', _data.id);
	result.drop("end", dropHandler);

	var entry = $('<div class="ui-control tent-panel"/>');
	result.append(entry);
	entry.data('entry', _data);
	entry.data('ID', _data.id);
	entry.click(this, function(_event)
	{
		var self = _event.data;
		//self.selectListEntry(null);
		self.selectTentEntry($(this));
	});

	var image = $('<img class="banner"/>');
	image.attr('src', Path.GFX + _data['bannerImage']);
	entry.append(image);

	var image = $('<img class="bro-count"/>');
	image.attr('src', Path.GFX + "ui/icons/asset_brothers.png");
	entry.append(image);

	var label = $('<div class="bro-count-label text-font-normal font-bold font-color-brother-name">'+ _data.count + '</div>');
	entry.append(label);

	if (_data.resourceImage !== '')
	{
		var image = $('<img class="asset-count"/>');
		image.attr('src', Path.GFX + _data.resourceImage);
		entry.append(image);
	
		var label = $('<div class="asset-count-label text-font-normal font-bold font-color-brother-name">'+ _data.resourceCount + '</div>');
		entry.append(label);	
	}

	entry.bindTooltip({ contentType: 'ui-element', elementId: _data.id });

	this.mTentMap[_data.id] = entry;
	return entry

};


CampScreenCommanderDialogModule.prototype.selectListEntry = function(_element, _scrollToEntry)
{
	this.mListContainer.deselectListEntries();
	if (_element !== null && _element.length > 0)
	{
		// check if this is already selected
		//if (_element.hasClass('is-selected') !== true)
		{
		   
			//_element.addClass('is-selected');
			// give the renderer some time to layout his shit...
			if (_scrollToEntry !== undefined && _scrollToEntry === true)
			{
				this.mListContainer.scrollListToElement(_element);
			}

			var data = _element.data('entry');
			var _camp = data.CampAssignment;
			this.selectTentEntry( this.mTentMap[_camp], true);
		}
	}
};


CampScreenCommanderDialogModule.prototype.addListEntry = function (_data)
{
	var result = $('<div class="l-row"/>');
	this.mListScrollContainer.append(result);

	var entry = $('<div class="ui-control list-entry"/>');
	result.append(entry);
	entry.data('ID', _data.ID);
	entry.data('entry', _data);
	entry.click(this, function(_event)
	{
		var self = _event.data;
		self.selectListEntry($(this));
	});

	// left column
	var column = $('<div class="column is-left"/>');
	entry.append(column);

	var imageOffsetX = ('ImageOffsetX' in _data ? _data['ImageOffsetX'] : 0);
	var imageOffsetY = ('ImageOffsetY' in _data ? _data['ImageOffsetY'] : 0);
	column.createImage(Path.PROCEDURAL + _data['ImagePath'], function (_image)
	{
		_image.centerImageWithinParent(imageOffsetX, imageOffsetY, 0.64);
		_image.removeClass('opacity-none');
	}, null, 'opacity-none');

	// right column
	column = $('<div class="column is-right"/>');
	entry.append(column);

	var banner = $('<img class="bro-list-banner"/>');
	banner.attr('src', Path.GFX + _data.CampBanner);
	column.append(banner);

	// top row
	var row = $('<div class="row is-top"/>');
	column.append(row);

	var image = $('<img/>');
	image.attr('src', Path.GFX + _data['BackgroundImagePath']);
	row.append(image);

	// bind tooltip
	image.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.CharacterBackgrounds.Generic, elementOwner: TooltipIdentifier.ElementOwner.HireScreen, entityId: _data.ID });

	var name = $('<div class="name title-font-normal font-bold font-color-brother-name">' + _data[WorldTownScreenIdentifier.HireRosterEntry.Name] + '</div>');
	row.append(name);

	// bottom row
	row = $('<div class="row is-bottom"/>');
	entry.data('bottom', row);
	column.append(row);

	for (var i = 0; i < _data.Skills.length; ++i)
	{
		var icon = $('<img src="' + Path.GFX + _data.Skills[i].icon + '"/>');
		icon.bindTooltip({ contentType: 'status-effect', entityId: _data.ID, statusEffectId: _data.Skills[i].id });
		row.append(icon);
	}

	for (var i = 0; i < _data.Injuries.length; ++i)
	{
		var icon = $('<img src="' + Path.GFX + _data.Injuries[i].icon + '"/>');
		icon.bindTooltip({ contentType: 'status-effect', entityId: _data.ID, statusEffectId: _data.Injuries[i].id });
		row.append(icon);
	}
	return entry
};



CampScreenCommanderDialogModule.prototype.addBrotherSlotDIV = function (_data, _index)
{
	var self = this;
	var _parentDiv = $('<div class="ui-control is-brother-slot"/>')
	//slot.addClass('is-selected');
	this.mBroListScrollContainer.append(_parentDiv);

	// create: slot & background layer
	var isSelected = "";
	if ('IsSelected' in _data && _data.IsSelected)
	{
		isSelected = 'is-selected';
	}

	var result = _parentDiv.createListBrother(_data[CharacterScreenIdentifier.Entity.Id], isSelected);
	result.attr('id', 'slot-index_' + _data[CharacterScreenIdentifier.Entity.Id]);
	result.data('ID', _data[CharacterScreenIdentifier.Entity.Id]);
	result.data('idx', _index);

	// // drag handler
	// result.drag("start", function (ev, dd)
	// {
	//	 // dont allow drag if this is an empty slot
	//	 /*var data = $(this).data('item');
	//	 if (data.isEmpty === true)
	//	 {
	//		 return false;
	//	 }*/

	//	 // build proxy
	//	 var proxy = $('<div class="ui-control brother is-proxy"/>');
	//	 proxy.appendTo(document.body);
	//	 proxy.data('idx', _index);

	//	 var imageLayer = result.find('.image-layer:first');
	//	 if (imageLayer.length > 0)
	//	 {
	//		 imageLayer = imageLayer.clone();
	//		 proxy.append(imageLayer);
	//	 }

	//	 $(dd.drag).addClass('is-dragged');

	//	 return proxy;
	// }, { distance: 3 });

	// result.drag(function (ev, dd)
	// {
	//	 $(dd.proxy).css({ top: dd.offsetY, left: dd.offsetX });
	// }, { relative: false, distance: 3 });

	// result.drag("end", function (ev, dd)
	// {
	//	 var drag = $(dd.drag);
	//	 var drop = $(dd.drop);
	//	 var proxy = $(dd.proxy);

	//	 var allowDragEnd = true; // TODO: check what we're dropping onto

	//	 // not dropped into anything?
	//	 if (drop.length === 0 || allowDragEnd === false)
	//	 {
	//		 proxy.velocity("finish", true).velocity({ top: dd.originalY, left: dd.originalX },
	//		 {
	//			 duration: 300,
	//			 complete: function ()
	//			 {
	//				 proxy.remove();
	//				 drag.removeClass('is-dragged');
	//			 }
	//		 });
	//	 }
	//	 else
	//	 {
	//		 proxy.remove();
	//	 }
	// }, { drop: '.is-camp-action-slot' });

	// update image & name
	var character = _data[CharacterScreenIdentifier.Entity.Character.Key];
	var imageOffsetX = (CharacterScreenIdentifier.Entity.Character.ImageOffsetX in character ? character[CharacterScreenIdentifier.Entity.Character.ImageOffsetX] : 0);
	var imageOffsetY = (CharacterScreenIdentifier.Entity.Character.ImageOffsetY in character ? character[CharacterScreenIdentifier.Entity.Character.ImageOffsetY] : 0);

	result.assignListBrotherImage(Path.PROCEDURAL + character[CharacterScreenIdentifier.Entity.Character.ImagePath], imageOffsetX, imageOffsetY, 0.66);
	//result.assignListBrotherName(character[CharacterScreenIdentifier.Entity.Character.Name]);
	//result.assignListBrotherDailyMoneyCost(character[CharacterScreenIdentifier.Entity.Character.DailyMoneyCost]);

	// if(CharacterScreenIdentifier.Entity.Character.LeveledUp in character && character[CharacterScreenIdentifier.Entity.Character.LeveledUp] === true)
	// {
	//	 result.assignListBrotherLeveledUp();
	// }

	/*if(CharacterScreenIdentifier.Entity.Character.DaysWounded in character && character[CharacterScreenIdentifier.Entity.Character.DaysWounded] === true)
	{
		result.assignListBrotherDaysWounded();
	}*/

	result.showListBrotherMoodImage(true, _data.bannerImage);

	// if('inReserves' in character && character['inReserves'])
	// {
	// 	result.showListBrotherMoodImage(true, 'ui/buttons/mood_heal.png');
	// }
	// else if('moodIcon' in character)
	// {
	// 	result.showListBrotherMoodImage(this.IsMoodVisible, character['moodIcon']);
	// }

	for(var i = 0; i != _data['injuries'].length && i < 3; ++i)
	{
		result.assignListBrotherStatusEffect(_data['injuries'][i].imagePath, _data[CharacterScreenIdentifier.Entity.Id], _data['injuries'][i].id)
	}

	if(_data['injuries'].length <= 2 && _data['stats'].hitpoints < _data['stats'].hitpointsMax)
	{
		result.assignListBrotherDaysWounded();
	}

	result.assignListBrotherClickHandler(function (_brother, _event)
	{
		var _bro = _brother.data('brother');
		self.notifyBackendBrotherAssigned(_bro["id"], self.mSelectedTent.data('ID') , function( _load ) {
			self.loadFromData(_load);
		})

		//self.mDataSource.selectedBrotherById(data.id);
	});
		
	// result.assignListItemRightClick(function (_item, _event)
	// {
	//	 self.notifyBackendBrotherAssigned(_item.data('ID'), 'camp.rest', function( _load ) {
	//		 self.loadFromData(_load);
	//	 })
	// });

};


CampScreenCommanderDialogModule.prototype.onBrothersListLoaded = function (_brothers)
{
	this.mBroListScrollContainer.empty();

	if (_brothers === null || !jQuery.isArray(_brothers) || _brothers.length === 0)
	{
		return;
	}

	for (var i = 0; i < _brothers.length; ++i)
	{
		var brother = _brothers[i];

		if (brother !== null)
		{
			this.addBrotherSlotDIV(brother, i);
		}
	}

	//this.updateBrotherSlotLocks(inventoryMode);
	//this.updateRosterLabel();
};

CampScreenCommanderDialogModule.prototype.notifyBackendTentButtonPressed = function (_entryID, _callback)
{
	SQ.call(this.mSQHandle, 'onTentBuldingClicked', _entryID, _callback);
};

CampScreenCommanderDialogModule.prototype.notifyBackendTentSelected = function (_entryID, _callback)
{
	SQ.call(this.mSQHandle, 'onTentSelected', _entryID, _callback);
};

CampScreenCommanderDialogModule.prototype.notifyBackendBrotherAssigned = function (_broID, _tentID, _callback)
{
	SQ.call(this.mSQHandle, 'onBroAssigned', [_broID, _tentID], _callback);
};
