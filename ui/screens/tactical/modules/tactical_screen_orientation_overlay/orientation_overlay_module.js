/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			31.10.2013 (reworked: 14.03.2017)
 *  @Description:	Tactical Screen: Orientation Overlay Module JS
 */
"use strict";


var TacticalScreenOrientationOverlayModule = function()
{
	this.mSQHandle = null;

	// event listener
	this.mEventListener = null;

	// container
	this.mContainer = null;

	// overlays
	this.mOverlays = {};
};


TacticalScreenOrientationOverlayModule.prototype.isConnected = function ()
{
	return this.mSQHandle !== null;
};

TacticalScreenOrientationOverlayModule.prototype.onConnection = function (_handle)
{
	//if (typeof(_handle) == 'string')
	{
		this.mSQHandle = _handle;

		// notify listener
		if (this.mEventListener !== null && ('onModuleOnConnectionCalled' in this.mEventListener)) {
			this.mEventListener.onModuleOnConnectionCalled(this);
		}
	}
};

TacticalScreenOrientationOverlayModule.prototype.onDisconnection = function ()
{
	this.mSQHandle = null;

	// notify listener
	if (this.mEventListener !== null && ('onModuleOnDisconnectionCalled' in this.mEventListener)) {
		this.mEventListener.onModuleOnDisconnectionCalled(this);
	}
};


TacticalScreenOrientationOverlayModule.prototype.createDIV = function (_parentDiv)
{
	this.mContainer = $('<div class="orientation-overlay-module"/>');
	_parentDiv.append(this.mContainer);
};

TacticalScreenOrientationOverlayModule.prototype.destroyDIV = function ()
{
	this.removeOverlays();

	this.mContainer.remove();
	this.mContainer = null;
};

TacticalScreenOrientationOverlayModule.prototype.createOverlayDIV = function (_overlay)
{
	var overlay = $('<div class="overlay is-enabled"/>');
	overlay.data('overlay', _overlay);
	
	overlay.click(this, function(_event) {
		var self = _event.data;
		var data = $(this).data('overlay');
		self.notifyBackendOverlayClicked(data.id);
	});

	return overlay;
};

TacticalScreenOrientationOverlayModule.prototype.findOverlayById = function(_id)
{
	if (_id in this.mOverlays)
	{
		return this.mOverlays[_id];
	}
	return null;
};


TacticalScreenOrientationOverlayModule.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
};

TacticalScreenOrientationOverlayModule.prototype.destroy = function()
{
	this.destroyDIV();
};


TacticalScreenOrientationOverlayModule.prototype.register = function (_parentDiv)
{
	console.log('TacticalScreenOrientationOverlayModule::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Orientation Overlay Module. Reason: Orientation Overlay Module is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

TacticalScreenOrientationOverlayModule.prototype.unregister = function ()
{
	console.log('TacticalScreenOrientationOverlayModule::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Orientation Overlay Module. Reason: Orientation Overlay Module is not initialized.');
		return;
	}

	this.destroy();
};

TacticalScreenOrientationOverlayModule.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};


TacticalScreenOrientationOverlayModule.prototype.registerEventListener = function (_listener)
{
	this.mEventListener = _listener;
};


TacticalScreenOrientationOverlayModule.prototype.addOverlay = function(_overlay)
{
	if (_overlay === null || typeof(_overlay) !== 'object')
	{
		console.error('ERROR: Failed to add new overlay. Reason: Overlay data missing.');
		return;
	}

	if (!(TacticalScreenIdentifier.OrientationOverlay.Id in _overlay))
	{
		console.error('ERROR: Failed to add new overlay. Reason: Invalid overlay data.');
		return;
	}

	if (this.findOverlayById(_overlay[TacticalScreenIdentifier.OrientationOverlay.Id]) === null)
	{
		var overlayDiv = this.createOverlayDIV(_overlay);
		this.mOverlays[_overlay[TacticalScreenIdentifier.OrientationOverlay.Id]] = overlayDiv;
		this.mContainer.append(overlayDiv);
	}
};


TacticalScreenOrientationOverlayModule.prototype.removeOverlay = function(_overlay)
{
	if (_overlay === null || typeof(_overlay) !== 'object')
	{
		console.error('ERROR: Failed to remove overlay. Reason: Overlay data missing.');
		return;
	}

	if (!(TacticalScreenIdentifier.OrientationOverlay.Id in _overlay))
	{
		console.error('ERROR: Failed to remove overlay. Reason: Invalid overlay id.');
		return;
	}

	var overlayDiv = this.findOverlayById(_overlay[TacticalScreenIdentifier.OrientationOverlay.Id]);
	if (overlayDiv !== null)
	{
		overlayDiv.remove();
		delete this.mOverlays[_overlay[TacticalScreenIdentifier.OrientationOverlay.Id]];
	}
	else
	{
		console.error('ERROR: Failed to remove overlay. Reason: Overlay not found.');
	}
};

TacticalScreenOrientationOverlayModule.prototype.removeOverlays = function()
{
	this.mContainer.empty();
	this.mOverlays = { };
};

TacticalScreenOrientationOverlayModule.prototype.updateOverlay = function(_overlay)
{
	if (_overlay === null || typeof(_overlay) !== 'object')
	{
		console.error('ERROR: Failed to update overlay. Reason: Overlay data missing.');
		return;
	}
	
	if (!(TacticalScreenIdentifier.OrientationOverlay.Id in _overlay))
	{
		console.error('ERROR: Failed to update overlay. Reason: Invalid overlay id.');
		return;
	}

	var overlayDiv = this.findOverlayById(_overlay[TacticalScreenIdentifier.OrientationOverlay.Id]);
	if (overlayDiv !== null)
	{
		// need to update position?
		if (TacticalScreenIdentifier.OrientationOverlay.PositionX in _overlay && TacticalScreenIdentifier.OrientationOverlay.PositionY in _overlay)
		{
			this.updatePosition(overlayDiv, _overlay);
		}

		// need to fade in/out?
		if (TacticalScreenIdentifier.OrientationOverlay.Visible in _overlay)
		{
			this.updateVisibility(overlayDiv, _overlay);
		}
	}
};

TacticalScreenOrientationOverlayModule.prototype.disableOverlays = function()
{
	this.mContainer.children('.overlay').each(function(index, element) {
		$(element).removeClass('is-enabled').addClass('is-disabled');
	});
};

TacticalScreenOrientationOverlayModule.prototype.updateOverlays = function(_overlays)
{
	if (_overlays === null || jQuery.isArray(_overlays) !== true)
	{
		console.error('ERROR: Failed to update overlays. Reason: Overlay data is invalid.');
		return;
	}

	for (var i = 0; i < _overlays.length; ++i)
	{
		this.updateOverlay(_overlays[i]);
	}
};

TacticalScreenOrientationOverlayModule.prototype.updatePosition = function(_overlayDiv, _overlay)
{
	// Align to Screen Borders
	/*
	var containerWidth = this.mContainer.innerWidth();
	var containerHeight = this.mContainer.innerHeight();
	*/

	var overlayWidth = _overlayDiv.outerWidth(true);
	var overlayHeight = _overlayDiv.outerHeight(true);
	var overlayLeft = _overlay[TacticalScreenIdentifier.OrientationOverlay.PositionX];
	var overlayTop = _overlay[TacticalScreenIdentifier.OrientationOverlay.PositionY];
	
	overlayTop = overlayTop - (overlayHeight / 2);
	overlayLeft = overlayLeft - (overlayWidth / 2);

	// adjust y position
	if (TacticalScreenIdentifier.OrientationOverlay.OffsetY in _overlay && _overlay[TacticalScreenIdentifier.OrientationOverlay.OffsetY] !== 0)
	{
		overlayTop = overlayTop + _overlay[TacticalScreenIdentifier.OrientationOverlay.OffsetY];
	}

	_overlayDiv.css({ top: overlayTop + 'px', left: overlayLeft + 'px' });
};

TacticalScreenOrientationOverlayModule.prototype.updateVisibility = function(_overlayDiv, _overlay)
{
	if (_overlay[TacticalScreenIdentifier.OrientationOverlay.Visible] === true)
	{
		_overlayDiv.removeClass('is-disabled').addClass('is-enabled');
	}
	else
	{
		_overlayDiv.removeClass('is-enabled').addClass('is-disabled');
	}
};


TacticalScreenOrientationOverlayModule.prototype.notifyBackendOverlayClicked = function (_overlayId)
{
	if (this.mSQHandle !== null)
	{
		SQ.call(this.mSQHandle, 'onOverlayClicked', _overlayId);
	}
};
