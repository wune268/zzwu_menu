//
//  ZWTabBar.h
//  zzwu_menu
//
//  Created by zzwu on 16/7/15.
//  Copyright © 2016年 zzwu. All rights reserved.


//                          _oo0oo_
//                         088888880
//                         88" . "88
//                         (| -_- |)
//                          0\ = /0
//                       ___/'---'\___
//                     .' \\|     |// '.
//                    / \\|||  :  |||// \
//                   /_ ||||| -:- |||||- \
//                  |   | \\\  -  /// |   |
//                  | \_|  ''\---/''  |_/ |
//                  \  .-\__  '-'  __/-.  /
//                ___'. .'  /--.--\  '. .'___
//             ."" '<  '.___\_<|>_/___.' >'  "".
//            | | : '-  \'.;'\ _ /';.'/ - ' : | |
//            \  \ '_.   \_ __\ /__ _/   .-' /  /
//        ====='-.____'.___ \_____/___.-'____.-'=====
//                          '=---='
//
//      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//                佛祖保佑    : :    不再单身

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
