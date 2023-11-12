/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2013 - 2020
 * 
 *  @Author:		Overhype Studios
 *  @Date:			21.04.2017
 *  @Description:	Options Screen Identifiers
 */


/*
	Identifiers
 */
var ConsoleScreenIdentifier = {
	KeyEvent: {
		Namespace: '.console-screen'
	},

	ExecutionEnviroment: {
		JS: 0,
		SQ: 1
	},

	LogType: {
		None: 0,
		Info: 1,
		Debug: 2,
		Warning: 3,
		Error: 4,
		Critical: 5,
		Group: 6,
		MAX: 7
	},

	LogTypeIdentifier: {
		None: 'none',
		Info: 'info',
		Debug: 'debug',
		Warning: 'warning',
		Error: 'error',
		Critical: 'critical',
		Group: 'group'
	},

	LogTypeImage: [
		Asset.CONSOLE_NONE,
		Asset.CONSOLE_INFO,
		Asset.CONSOLE_DEBUG,
		Asset.CONSOLE_WARNING,
		Asset.CONSOLE_ERROR,
		Asset.CONSOLE_CRITICAL,
		Asset.CONSOLE_GROUP,
	],

	LogTypeClass: [
		'type-none',
		'type-info',
		'type-debug',
		'type-warning',
		'type-error',
		'type-critical',
		'type-group'
	],

	Stacktrace: {
		File: 'file',
		Function: 'function',
		Variables: {
			Key: 'variables',
			Name: 'name',
			Value: 'value'
		}
	}
};
