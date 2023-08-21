this.map_generator <- {
	m = {
		Templates = {}
	},
	function create()
	{
		this.registerTemplates();
	}

	function registerTemplates()
	{
		local templateScripts = this.IO.enumerateFiles("scripts/mapgen/templates/");

		foreach( i, templateScript in templateScripts )
		{
			local templateInstance = this.new(templateScript);

			if (templateInstance != null)
			{
				templateInstance.init();
				this.m.Templates[templateInstance.getName()] <- templateInstance;
			}
		}
	}

	function get( _templateName )
	{
		if (_templateName in this.m.Templates)
		{
			return this.m.Templates[_templateName];
		}

		this.logError("ERROR: Template named \"" + _templateName + "\" does not exist!");
		this.assert(false);
		return null;
	}

};

