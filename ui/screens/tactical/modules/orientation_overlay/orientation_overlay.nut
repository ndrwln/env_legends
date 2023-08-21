this.orientation_overlay <- this.inherit("scripts/ui/screens/ui_module", {
	m = {
		LastCameraZoom = null,
		LastCameraLevel = null,
		LastCameraPos = null,
		CameraHasMoved = null,
		CameraHasStopped = null,
		IsDirty = null,
		Overlays = null
	},
	function create()
	{
		this.m.ID = "OrientationOverlayModule";
		this.ui_module.create();
		this.m.Overlays = [];
		this.m.IsDirty = true;
		this.m.CameraHasMoved = true;
		this.m.CameraHasStopped = true;
		local camera = this.Tactical.getCamera();
		local cameraPos = camera.getPos();
		this.m.LastCameraZoom = camera.Zoom;
		this.m.LastCameraPos = {
			X = cameraPos.X,
			Y = cameraPos.Y
		};
	}

	function destroy()
	{
		this.removeOverlays();
		this.ui_module.destroy();
	}

	function update()
	{
		local camera = this.Tactical.getCamera();
		local cameraPos = camera.getPos();

		if (this.m.IsDirty == true || this.m.LastCameraLevel != camera.Level || this.m.LastCameraZoom != camera.Zoom || this.m.LastCameraPos.X != cameraPos.X || this.m.LastCameraPos.Y != cameraPos.Y)
		{
			this.m.LastCameraLevel = camera.Level;
			this.m.LastCameraZoom = camera.Zoom;
			this.m.LastCameraPos.X = cameraPos.X;
			this.m.LastCameraPos.Y = cameraPos.Y;
			this.Tactical.getCamera().updateEntityOverlays();

			if (this.m.CameraHasMoved == false)
			{
				this.m.CameraHasMoved = true;
				this.m.JSHandle.asyncCall("disableOverlays", null);
			}

			this.m.IsDirty = false;
		}
		else if (this.m.CameraHasMoved)
		{
			this.m.CameraHasStopped = true;
		}

		if (this.m.CameraHasStopped == true)
		{
			local updatedOverlays = this.Tactical.getCamera().queryEntityOverlays();

			if (updatedOverlays != null && updatedOverlays.len() > 0)
			{
				this.m.JSHandle.asyncCall("updateOverlays", updatedOverlays);
			}

			this.m.CameraHasMoved = false;
			this.m.CameraHasStopped = false;
		}
	}

	function render()
	{
		this.Tactical.getCamera().render();
	}

	function addOverlay( _entity )
	{
		local entityOverlay = {
			entity = _entity,
			image = _entity.getOverlayImage()
		};
		this.m.Overlays.push(entityOverlay);
		this.Tactical.getCamera().addEntityOverlay(entityOverlay);
		this.m.JSHandle.asyncCall("addOverlay", {
			id = _entity.getID()
		});
		this.m.CameraHasStopped = true;
	}

	function removeOverlay( _entity )
	{
		local idx = this.helper_findOverlayByEntity(_entity);

		if (idx != null)
		{
			this.m.JSHandle.asyncCall("removeOverlay", {
				id = _entity.getID()
			});
			this.Tactical.getCamera().removeEntityOverlay(_entity);
			this.m.Overlays.remove(idx);
		}
	}

	function removeOverlays()
	{
		this.m.JSHandle.asyncCall("removeOverlays", null);
		this.Tactical.getCamera().removeEntityOverlays();
		this.m.Overlays = [];
	}

	function onOverlayClicked( _entityId )
	{
		this.Tactical.TurnSequenceBar.focusEntityById(_entityId);
	}

	function helper_findOverlayByEntity( _entity )
	{
		local entityID = _entity.getID();

		foreach( i, overlay in this.m.Overlays )
		{
			if (overlay.entity.getID() == entityID)
			{
				return i;
			}
		}

		return null;
	}

});

