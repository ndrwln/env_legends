/*
 *  @Project:		Battle Brothers
 *	@Company:		Overhype Studios
 *
 *	@Copyright:		(c) Overhype Studios | 2015
 * 
 *  @Author:		Overhype Studios
 *  @Date:			02.06.2015
 *  @Description:	Event Screen Identifiers JS
 */
"use strict";

var WorldEventIdentifier = {
	KeyEvent: {

	},

	Event: {
		Id: 'id',
		Title: 'title',
		CharacterLeft: 'characterLeft',
		CharacterRight: 'characterRight',
		BannerImagePath: 'bannerImagePath',
		HeaderImagePath: 'headerImagePath',
		Content: {
			Key: 'content',
			Entry: {
				Id: 'id',
				Type: {
					Key: 'type',
					Image: {
						Value: 'image',
						ImagePath: 'imagePath'
					},
					Description: {
						Value: 'description',
						Text: 'text'
					},
					List: {
						Value: 'list',
						Title: 'title',
						Items: {
							Key: 'items',
							Entry: {
								Id: 'id',
								ImagePath: 'icon',
								Text: 'text'
							}
						}
					}
				}
			}
		},
		Buttons: {
			Key: 'buttons',
			Entry: {
				Id: 'id',
				Text: 'text'
			}
		}
	}
};