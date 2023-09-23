/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			24.05.2017 / Reworked: 26.11.2017
 *  @Description:	Left Panel Module JS
 */
"use strict";


var CharacterScreenLeftPanelModule = function(_parent, _dataSource)
{
	this.mParent = _parent;
	this.mDataSource = _dataSource;

	// container
	this.mContainer = null;

	// modules
	this.mHeaderModule = null;
	this.mPaperdollModule = null;
	this.mSkillsModule = null;
	this.mStatsModule = null;

	this.createModules();
};

CharacterScreenLeftPanelModule.prototype.createDIV = function (_parentDiv)
{
	this.mContainer = $('<div class="left-panel-module"/>');
	_parentDiv.append(this.mContainer);
};

CharacterScreenLeftPanelModule.prototype.destroyDIV = function ()
{
	this.mContainer.empty();
	this.mContainer.remove();
	this.mContainer = null;
};


CharacterScreenLeftPanelModule.prototype.createModules = function()
{
	this.mCharacterPanelHeaderModule = new CharacterScreenLeftPanelHeaderModule(this, this.mDataSource);
	this.mPaperdollModule = new CharacterScreenPaperdollModule(this, this.mDataSource);
	this.mSkillsModule = new CharacterScreenSkillsModule(this, this.mDataSource);
	this.mStatsModule = new CharacterScreenStatsModule(this, this.mDataSource);
};

CharacterScreenLeftPanelModule.prototype.registerModules = function ()
{
	this.mCharacterPanelHeaderModule.register(this.mContainer);
	this.mPaperdollModule.register(this.mContainer);
	this.mSkillsModule.register(this.mContainer);
	this.mStatsModule.register(this.mContainer);
};

CharacterScreenLeftPanelModule.prototype.unregisterModules = function ()
{
	this.mCharacterPanelHeaderModule.unregister();
	this.mPaperdollModule.unregister();
	this.mSkillsModule.unregister();
	this.mStatsModule.unregister();
};


/*
CharacterScreenLeftPanelModule.prototype.setupEventHandler = function ()
{
	this.removeEventHandler();

	this.mCharacterPanelHeaderModule.setupEventHandler();
	this.mPaperdollModule.setupEventHandler();
	this.mSkillsModule.setupEventHandler();
	this.mStatsModule.setupEventHandler();
};

CharacterScreenLeftPanelModule.prototype.removeEventHandler = function ()
{
	this.mCharacterPanelHeaderModule.removeEventHandler();
	this.mPaperdollModule.removeEventHandler();
	this.mSkillsModule.removeEventHandler();
	this.mStatsModule.removeEventHandler();
};
*/


CharacterScreenLeftPanelModule.prototype.create = function(_parentDiv)
{
	this.createDIV(_parentDiv);
	this.registerModules();
};

CharacterScreenLeftPanelModule.prototype.destroy = function()
{
	this.unregisterModules();
	this.destroyDIV();
};


CharacterScreenLeftPanelModule.prototype.register = function (_parentDiv)
{
	console.log('CharacterScreenLeftPanelModule::REGISTER');

	if (this.mContainer !== null)
	{
		console.error('ERROR: Failed to register Left Panel Module. Reason: Module is already initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object')
	{
		this.create(_parentDiv);
	}
};

CharacterScreenLeftPanelModule.prototype.unregister = function ()
{
	console.log('CharacterScreenLeftPanelModule::UNREGISTER');

	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Left Panel Module. Reason: Module is not initialized.');
		return;
	}

	this.destroy();
};

CharacterScreenLeftPanelModule.prototype.isRegistered = function ()
{
	if (this.mContainer !== null)
	{
		return this.mContainer.parent().length !== 0;
	}

	return false;
};