//
//  ZWTabBar.m
//  zzwu_menu
//
//  Created by zzwu on 16/7/15.
//  Copyright © 2016年 zzwu. All rights reserved.
//

#import "ZWTabBar.h"
#import "ZWTabBarButton.h"


@interface ZWTabBar()

@property(nonatomic,weak)ZWTabBarButton *selectBtn;

@end

@implementation ZWTabBar

-(void)zw_addTabBarButtonItem:(UITabBarItem *)item
{
    //    创建按钮
    ZWTabBarButton *button = [[ZWTabBarButton alloc] init];
    [self addSubview:button];
    
    //    设置数据
    button.item = item;
    
    [button addTarget:self action:@selector(zw_buttonDidClick:) forControlEvents:UIControlEventTouchDown];
    
    if (self.subviews.count == 1) {
        [self zw_buttonDidClick:button];
    }    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width / self.subviews.count;
    CGFloat btnH = self.frame.size.height;
    for (int i = 0; i < self.subviews.count; i ++) {
        ZWTabBarButton *btn = self.subviews[i];
        CGFloat btnX = i * btnW;
        btn.tag = i;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
    }
}

-(void)zw_buttonDidClick:(ZWTabBarButton *)button
{
    if ([self.delegate respondsToSelector:@selector(zw_tabBar:didSelectItemFrom:to:)]) {
        [self.delegate zw_tabBar:self didSelectItemFrom:self.selectBtn.tag to:button.tag];
    }
    self.selectBtn.selected = NO;
    button.selected = YES;
    self.selectBtn = button;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
