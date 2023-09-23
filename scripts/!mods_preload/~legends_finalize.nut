if (::mods_getRegisteredMod("mod_msu") == null)
{
	::Legends.Popup <- {
		m = {
			JSHandle = null,
			TextCache = ""
		},
		function showRawText( _text, _quit )
		{
			if (this.m.JSHandle == null)
			{
				if (this.m.TextCache != "")
				{
					this.m.TextCache += "<br>";
				}

				this.m.TextCache += _text;
			}
			else
			{
				local data = {
					forceQuit = _quit,
					text = _text
				};
				this.m.JSHandle.asyncCall("showRawText", data);
			}
		}

		function connect()
		{
			this.m.JSHandle = ::UI.connect("MSUPopup", this);

			if (this.m.TextCache != "")
			{
				this.showRawText(this.m.TextCache, true);
			}
		}

		function quitGame()
		{
		}

	};
	::mods_registerJS("legends/popup.js");
	::mods_registerCSS("legends/css/popup.css");
	::mods_hookExactClass("ui/screens/menu/modules/main_menu_module", function ( o )
	{
		local create = o.create;
		o.create <- function ()
		{
			create();
			::Legends.Popup.quitGame = o.onQuitButtonPressed.bindenv(this);
		};
		o.connectBackend <- function ()
		{
			::Legends.Popup.connect();
		};
	});
	::Legends.Popup.showRawText("ERROR: Legends Requires Modding Standards & Utilities (MSU) to function.<br><a style=\"color: lightblue; text-decoration: underline;\"onclick=\"openURL(\'https://www.nexusmods.com/battlebrothers/mods/479\')\">Get MSU from Nexusmods</a>", true);
	::mods_registerJS("legends/connect_popup.js");
}

