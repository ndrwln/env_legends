
"use strict";

var WorldTownScreenIdentifier =
{
	KeyEvent:
	{

	},

	TownInformation: {
		Title: 'Title',
		SubTitle: 'SubTitle',
		HeaderImagePath: 'HeaderImagePath',
		BackgroundImagePath: 'BackgroundImagePath',
		ClickRegions: {
			Key: 'ClickRegions',
			Type: {
				Key: 'type',
				Hire: 'hire',
				Shop: 'shop',
				Contract: 'contract'
			},
			Id: 'id',
			Region: {
				Type: {
					Normal: 'normal',
					Hover: 'hover'
				},
				PositionX: 'positionX',
				PositionY: 'positionY',
				Width: 'width',
				Height: 'height',
				ImagePath: 'imagePath'
			}
		}
	},

	ShopInformation:
	{
		HeaderImagePath: 'headerImagePath'
	},

	HireInformation:
	{
		HeaderImagePath: 'headerImagePath'
	},

	HireRosterEntry:
	{
		ID: 'ID',
		Name: 'Name',
		Level: 'Level',
		InitialMoneyCost: 'InitialMoneyCost',
		DailyMoneyCost: 'DailyMoneyCost',
		DailyFoodCost: 'DailyFoodCost',
		ImagePath: 'ImagePath',
		ImageOffsetX: 'ImageOffsetX',
		ImageOffsetY: 'ImageOffsetY',
		BackgroundImagePath: 'BackgroundImagePath',
		BackgroundText: 'BackgroundText'
	},

	Item: {
		Id: 'id',
		ImagePath: 'imagePath',
		Amount: 'amount',
		AmountMax: 'amountMax',
		Price: 'price'
	},

	QueryResult: {
		TownInformation: 'townInformation',
		ShopInformation: 'shopInformation',
		HireInformation: 'hireInformation',
		AssetsInformation: 'assetsInformation',
		HireRoster: 'hireRoster',
		Stash: 'stash',
		Shop: 'shop'
	},

	
};