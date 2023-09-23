/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			09.10.2017
 *  @Description:	World Screen: Assets Bar Module JS
 */
"use strict";


var WorldScreenTopbarAmbitionModule = function(_dataSource)
{
	this.mSQHandle  = null;
	this.mDataSource = _dataSource;

	// event listener
	this.mEventListener = null;

	// container
	this.mContainer = null;

	// buttons
	this.mAmbitionButton = null;
	this.mAmbitionLabel = null;
};


WorldScreenTopbarAmbitionModule.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

WorldScreenTopbarAmbitionModule.prototype.onConnection = function (_handle)
{
	this.mSQHandle = _handle;

	// notify listener
	if (this.mEventListener !== null && ('onModuleOnConnectionCalled' in this.mEventListener))
	{
		this.mEventListener.onModuleOnConnectionCalled(this);
	}
};

WorldScreenTopbarAmbitionModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	// notify listener
	if(this.mEventListener !== null && ('onModuleOnDisconnectionCalled' in this.mEventListener))
	{
		this.mEventListener.onModuleOnDisconnectionCalled(this);
	}
};


WorldScreenTopbarAmbitionModule.prototype.createDIV = function (_parentDiv)
{
	// create: container
	this.mContainer = $('<div class="topbar-ambition-module"></div>');
	_parentDiv.append(this.mContainer);

	// create: asset container & buttons
	var assetContainer = $('<div class="asset-container is-ambition"></div>');
	this.mContainer.append(assetContainer);
	this.mAmbitionButton = this.createImageButton(assetContainer, Path.GFX + Asset.ICON_AMBITION_DISABLED);
};

WorldScreenTopbarAmbitionModule.prototype.destroyDIV = function ()
{
	this.mAmbitionButton.remove();
	this.mAmbitionButton = null;

	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


WorldScreenTopbarAmbitionModule.prototype.createImageButton = function (_parentDiv, _imagePath)
{
	var self = this;

	var layout = $('<div class="l-ambitions-container"/>');
	var image = $('<img/>');
	image.attr('src', _imagePath);
	layout.append(image);
	this.mAmbitionLabel = $('<div class="label text-font-small font-bold font-bottom-shadow font-color-assets-positive-value"/>');
	layout.append(this.mAmbitionLabel);

	layout.on("mouseup", function ()
	{
		self.notifyBackendCancelAmbition();
	});

	_parentDiv.append(layout);
	return layout;
};

WorldScreenTopbarAmbitionModule.prototype.bindTooltips = function ()
{
	this.mAmbitionButton.bindTooltip({ contentType: 'ui-element', elementId: TooltipIdentifier.Assets.Ambition });
};

WorldScreenTopbarAmbitionModule.prototype.unbindTooltips = function ()
{
	this.mAmbitionButton.unbindTooltip();
};


WorldScreenTopbarAmbitionModule.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.bindTooltips();
};

WorldScreenTopbarAmbitionModule.prototype.destroy = function()
{
	this.unbindTooltips();
	this.destroyDIV();
};


WorldScreenTopbarAmbitionModule.prototype.register = function (_parentDiv)
{
	console.log('WorldScreenTopbarAmbitionModule::REGISTER');

	if(this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Ambitions Module. Reason: Already initialized.');
		return;
	}

	if(_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

WorldScreenTopbarAmbitionModule.prototype.unregister = function ()
{
	console.log('WorldScreenTopbarAmbitionModule::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Ambitions Module. Reason: Not initialized.');
		return;
	}

	this.destroy();
};

WorldScreenTopbarAmbitionModule.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};


WorldScreenTopbarAmbitionModule.prototype.registerEventListener = function (_listener)
{
	this.mEventListener = _listener;
};


WorldScreenTopbarAmbitionModule.prototype.setText = function (_text)
{
	if(_text != null)
	{
		this.mAmbitionLabel.text(_text);
		this.mAmbitionLabel.removeClass('font-color-disabled');
		this.mAmbitionLabel.addClass('font-color-assets-positive-value');
		this.mAmbitionButton.changeButtonImage(Path.GFX + Asset.ICON_AMBITION);
	}
	else
	{
		this.mAmbitionLabel.text("");
		this.mAmbitionLabel.addClass('font-color-disabled');
		this.mAmbitionLabel.removeClass('font-color-assets-positive-value');
		this.mAmbitionButton.changeButtonImage(Path.GFX + Asset.ICON_AMBITION_DISABLED);
	}
};


WorldScreenTopbarAmbitionModule.prototype.notifyBackendCancelAmbition = function ()
{
	if(this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onRequestCancel');
	}
};