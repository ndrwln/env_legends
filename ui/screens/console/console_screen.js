/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			19.04.2013
 *  @Description:	Console Screen JS
 */
"use strict";


/* Console Screen */
var ConsoleScreen = function()
{
	this.mSQHandle = null;
	
	// generic containers
	this.mContainer		  = null;
	this.mConsoleContainer   = null;
	this.mLogContainer	   = null;
	this.mLogScrollContainer = null;

	// options controls
	this.mOptionsContainer = null;
	this.mOptionsButtons = {
		SwitchInfo: {
			Button: null,
			Type: ConsoleScreenIdentifier.LogType.Info
		},
		SwitchDebug: {
			Button: null,
			Type: ConsoleScreenIdentifier.LogType.Debug
		},
		SwitchWarning: {
			Button: null,
			Type: ConsoleScreenIdentifier.LogType.Warning
		},
		SwitchError: {
			Button: null,
			Type: ConsoleScreenIdentifier.LogType.Error
		},
		SwitchCritical: {
			Button: null,
			Type: ConsoleScreenIdentifier.LogType.Critical
		},
		SwitchGroup: {
			Button: null,
			Type: ConsoleScreenIdentifier.LogType.Group
		},
	};

	// toolbar controls
	this.mSwitchToOptionsButton = null;
	this.mSwitchToJSButton	  = null;
	this.mSwitchToSQButton	  = null;
	this.mCommandInput		  = null;

	// timing	
	this.mTimerHandle	 = null;
	this.mFadeInDuration  = 400;
	this.mFadeOutDuration = 400;

	// states [hidden, normal, extended]
	this.mStateConfig = ['0%', '30%', '100%' ];
	this.mStateIndex = {
		Hidden: 0,
		Normal: 1,
		Extended: 2
	};
	this.mCurrentState = this.mStateIndex.Normal;

	this.mEnabledLogTypes = [
		true, true, true, true, true, true, true
	];

	// Command History handling
	this.mCommandHistoryIndex   = 0;
	this.mCommandHistoryMaxSize = 20;
	this.mCommandHistory		= [];

	// log groups
	this.mCurrentGroups = [];

	// constants
	this.mMaxLogEntries = 100;

	// execution enviroment
	this.mCurrentExecutionEnviroment = ConsoleScreenIdentifier.ExecutionEnviroment.SQ;

	// System Console Methods
	this.mSystemConsoleMethods = {
		'log': {
			original: null,
			replacement: this.notifyBackendLogInfoText
		},
		'debug': {
			original: null,
			replacement: this.notifyBackendLogDebugText
		},
		'warn': {
			original: null,
			replacement: this.notifyBackendLogWarningText
		},
		'error': {
			original: null,
			replacement: this.notifyBackendLogErrorText
		},
		'info': {
			original: null,
			replacement: this.notifyBackendLogInfoText
		},
		'dir': {
			original: null,
			replacement: function(){ },
		},
		'dirxml': {
			original: null,
			replacement: function(){ },
		},
		'trace': {
			original: null,
			replacement: function(){ },
		},
		'profile': {
			original: null,
			replacement: function(){ },
		},
	};

	// create
	this.create();
};

/**
 *	A SQ Script has connected to this host
**/
ConsoleScreen.prototype.onConnection = function (_handle)
{
	/*
	console.log('SQ -> JS: ConsoleScreen::onConnection() called!');
	console.log('SQ Handle: ' + _handle);
	*/

	//if (typeof(_handle) == 'string')
	{
		this.mSQHandle = _handle;
	}
};

/**
 *	A SQ Script has disconnected from this host
**/
ConsoleScreen.prototype.onDisconnection = function ()
{
	//console.log('SQ -> JS: ConsoleScreen::onDisconnection() called!');
	this.mSQHandle = null;
};

/**
 *	Create the Console Screen
**/
ConsoleScreen.prototype.createDIV = function ()
{
	// create: containers
	this.mContainer = $('<div class="console-screen"></div>');
	this.mConsoleContainer = $('<div class="console-container ui-control-console-container"></div>');
	this.mContainer.append(this.mConsoleContainer);
	
	// create: content container
	this.mLogContainer = $('<div class="log-container ui-control-console-log-container"></div>');
	this.mConsoleContainer.append(this.mLogContainer);
	this.mLogScrollContainer = $('<div class="log-scroll-container"></div>');
	this.mLogContainer.append(this.mLogScrollContainer);
	
	// create: options bar
	this.mOptionsContainer = $('<div class="options-container ui-control-console-options-container display-none"></div>');
	this.mConsoleContainer.append(this.mOptionsContainer);

	var optionsButtonContainer = $('<div class="button-container"></div>');
	this.mOptionsContainer.append(optionsButtonContainer);
	this.createOptionsBarButtons(optionsButtonContainer);

	// create: toolbar
	var toolbarContainer = $('<div class="toolbar-container ui-control-console-toolbar-container"></div>');
	this.mConsoleContainer.append(toolbarContainer);

	var toolbarButtonContainer = $('<div class="button-container"></div>');
	toolbarContainer.append(toolbarButtonContainer);
	
	this.mSwitchToOptionsButton = $('<div class="button is-options ui-control-button ui-control-console-button default-font-small">Options</div>');
	toolbarButtonContainer.append(this.mSwitchToOptionsButton);
	this.mSwitchToJSButton = $('<div class="button ui-control-button ui-control-console-button default-font-small font-color-console-js-enviroment">JS</div>');
	toolbarButtonContainer.append(this.mSwitchToJSButton);
	this.mSwitchToSQButton = $('<div class="button ui-control-button ui-control-console-button default-font-small font-color-console-sq-enviroment">SQ</div>');
	toolbarButtonContainer.append(this.mSwitchToSQButton);

	var inputContainer = $('<div class="input-container"></div>');
	toolbarContainer.append(inputContainer);

	this.mCommandInput = $('<input type="text" class="ui-control-console-input default-font-small" placeholder="Type command..."></input>');
	inputContainer.append(this.mCommandInput);
};

ConsoleScreen.prototype.createOptionsBarButtons = function (_container)
{
	this.mOptionsButtons.SwitchInfo.Button = $('<div class="button ui-control-button ui-control-console-button default-font-small font-color-console type-info is-selected">Info</div>');
	_container.append(this.mOptionsButtons.SwitchInfo.Button);
	this.mOptionsButtons.SwitchDebug.Button = $('<div class="button ui-control-button ui-control-console-button default-font-small font-color-console type-debug is-selected">Debug</div>');
	_container.append(this.mOptionsButtons.SwitchDebug.Button);
	this.mOptionsButtons.SwitchWarning.Button = $('<div class="button ui-control-button ui-control-console-button default-font-small font-color-console type-warning is-selected">Warning</div>');
	_container.append(this.mOptionsButtons.SwitchWarning.Button);
	this.mOptionsButtons.SwitchError.Button = $('<div class="button ui-control-button ui-control-console-button default-font-small font-color-console type-error is-selected">Error</div>');
	_container.append(this.mOptionsButtons.SwitchError.Button);
	this.mOptionsButtons.SwitchCritical.Button = $('<div class="button ui-control-button ui-control-console-button default-font-small font-color-console type-critical is-selected">Critical</div>');
	_container.append(this.mOptionsButtons.SwitchCritical.Button);
	this.mOptionsButtons.SwitchGroup.Button = $('<div class="button ui-control-button ui-control-console-button default-font-small font-color-console type-group is-selected">Group</div>');
	_container.append(this.mOptionsButtons.SwitchGroup.Button);
};

ConsoleScreen.prototype.createLogGroupDIV = function ()
{

};


/**
 *	Replace system console
**/
ConsoleScreen.prototype.replaceSystemConsole = function ()
{
	if (Constants.BROWSER_MODE)
	{
		return;
	}

	// create console object if there isn't any
	if (!window.console)
	{
		 window.console = {};	
	}

	// assign new methods
	$.each(this.mSystemConsoleMethods, function(_key, _value) {
		if (_value.replacement !== null)
		{
			_value.original = console[_key];
			console[_key] = _value.replacement;
		}
	});
};

/**
 *	Restore system console
**/
ConsoleScreen.prototype.restoreSystemConsole = function ()
{
	if (Constants.BROWSER_MODE)
	{
		return;
	}

	// restore old console methods
	$.each(this.mSystemConsoleMethods, function(_key, _value) {
		console[_key] = _value.original;
	});
};


/**
 *	Setup every Event Handler
**/
ConsoleScreen.prototype.setupEventHandler = function ()
{
	this.removeEventHandler();

	var self = this;
	$.each(this.mOptionsButtons, function(_key, _value) {
		var type = _value.Type;
		_value.Button.click(self, function(_event) {
			self.toggleVisibleLogEntries(type);
		});
	});

	this.mSwitchToOptionsButton.click(this, function(_event) {
		var self = _event.data;
		self.toggleOptionsBar();
	});

	this.mSwitchToJSButton.click(this, function(_event) {
		var self = _event.data;
		self.switchExecutionEnviroment(ConsoleScreenIdentifier.ExecutionEnviroment.JS);
	});

	this.mSwitchToSQButton.click(this, function(_event) {
		var self = _event.data;
		self.switchExecutionEnviroment(ConsoleScreenIdentifier.ExecutionEnviroment.SQ);
	});

	this.mCommandInput.on('keyup' + ConsoleScreenIdentifier.KeyEvent.Namespace, null, this, function(event) {
		var self = event.data;

		switch(event.which)
		{
			case KeyConstants.ArrowUp:
			{
				self.scrollHistoryUp();
			} break;
			case KeyConstants.ArrowDown:
			{
				self.scrollHistoryDown();
			} break;
			case KeyConstants.Return:
			{
				self.executeCommand($(this).val());
			
				/*
				event.preventDefault();
				event.stopPropagation();
				*/
			} break;
		}
	});

	// bind global key event handler
	$(document).on('keyup' + ConsoleScreenIdentifier.KeyEvent.Namespace, null, this, function(event) {
		var self = event.data;
		
		switch(event.which)
		{
// 			case KeyConstants.PageUp:
// 			{
// 				self.toggleUp();
// 
// 				event.preventDefault();
// 				event.stopPropagation();
// 				break;
// 			}
// 			case KeyConstants.PageDown:
// 			{
// 				self.toggleDown();
// 
// 				event.preventDefault();
// 				event.stopPropagation();
// 				break;
// 			}
// 			case KeyConstants.F11:
// 			{
// 				self.toggle();
// 
// 				event.preventDefault();
// 				event.stopPropagation();
//				break;
// 			} 
		}
	});

};

/**
 *	Remove Event Handler
**/
ConsoleScreen.prototype.removeEventHandler = function ()
{
	$.each(this.mOptionsButtons, function(_key, _value) {
		_value.Button.unbind('click');
	});

	this.mSwitchToOptionsButton.unbind('click');
	this.mSwitchToJSButton.unbind('click');
	this.mSwitchToSQButton.unbind('click');
	
	this.mCommandInput.off('keypress' + ConsoleScreenIdentifier.KeyEvent.Namespace);

	$(document).off('keyup' + ConsoleScreenIdentifier.KeyEvent.Namespace);
};

/**
 *	Create the Console Screen
**/
ConsoleScreen.prototype.create = function()
{
	// create: DOM structure
	this.createDIV();

	// replace system console
	//this.replaceSystemConsole();

	// set defaults
	this.toggleUp();
	this.switchExecutionEnviroment(ConsoleScreenIdentifier.ExecutionEnviroment.SQ);
};

/**
 *	Destroy the Console Screen
**/
ConsoleScreen.prototype.destroy = function()
{
	this.restoreSystemConsole();
};

/**
 *	Add the Console Screen to the given parent
**/
ConsoleScreen.prototype.register = function (_parentDiv)
{
	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to register Console Screen. Reason: Console Screen is not initialized.');
		return;
	}

	if (_parentDiv !== null && typeof(_parentDiv) == 'object' && this.mContainer.parent().length === 0)
	{
		_parentDiv.append(this.mContainer);

		this.mLogContainer.aciScrollBar({
			delta: 15,
			lineDelay: 0,
			lineTimer: 0,
			pageDelay: 0,
			pageTimer: 0,
			bindKeyboard: false,
			resizable: false,
			smoothScroll: false
		});

		this.setupEventHandler();
	}
};

/**
 *	Remove the Console Screen from its parent
**/
ConsoleScreen.prototype.unregister = function ()
{
	if (this.mContainer === null)
	{
		console.error('ERROR: Failed to unregister Console Screen. Reason: Console Screen is not initialized.');
		return;
	}

	if (this.mContainer.parent().length !== 0)
	{
		if (this.mLogContainer.hasClass('aciScrollBar') !== false)
		{
			this.mLogContainer.aciScrollBar('destroy');
		}

		this.removeEventHandler();
		this.mContainer.remove();
	}
};

/**
 *	Show the Console Screen
**/
ConsoleScreen.prototype.show = function ()
{
	this.register($('body'));
};

/**
 *	Hide the Console Screen
**/
ConsoleScreen.prototype.hide = function ()
{
	this.unregister();
};

/**
 *	Get all Modules (the backend calls this)
**/
ConsoleScreen.prototype.getModules = function ()
{
	return [];
};



/**
 *	Show/Hide the Console
**/
ConsoleScreen.prototype.toggle = function ()
{
	if (this.mCurrentState === this.mStateIndex.Hidden)
	{
		this.toggleDown();
	}
	else
	{
		this.toggleUp();
	}
};

ConsoleScreen.prototype.toggleUp = function ()
{
	var self = this;

	if (this.mCurrentState === this.mStateIndex.Normal)
	{
		this.mCurrentState = this.mStateIndex.Hidden;
		this.mConsoleContainer.animate({
			top: '-' + this.mStateConfig[this.mStateIndex.Normal],
			height: this.mStateConfig[this.mStateIndex.Normal]
		},{
			duration: this.mFadeInDuration,
			always: function() {
				$(this).removeClass('ui-control-console-container');
				//$(this).removeClass('display-block').addClass('display-none');
				
				self.mCommandInput.blur();
				self.scrollToLast();
			}
		});
	}
	else if (this.mCurrentState === this.mStateIndex.Extended)
	{
		this.mCurrentState = this.mStateIndex.Normal;
		this.mConsoleContainer.animate({
			height: this.mStateConfig[this.mStateIndex.Normal]
		}, {
			duration: this.mFadeInDuration,
			always: function() {
				self.scrollToLast();
			}
		});
	}
};

ConsoleScreen.prototype.toggleDown = function ()
{
	var self = this;

	if (this.mCurrentState === this.mStateIndex.Hidden)
	{
		this.mCurrentState = this.mStateIndex.Normal;
		this.mConsoleContainer.animate({
			top: 0,
			height: this.mStateConfig[this.mStateIndex.Normal]
		}, {
			duration: this.mFadeOutDuration,
			start: function() {
				$(this).addClass('ui-control-console-container');

				self.mCommandInput.focus();
				self.scrollToLast();
			}
		});
	}
	else if (this.mCurrentState === this.mStateIndex.Normal)
	{
		this.mCurrentState = this.mStateIndex.Extended;
		this.mConsoleContainer.animate({ height: this.mStateConfig[this.mStateIndex.Extended] }, {
			duration: this.mFadeOutDuration,
			start: function() {
				self.scrollToLast();
			}
		});
	}
};

ConsoleScreen.prototype.toggleVisibleLogEntries = function (_type)
{
	this.mLogScrollContainer.children('.log-entry.' + ConsoleScreenIdentifier.LogTypeClass[_type]).each(function(index, element) {
		var div = $(element);
		if (div.hasClass('display-none') === true)
		{
			div.removeClass('display-none').addClass('display-block');
		}
		else
		{
			div.removeClass('display-block').addClass('display-none');
		}
	});

	// find all groups and toggle them children
	this.mLogScrollContainer.children('.log-entry.' + ConsoleScreenIdentifier.LogTypeClass[ConsoleScreenIdentifier.LogType.Group]).each(function(index, element) {
		var div = $(element);
		// search its children
		div.find('.' + ConsoleScreenIdentifier.LogTypeClass[_type]).each(function(index, element) {
			var div = $(element);
			if (div.hasClass('display-none') === true)
			{
				div.removeClass('display-none').addClass('display-block');
			}
			else
			{
				div.removeClass('display-block').addClass('display-none');
			}
		});
	});

	// find button
	var self = this;
	$.each(this.mOptionsButtons, function(_key, _value) {
		if (_value.Type === _type)
		{
			if (_value.Button.hasClass('is-selected') === true)
			{
				_value.Button.removeClass('is-selected');
				self.mEnabledLogTypes[_type] = false;
			}
			else
			{
				_value.Button.addClass('is-selected');
				self.mEnabledLogTypes[_type] = true;
			}
			return false;
		}
	});
};

ConsoleScreen.prototype.toggleOptionsBar = function ()
{
	if (this.mOptionsContainer.hasClass('display-block') === true)
	{
		this.mOptionsContainer.removeClass('display-block').addClass('display-none');
		this.mSwitchToOptionsButton.removeClass('is-selected');
		this.mLogContainer.removeClass('has-visible-options');
	}
	else
	{
		this.mOptionsContainer.removeClass('display-none').addClass('display-block');
		this.mSwitchToOptionsButton.addClass('is-selected');
		this.mLogContainer.addClass('has-visible-options');
	}
};

ConsoleScreen.prototype.switchExecutionEnviroment = function (_enviroment)
{
	switch (_enviroment)
	{
		case ConsoleScreenIdentifier.ExecutionEnviroment.JS:
		{
			this.mSwitchToSQButton.removeClass('is-selected');
			this.mSwitchToJSButton.removeClass('is-selected').addClass('is-selected');
			this.mCurrentExecutionEnviroment = ConsoleScreenIdentifier.ExecutionEnviroment.JS;
		} break;
		case ConsoleScreenIdentifier.ExecutionEnviroment.SQ:
		{
			this.mSwitchToJSButton.removeClass('is-selected');
			this.mSwitchToSQButton.removeClass('is-selected').addClass('is-selected');
			this.mCurrentExecutionEnviroment = ConsoleScreenIdentifier.ExecutionEnviroment.SQ;
		} break;
	}
};

/**
 *	Command History handling
**/
ConsoleScreen.prototype.addHistory = function (_command)
{
	this.mCommandHistory.push(_command);
	this.mCommandHistoryIndex = this.mCommandHistory.length-1;
	if (this.mCommandHistory.length > this.mCommandHistoryMaxSize)
	{
		this.mCommandHistory.shift();
	}
};

ConsoleScreen.prototype.scrollHistoryUp = function ()
{
	//console.log('scrollHistoryUp: ' + this.mCommandHistoryIndex);

	this.mCommandInput.val(this.mCommandHistory[this.mCommandHistoryIndex]);
	if (this.mCommandHistoryIndex > 0)
	{
		--this.mCommandHistoryIndex;
	}
};

ConsoleScreen.prototype.scrollHistoryDown = function ()
{
	if (this.mCommandHistoryIndex < this.mCommandHistory.length-1)
	{
		this.mCommandInput.val(this.mCommandHistory[++this.mCommandHistoryIndex]);
	}
	else
	{
		this.mCommandInput.val("");
	}

	//console.log('scrollHistoryDown: ' + this.mCommandHistoryIndex);
};

/**
 *	Execute Command
**/
ConsoleScreen.prototype.executeCommand = function (_command)
{
	if (_command.length === 0)
	{
		return;
	}
	
	this.addHistory(_command);
	this.mCommandInput.val('');

	switch(this.mCurrentExecutionEnviroment)
	{
		case ConsoleScreenIdentifier.ExecutionEnviroment.JS:
		{
			eval(_command);
		} break;
		case ConsoleScreenIdentifier.ExecutionEnviroment.SQ:
		{
			SQ.execute(_command);
		} break;
	}
};


/**
 *	Helper Methods
**/
ConsoleScreen.prototype.getFormatedTime = function ()
{
	var currentTime = new Date();
	var result;

	if (currentTime.getHours() < 10)
	{
		result = '0' + currentTime.getHours();
	}
	else
	{
		result = '' + currentTime.getHours();
	}
	result += ':';

	if (currentTime.getMinutes() < 10)
	{
		result += '0' + currentTime.getMinutes();
	}
	else
	{
		result += '' + currentTime.getMinutes();
	}
	result += ':';

	if (currentTime.getSeconds() < 10)
	{
		result += '0' + currentTime.getSeconds();
	}
	else
	{
		result += '' + currentTime.getSeconds();
	}

	return result;
};


/**
 *	Log Methods
**/
ConsoleScreen.prototype.logBeginGroup = function (_text)
{
	if (_text === undefined || _text === null || typeof(_text) !== 'string')
	{
		return;
	}

	var rootContainer = null;
	var groupContainer = null;
	var isRootContainer = this.mCurrentGroups.length === 0;
	if (isRootContainer === true)
	{
		this.checkMaxLogHistory();

		rootContainer = this.mLogScrollContainer;

		// create: container
		groupContainer = $('<div class="log-entry ui-control-console-log-entry ' + ConsoleScreenIdentifier.LogTypeClass[ConsoleScreenIdentifier.LogType.Group] + '"></div>');
		rootContainer.append(groupContainer);
	}
	else
	{
		rootContainer = this.mCurrentGroups[this.mCurrentGroups.length-1];

		groupContainer = $('<div class="container is-collapsible"></div>');
		rootContainer.append(groupContainer);
	}

	// create: header
	var logHeader = $('<div class="row is-collapsible"></div>');
	if (isRootContainer === false)
	{
		logHeader.addClass('ui-control-console-log-entry-container-row');
	}
	groupContainer.append(logHeader);
	var leftColumn = $('<div class="column"></div>');
	logHeader.append(leftColumn);
	var rightColumn = $('<div class="auto-expand-column"></div>');
	logHeader.append(rightColumn);

	var logTime = $('<div class="log-time default-font-small font-color-console time">' + this.getFormatedTime() + '</div>');
	leftColumn.append(logTime);
	var logType = $('<div class="log-type"></div>');
	leftColumn.append(logType);
	var logTypeImage = $('<img/>');
	logTypeImage.attr('src', Path.GFX + ConsoleScreenIdentifier.LogTypeImage[ConsoleScreenIdentifier.LogType.Group]);
	logType.append(logTypeImage);
	var logTitle = $('<div class="log-title default-font-small font-color-console ' + ConsoleScreenIdentifier.LogTypeClass[ConsoleScreenIdentifier.LogType.Group] + '">' + _text + '</div>');
	rightColumn.append(logTitle);

	// create: container
	var logRootContainer = $('<div class="container has-full-padding ui-control-console-log-entry-container display-none"></div>');
	groupContainer.append(logRootContainer);

	// make collapsible
	groupContainer.addClass('is-collapsible');
	this.setupCollapsibleClickHander(logHeader);

	this.mCurrentGroups.push(logRootContainer);
};

ConsoleScreen.prototype.logEndGroup = function ()
{
	if (this.mCurrentGroups.length > 0)
	{
		this.mCurrentGroups.pop();
	}
};

ConsoleScreen.prototype.logInfo = function (_text, _source, _callstack)
{
	this.log(ConsoleScreenIdentifier.LogType.Info, _text, _source, _callstack);
};

ConsoleScreen.prototype.logDebug = function (_text, _source, _callstack)
{
	this.log(ConsoleScreenIdentifier.LogType.Debug, _text, _source, _callstack);
};

ConsoleScreen.prototype.logWarning = function (_text, _source, _callstack)
{
	this.log(ConsoleScreenIdentifier.LogType.Warning, _text, _source, _callstack);
};

ConsoleScreen.prototype.logError = function (_text, _source, _callstack)
{
	this.log(ConsoleScreenIdentifier.LogType.Error, _text, _source, _callstack);
};

ConsoleScreen.prototype.logCritical = function (_text, _source, _callstack)
{
	this.log(ConsoleScreenIdentifier.LogType.Critical, _text, _source, _callstack);
};

ConsoleScreen.prototype.log = function (_type, _text, _source, _callstack)
{
	if (_type === undefined || typeof(_type) != 'number' || _text === undefined || _text === null || typeof(_text) !== 'string')
	{
		return;
	}

	if (_type < ConsoleScreenIdentifier.LogType.None || _type > ConsoleScreenIdentifier.LogType.Critical)
	{
		_type = ConsoleScreenIdentifier.LogType.None;
	}

	this.checkMaxLogHistory();

	// create: container
	var logEntry = null;
	var isRootContainer = this.mCurrentGroups.length === 0;
	if (isRootContainer === true)
	{
		logEntry = $('<div class="log-entry ui-control-console-log-entry ' + ConsoleScreenIdentifier.LogTypeClass[_type] + '"></div>');
		this.mLogScrollContainer.append(logEntry);
	}
	else
	{
		logEntry = $('<div class="container ' + ConsoleScreenIdentifier.LogTypeClass[_type] + ' is-collapsible"></div>');
		this.mCurrentGroups[this.mCurrentGroups.length-1].append(logEntry);
	}

	// show/hide initially
	var isVisible = this.mEnabledLogTypes[_type] === true;
	if (isVisible === false)
	{
		logEntry.addClass('display-none');
	}

	// create: header
	var logHeader = $('<div class="row"></div>');
	if (isRootContainer === false)
	{
		logHeader.addClass('ui-control-console-log-entry-container-row');
	}
	logEntry.append(logHeader);
	var leftColumn = $('<div class="column"></div>');
	logHeader.append(leftColumn);
	var rightColumn = $('<div class="auto-expand-column"></div>');
	logHeader.append(rightColumn);

	var logTime = $('<div class="log-time default-font-small font-color-console time">' + this.getFormatedTime() + '</div>');
	leftColumn.append(logTime);
	var logType = $('<div class="log-type"></div>');
	leftColumn.append(logType);
	var logTypeImage = $('<img/>');
	logTypeImage.attr('src', Path.GFX + ConsoleScreenIdentifier.LogTypeImage[_type]);
	logType.append(logTypeImage);
	var logTitle = $('<div class="log-title default-font-small font-color-console ' + ConsoleScreenIdentifier.LogTypeClass[_type] + '">' + _text + '</div>');
	rightColumn.append(logTitle);

	// create: container
	var logRootContainer = $('<div class="container has-full-padding ui-control-console-log-entry-container display-none"></div>');
	logEntry.append(logRootContainer);

	// add source
	var hasContent = false;
	if (_source !== undefined && typeof(_source) === 'string' && _source.length > 0)
	{
		hasContent = true;

		var logFileRow = $('<div class="row ui-control-console-log-entry-container-row"></div>');
		logRootContainer.append(logFileRow);
		var logFileLabel = $('<div class="label default-font-small font-color-console filename-label">File:</div>');
		logFileRow.append(logFileLabel);
		var logFileValue = $('<div class="value default-font-small font-color-console filename-value">' + _source + '</div>');
		logFileRow.append(logFileValue);
	}

	// add stacktrace
	if (_callstack !== undefined && jQuery.isArray(_callstack) === true)
	{
		hasContent = true;
		
		// create: root container
		var logRootStacktraceContainer = $('<div class="container"></div>');
		logRootContainer.append(logRootStacktraceContainer);

		var logStacktraceRow = $('<div class="row ui-control-console-log-entry-container-row is-collapsible"></div>');
		logRootStacktraceContainer.append(logStacktraceRow);
		this.setupCollapsibleClickHander(logStacktraceRow);

		var logStacktraceLabel = $('<div class="label default-font-small font-color-console stacktrace-label">Stacktrace:</div>');
		logStacktraceRow.append(logStacktraceLabel);

		// create: container
		var logStacktraceContainer = $('<div class="container display-none"></div>');
		logRootStacktraceContainer.append(logStacktraceContainer);

		for (var i = 0; i < _callstack.length; ++i)
		{
			var stacktraceEntry = _callstack[i];
			if (stacktraceEntry === undefined || stacktraceEntry === null ||
				!(ConsoleScreenIdentifier.Stacktrace.Function in stacktraceEntry) ||
				!(ConsoleScreenIdentifier.Stacktrace.File in stacktraceEntry))
			{
				continue;
			}

			var variables = (ConsoleScreenIdentifier.Stacktrace.Variables.Key in stacktraceEntry &&
							jQuery.isArray(stacktraceEntry[ConsoleScreenIdentifier.Stacktrace.Variables.Key]) ? stacktraceEntry[ConsoleScreenIdentifier.Stacktrace.Variables.Key] : []);

			// create: stacktrace entry container
			var logStacktraceEntryContainer = $('<div class="container is-collapsible"></div>');
			logStacktraceContainer.append(logStacktraceEntryContainer);

			// create: function name row
			var logStacktraceFunctionRow = $('<div class="row ui-control-console-log-entry-container-row ' + (variables.length > 0 ? 'is-collapsible' : '') + '"></div>');
			logStacktraceEntryContainer.append(logStacktraceFunctionRow);
			this.setupCollapsibleClickHander(logStacktraceFunctionRow);
			var logStacktraceFunctionLabel = $('<div class="label default-font-small font-color-console function-label">Function:</div>');
			logStacktraceFunctionRow.append(logStacktraceFunctionLabel);
			var logStacktraceFunctionValue = $('<div class="value default-font-small font-color-console function-value">' + stacktraceEntry[ConsoleScreenIdentifier.Stacktrace.Function] + '</div>');
			logStacktraceFunctionRow.append(logStacktraceFunctionValue);

			var logStacktraceEntryFileAndVariablesContainer = $('<div class="container is-collapsible display-none"></div>');
			logStacktraceEntryContainer.append(logStacktraceEntryFileAndVariablesContainer);

			// create: file name row
			var filename = (ConsoleScreenIdentifier.Stacktrace.File in stacktraceEntry &&
							typeof(stacktraceEntry[ConsoleScreenIdentifier.Stacktrace.File]) === 'string' ? stacktraceEntry[ConsoleScreenIdentifier.Stacktrace.File] : '');
			if (filename.length > 0)
			{
				var logStacktraceFilenameRow = $('<div class="row ui-control-console-log-entry-container-row"></div>');
				logStacktraceEntryFileAndVariablesContainer.append(logStacktraceFilenameRow);
				var logStacktraceFilenameLabel = $('<div class="label default-font-small normal font-color-console filename-label">File:</div>');
				logStacktraceFilenameRow.append(logStacktraceFilenameLabel);
				var logStacktraceFilenameValue = $('<div class="value default-font-small font-color-console filename-value">' + filename + '</div>');
				logStacktraceFilenameRow.append(logStacktraceFilenameValue);
			}

			// create: stacktrace entry variables container
			if (variables.length > 0)
			{
				var hasVariables = false;

				var logStacktraceEntryVariablesRootContainer = $('<div class="container"></div>');
				logStacktraceEntryFileAndVariablesContainer.append(logStacktraceEntryVariablesRootContainer);

				var logStacktraceVariablesRow = $('<div class="row ui-control-console-log-entry-container-row"></div>');
				logStacktraceEntryVariablesRootContainer.append(logStacktraceVariablesRow);
				this.setupCollapsibleClickHander(logStacktraceVariablesRow);
				var logStacktraceVariablesLabel = $('<div class="label default-font-small font-color-console stacktrace-label">Variables:</div>');
				logStacktraceVariablesRow.append(logStacktraceVariablesLabel);

				var logStacktraceEntryVariablesContainer = $('<div class="container display-none"></div>');
				logStacktraceEntryVariablesRootContainer.append(logStacktraceEntryVariablesContainer);
				for (var v = 0; v < variables.length; ++v)
				{
					var stacktraceEntryVariable = variables[i];
					if (stacktraceEntryVariable === undefined || stacktraceEntryVariable === null ||
						!(ConsoleScreenIdentifier.Stacktrace.Variables.Name in stacktraceEntryVariable) ||
						!(ConsoleScreenIdentifier.Stacktrace.Variables.Value in stacktraceEntryVariable))
					{
						continue;
					}

					hasVariables = true;

					var logStacktraceVariableRow = $('<div class="row ui-control-console-log-entry-container-row"></div>');
					logStacktraceEntryVariablesContainer.append(logStacktraceVariableRow);
					var logStacktraceVariableLabel = $('<div class="label default-font-small font-color-console variable-label">' + stacktraceEntryVariable[ConsoleScreenIdentifier.Stacktrace.Variables.Name] + ':</div>');
					logStacktraceVariableRow.append(logStacktraceVariableLabel);
					var logStacktraceVariableValue = $('<div class="value default-font-small font-color-console variable-value">' + stacktraceEntryVariable[ConsoleScreenIdentifier.Stacktrace.Variables.Value] + '</div>');
					logStacktraceVariableRow.append(logStacktraceVariableValue);
				}

				if (hasVariables === true)
				{
					logStacktraceVariablesRow.addClass('is-collapsible');
					logStacktraceEntryVariablesContainer.addClass('is-collapsible');
				}
			}
		}
	}

	// only make openable if there is content
	if (hasContent)
	{
		if (isRootContainer === false)
		{
			logHeader.addClass('is-collapsible');
		}
		logEntry.addClass('is-collapsible');
		this.setupCollapsibleClickHander(logHeader);
	}

	if (isVisible === true)
	{
		if (isRootContainer === true)
		{
			this.scrollToLast(logEntry);
		}
		else
		{
			// scroll to top most group
			this.scrollToLast(this.mCurrentGroups[0].parent());
		}
	}
};

ConsoleScreen.prototype.logObject = function (_type, _object, _callstack)
{
	if (_object === undefined || _object === null)
	{
		return;
	}

	// TODO: Log Table
};

ConsoleScreen.prototype.notifyBackendLogInfoText = function (_text)
{
	if (_text === undefined || _text === null || typeof(_text) !== 'string')
	{
		return;
	}

	// TEST
	/*
	try {
		f = new Error();
	} catch(e) {
		var callstack = [];

		if (e.stack) {
			console.dir(e.stack);

			var lines = e.stack.split('\n');
			console.log(lines);
			for (var i=0, len=lines.length; i<len; i++) {
				if (lines[i].match(/^\s*[A-Za-z0-9\-_\$]+\(/)) {
					callstack.push(lines[i]);
				}
			}
		}
		console.log(callstack);
	}
	*/

	System.logText(ConsoleScreenIdentifier.LogTypeIdentifier[ConsoleScreenIdentifier.LogType.Info], _text);
};

ConsoleScreen.prototype.notifyBackendLogDebugText = function (_text)
{
	if (_text === undefined || _text === null || typeof(_text) !== 'string')
	{
		return;
	}

	System.logText(ConsoleScreenIdentifier.LogTypeIdentifier[ConsoleScreenIdentifier.LogType.Debug], _text);
};

ConsoleScreen.prototype.notifyBackendLogWarningText = function (_text)
{
	if (_text === undefined || _text === null || typeof(_text) !== 'string')
	{
		return;
	}

	System.logText(ConsoleScreenIdentifier.LogTypeIdentifier[ConsoleScreenIdentifier.LogType.Warning], _text);
};

ConsoleScreen.prototype.notifyBackendLogErrorText = function (_text)
{
	if (_text === undefined || _text === null || typeof(_text) !== 'string')
	{
		return;
	}

	System.logText(ConsoleScreenIdentifier.LogTypeIdentifier[ConsoleScreenIdentifier.LogType.Error], _text);
};

ConsoleScreen.prototype.notifyBackendLogCriticalText = function (_text)
{
	if (_text === undefined || _text === null || typeof(_text) !== 'string')
	{
		return;
	}

	System.logText(ConsoleScreenIdentifier.LogTypeIdentifier[ConsoleScreenIdentifier.LogType.Critical], _text);
};

ConsoleScreen.prototype.setupCollapsibleClickHander = function (_div)
{
	_div.click(this, function(_event) {
		var self = _event.data;
		var root = $(this).parents('.log-entry:first');
		var container = $(this).parent().find('.container:first');
		if (container.length > 0)
		{
			if (container.hasClass('display-block') === true)
				container.removeClass('display-block').addClass('display-none');
			else
				container.removeClass('display-none').addClass('display-block');
			self.scrollToLast(root);
		}
	});
};

ConsoleScreen.prototype.checkMaxLogHistory = function ()
{
	var entries = this.mLogScrollContainer.children('.log-entry');
	if (entries.length > 0 && entries.length >= this.mMaxLogEntries)
	{
		var first = $(entries[0]);
		if (first.length > 0)
		{
			first.remove();
		}
	}
};

ConsoleScreen.prototype.scrollToLast = function (_element)
{
	if (this.mCurrentState === this.mStateIndex.Hidden)
	{
		return;
	}

	var lastEntry = null;
	if (_element !== undefined)
	{
		lastEntry = _element;
	}
	else
	{
		lastEntry = this.mLogScrollContainer.children(':last');
	}
	
	if (lastEntry !== null && lastEntry.length > 0)
	{
		var self = this;
		if (this.mTimerHandle !== null)
		{
			this.mTimerHandle = clearTimeout(this.mTimerHandle);
		}

		this.mTimerHandle = setTimeout(function() {
			self.mLogScrollContainer.trigger('scroll', { top: lastEntry[0].offsetTop, duration: 0, animate: true, scrollTo: 'bottom' });
		}, 10);
	}
};


/* LOG STACK

	e = new Error();
	console.log(e.stack);

*/