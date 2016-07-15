//
//  ZWTabBarController.m
//  zzwu_menu
//
//  Created by zzwu on 16/7/15.
//  Copyright © 2016年 zzwu. All rights reserved.
//

#import "ZWTabBarController.h"
#import "ZWTabBar.h"
#import "ZWNavigationController.h"
#import "ZWTabBarButton.h"

@interface ZWTabBarController ()<ZWTabBarDelegate>

@property(nonatomic, weak)ZWTabBar *customtabBar;

@end

@implementation ZWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self zw_createTabBarButton];
    [self zw_creatController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)zw_createTabBarButton
{
    ZWTabBar *customtabBar = [[ZWTabBar alloc]init];
    customtabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customtabBar];
    self.customtabBar = customtabBar;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//        移除系统自带的tabbarbutton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)zw_creatController
{
    UIViewController *WaVc = [[UIViewController alloc]init];
    [self zw_setupChildViewController:WaVc title:@"首页" image:@"" selectImage:@""];
    UIViewController *WaVc1 = [[UIViewController alloc]init];
    [self zw_setupChildViewController:WaVc1 title:@"中页" image:@"" selectImage:@""];
    UIViewController *WaVc2 = [[UIViewController alloc]init];
    [self zw_setupChildViewController:WaVc2 title:@"关于我" image:@"" selectImage:@""];
    
}

//  设置子控制器的标题图片
-(void)zw_setupChildViewController:(UIViewController *)childV
                             title:(NSString *)title
                             image:(NSString *)image
                       selectImage:(NSString *)selectImage
{
    childV.title = title;
    childV.tabBarItem.image = [UIImage imageNamed:image];
    childV.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    包装一个NavigationController导航控制器
    ZWNavigationController *nav = [[ZWNavigationController alloc]initWithRootViewController:childV];
    
    [self addChildViewController:nav];
    self.customtabBar.delegate = self;
    [self.customtabBar zw_addTabBarButtonItem:childV.tabBarItem];
}

-(void)zw_tabBar:(ZWTabBar *)tabBar didSelectItemFrom:(long)from to:(long)to
{
    self.selectedIndex = to;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
