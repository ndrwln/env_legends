/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			22.11.2017
 *  @Description:	World Screen: Active Contract Panel Module JS
 */
"use strict";


var WorldScreenActiveContractPanelModule = function()
{
	this.mSQHandle  = null;

	// event listener
	this.mEventListener = null;

	// container
	this.mContainer = null;
	this.mContentContainer = null;
	this.mContractContentContainer = null;
	this.mTitleContainer = null;

	// buttons
	this.mToggleVisibilityButton = null;

	// sub modules
	this.mContentModule = null;

	// generics
	this.mIsToggledVisible = true;
	this.mIsVisible = false;
};


WorldScreenActiveContractPanelModule.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

WorldScreenActiveContractPanelModule.prototype.onConnection = function (_handle)
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

WorldScreenActiveContractPanelModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	// notify listener
	if (this.mEventListener !== null && ('onModuleOnDisconnectionCalled' in this.mEventListener))
	{
		this.mEventListener.onModuleOnDisconnectionCalled(this);
	}
};


WorldScreenActiveContractPanelModule.prototype.createDIV = function (_parentDiv)
{
	var self = this;

	// create: container
	this.mContainer = $('<div class="active-contract-panel-module display-none"/>');
	_parentDiv.append(this.mContainer);

	// create: header
	var headerContainer = $('<div class="header-container"/>');
	this.mContainer.append(headerContainer);

	headerContainer.click(function()
	{
		self.toggleVisiblility(true);
	});

	var buttonLayout = $('<div class="l-hide-button"/>');
	headerContainer.append(buttonLayout);
	this.mToggleVisibilityButton = buttonLayout.createImageButton(Path.GFX + Asset.ICON_CONTRACT_SCROLL, function(_button)
	{
		_button.hideTooltip();
		//self.toggleVisiblility(true);
		self.notifyBackendShowContractDetails();
	}, '', 6);

	var titleContainer = $('<div class="title-container"/>');
	headerContainer.append(titleContainer);

	this.mTitleContainer = $('<div class="title title-font-normal font-bold font-color-ink"/>');
	titleContainer.append(this.mTitleContainer);

	// create: content
	this.mContentContainer = $('<div class="content-container"/>');
	this.mContainer.append(this.mContentContainer);

	var contentDivider = $('<div class="divider"/>');
	this.mContentContainer.append(contentDivider);

	// create: list
	this.mContractContentContainer = $('<div class="l-list-container"/>');
	this.mContentContainer.append(this.mContractContentContainer);

	/*
	var listContainerLayout = $('<div class="l-list-container"/>');
	this.mContractContentContainer.append(listContainerLayout);
	this.mListContainer = listContainerLayout.createList(20, null, true);
	this.mListScrollContainer = this.mListContainer.findListScrollContainer();
	*/

	this.mIsVisible = false;
};

WorldScreenActiveContractPanelModule.prototype.destroyDIV = function ()
{
	this.mTitleContainer.remove();
	this.mTitleContainer = null;

	this.mToggleVisibilityButton.remove();
	this.mToggleVisibilityButton = null;

	/*
	this.mListScrollContainer.empty();
	this.mListScrollContainer = null;
	this.mListContainer.destroyList();
	this.mListContainer.remove();
	this.mListContainer = null;
	*/

	this.mContractContentContainer.empty();
	this.mContractContentContainer.remove();
	this.mContractContentContainer = null;

	this.mContentContainer.empty();
	this.mContentContainer.remove();
	this.mContentContainer = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


WorldScreenActiveContractPanelModule.prototype.bindTooltips = function ()
{
	this.mToggleVisibilityButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.WorldScreen.ActiveContractPanelModule.ToggleVisibilityButton });
};

WorldScreenActiveContractPanelModule.prototype.unbindTooltips = function ()
{
	this.mToggleVisibilityButton.unbindTooltip();
};


WorldScreenActiveContractPanelModule.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.bindTooltips();
};

WorldScreenActiveContractPanelModule.prototype.destroy = function()
{
	this.unbindTooltips();
	this.destroyDIV();
};


WorldScreenActiveContractPanelModule.prototype.register = function (_parentDiv)
{
	console.log('WorldScreenActiveContractPanelModule::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Active Contract Panel Module. Reason: Active Contract Panel Module is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

WorldScreenActiveContractPanelModule.prototype.unregister = function ()
{
	console.log('WorldScreenActiveContractPanelModule::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Active Contract Panel Module. Reason: Active Contract Panel Module is not initialized.');
		return;
	}

	this.destroy();
};

WorldScreenActiveContractPanelModule.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};


WorldScreenActiveContractPanelModule.prototype.registerEventListener = function (_listener)
{
	this.mEventListener = _listener;
};


WorldScreenActiveContractPanelModule.prototype.toggleVisiblility = function  (_withSlideAnimation)
{
	if (this.mIsToggledVisible === true)
	{
		this.hide(_withSlideAnimation);
	}
	else
	{
		this.show(_withSlideAnimation);
	}
};

WorldScreenActiveContractPanelModule.prototype.show = function (_withSlideAnimation)
{
	if (_withSlideAnimation === false)
	{
		this.mContainer.css({ right: 0 });
		this.mContainer.removeClass('display-none').addClass('display-block');
		this.mContentContainer.css({ height: '' });
		this.mContentContainer.removeClass('display-none').addClass('display-block');
		this.mIsVisible = true;
		this.mIsToggledVisible = true;
	}
	else
	{
		var self = this;

		// compute content height
		this.mContentContainer.css({ height: '' });
		this.mContentContainer.removeClass('display-none').addClass('display-block');
		var contentHeight = this.mContentContainer.height();
		this.mContentContainer.removeClass('display-block').addClass('display-none');
		this.mContentContainer.css({ height: 0 });

		self.mContentContainer.velocity("finish", true).velocity({ height: contentHeight },
		{
			duration: Constants.CONTENT_ROLL_IN_OUT_DELAY,
			easing: 'swing',
			begin: function ()
			{
				$(this).removeClass('display-none').addClass('display-block');
			},
			complete: function ()
			{
				self.mIsToggledVisible = true;
			}
		});

		// chain animations
		/*jQuery.when(
			this.mContainer.velocity("finish", true).velocity({ right: 0 }, {
				duration: Constants.CONTENT_ROLL_IN_OUT_DELAY,
				easing: 'swing',
				begin: function() {
					$(this).removeClass('display-none').addClass('display-block');
				}
			}).promise()
		).done(function () {
			self.mContentContainer.velocity("finish", true).velocity({ height: contentHeight }, {
				duration: Constants.CONTENT_ROLL_IN_OUT_DELAY,
				easing: 'swing',
				begin: function() {
					$(this).removeClass('display-none').addClass('display-block');
				},
				complete: function() {
					self.mIsToggledVisible = true;
				}
			});
		});*/
	}
};

WorldScreenActiveContractPanelModule.prototype.hide = function (_withSlideAnimation)
{
	if (_withSlideAnimation === false)
	{
		this.mContentContainer.css({ height: '', right: 0 });
		this.mContainer.removeClass('display-block').addClass('display-none');
		this.mIsVisible = false;
	}
	else
	{
		var self = this;

		this.mContentContainer.velocity("finish", true).velocity({ height: 0 },
		{
			duration: Constants.CONTENT_ROLL_IN_OUT_DELAY,
			easing: 'swing',
			complete: function ()
			{
				$(this).removeClass('display-block').addClass('display-none');
				self.mIsToggledVisible = false;
			}
		});

		// chain animations
	   /* jQuery.when(
			this.mContentContainer.velocity("finish", true).velocity({ height: 0 }, {
				duration: Constants.CONTENT_ROLL_IN_OUT_DELAY,
				easing: 'swing',
				complete: function () {
					$(this).removeClass('display-block').addClass('display-none');
				}
			}).promise()
		).done(function () {
			self.mContainer.velocity("finish", true).velocity({ right: -(self.mContainer.width() - (self.mTitleContainer.position().left + 38) ) }, {
				duration: Constants.CONTENT_ROLL_IN_OUT_DELAY,
				easing: 'swing',
				complete: function () {
					self.mContentContainer.css({ height: '' });
					self.mIsToggledVisible = false;
				}
			});
		});*/
	}
};

WorldScreenActiveContractPanelModule.prototype.isVisible = function ()
{
	return this.mIsVisible;
};


WorldScreenActiveContractPanelModule.prototype.loadFromData = function (_data)
{
	if('Title' in _data && _data.Title !== null)
	{
		this.mTitleContainer.html(_data.Title);
	}

	this.mContractContentContainer.empty();

	if('Lists' in _data && _data.Lists !== null)
	{
		for(var i = 0; i < _data.Lists.length; ++i)
		{
			this.renderList(_data.Lists[i]);
		}
	}

	this.show(false);
};

WorldScreenActiveContractPanelModule.prototype.renderList = function (_data)
{
// 	var ppp = $('<div class="row"/>');
//	 this.mContractContentContainer.append(ppp);
//	 var description = $('<div class="description text-font-medium font-bottom-shadow font-color-description"/>');
//	 ppp.append(description);
//	 description.html('<br/>');

	//var row = $('<div class="row list-container" id="list-' + _data['id'] + '"/>');
	var row = $('<div class="row list-container"/>');
	this.mContractContentContainer.append(row);

	if('title' in _data && _data.title !== null)
	{
		var title = $('<div class="title title-font-normal font-bold font-color-ink"/>');
		row.append(title);

		var parsedTitleText = XBBCODE.process({
			text: _data.title,
			removeMisalignedTags: false,
			addInLineBreaks: true
		});
		title.html(parsedTitleText.html);
	}

	if('items' in _data && _data.items !== null)
	{
		for(var i = 0; i < _data.items.length; ++i)
		{
			this.renderListItem(row, _data.items[i]);
		}
	}
};

WorldScreenActiveContractPanelModule.prototype.renderListItem = function (_container, _item)
{
//	 if (!('id' in _item) || _item['id'] === null)
//	 {
//		 console.error('Failed to parse event content list item. Reason: Id is missing.');
//		 return;
//	 }

	//var row = $('<div class="row list" id="list-item-' + _item['id'] + '"/>');
	var row = $('<div class="row list"/>');
	_container.append(row);

	if('icon' in _item && _item.icon !== null)
	{
		var image = $('<img/>');
		image.attr('src', Path.GFX + /*_item.icon*/ "ui/icons/icon_contract_swords.png");
		row.append(image);
	}

	if ('text' in _item && _item.text !== null)
	{
		var text = $('<div class="text text-font-medium font-color-ink"/>');
		row.append(text);

		var parsedText = XBBCODE.process({
			text: _item.text,
			removeMisalignedTags: false,
			addInLineBreaks: true
		});
		text.html(parsedText.html);
	}
};

WorldScreenActiveContractPanelModule.prototype.notifyBackendShowContractDetails = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onShowContractDetails');
	}
};

/* NOTE: Das Abfragen der Content Höhe geht bei der Liste ned...
WorldScreenActiveContractPanelModule.prototype.onContractContentModuleUpdated = function (_module)
{
	if (_module === undefined || _module === null || !(typeof(_module) === 'object'))
	{
		return;
	}

	var div = _module.getContentDIV();
	console.info(this.mListContainer[0].scrollHeight);
	console.info(div[0].clientHeight);
	console.info(div);
	this.mContractContentContainer.css({ height: this.mListScrollContainer.height() });
};
*/