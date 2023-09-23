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

var TacticalCombatResultScreenIdentifier = {
	KeyEvent: {

	},

	CombatInformation: {
		Result: {
			Key: 'result',
			Win: 'win',
			Loose: 'loose'
		},
		Title: 'title',
		SubTitle: 'subTitle'
	},

	Statistic: {
		Id: 'id',
		Name: 'name',
		Title: 'title',
		ImagePath: 'imagePath',
		ImageOffsetX: 'imageOffsetX',
		ImageOffsetY: 'imageOffsetY',
		KillsMade: 'killsMade',
		XpReceived: 'xpReceived',
		DamageDealt: 'damageDealt',
		DamageReceived: 'damageReceived',
		DaysWounded: 'daysWounded',
		LeveledUp: 'leveledUp'
	},

	Item: {
		Id: 'id',
		ImagePath: 'imagePath',
		Amount: 'amount',
		AmountMax: 'amountMax'
	},

	QueryResult: {
		CombatInformation: 'combatInformation',
		Statistics: 'statistics',
		Stash: 'stash',
		FoundLoot: 'foundLoot'
	},

	ItemOwner:
	{
		Stash: 'tactical-combat-result-screen.stash',
		FoundLoot: 'tactical-combat-result-screen.found-loot'
	}
};