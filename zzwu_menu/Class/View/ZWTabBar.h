//
//  ZWTabBar.h
//  zzwu_menu
//
//  Created by zzwu on 16/7/15.
//  Copyright © 2016年 zzwu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZWTabBar;

@protocol ZWTabBarDelegate <NSObject>

@optional

-(void)zw_tabBar:(ZWTabBar *)tabBar didSelectItemFrom:(long)from to:(long)to;

@end

@interface ZWTabBar : UIView

-(void)zw_addTabBarButtonItem:(UITabBarItem *)item;

@property(nonatomic,weak)id<ZWTabBarDelegate> delegate;

@end
