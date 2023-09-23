/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 *
 *  @Author:		Overhype Studios
 *  @Date:			12.04.2017 (refactored: 03.10.2017)
 *  @Description:	Options Menu Module - Identifiers sJS
 */
"use strict";


var OptionsMenuModuleIdentifier = {
	KeyEvent: {
		VideoPanelNamespace: '.video-panel'
	},

	QueryResult: {
		Error: 'error',

		Current: 'current',
		Defaults: 'defaults',

		Video: {
			Key: 'video',

			Resolutions: 'resolutions',
			Resolution: {
				Key: 'resolution',
				Width: 'width',
				Height: 'height',
				Bpp: 'bpp'
			},

			WindowMode: {
				Key: 'windowMode',
				Fullscreen: 'fullscreen',
				Window: 'window',
				Borderless: 'borderless'
			},

			UIScaling: {
				Key: 'uiScale'
			},

			SpriteScaling: {
				Key: 'spriteScale'
			},

			VSync: 'vsync',
			DepthOfField: 'depthOfField'
		},

		Audio: {
			Key: 'audio',
			Master: 'master',
			Music: 'music',
			Effects: 'effects',
			Ambience: 'ambience',
			HWSound: 'hardwareSound'
		},

		Controls: {
			Key: 'controls',
			Scrollmode:
			{
				Key: 'scrollMode',
				EdgeOfScreen: 'edgeOfScreen',
				DragWithMouse: 'dragWithMouse'
			},
			HardwareMouse: 'hardwareMouse'
		},

		Gameplay: {
			Key: 'gameplay',
			CameraFollowMode: 'cameraFollowMode',
			CameraAdjustLevel: 'cameraAdjustLevel',
			StatsOverlays: 'statsOverlays',
			OrientationOverlays: 'orientationOverlays',
			MovementPlayer: 'movementPlayer',
			MovementAI: 'movementAI',
			AutoLoot: 'autoLoot',
			AutoEndTurn: 'autoEndTurn',
			AlwaysHideTrees: 'alwaysHideTrees',
			RestoreEquipment: 'restoreEquipment',
			AutoPauseAfterCity: 'autoPauseAfterCity'
		}
		
	}

};
