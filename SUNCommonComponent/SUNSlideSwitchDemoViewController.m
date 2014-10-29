//
//  SUNSlideSwitchDemoViewController.m
//  SUNCommonComponent
//
//  Created by 麦志泉 on 13-9-4.
//  Copyright (c) 2013年 中山市新联医疗科技有限公司. All rights reserved.
//

#import "SUNSlideSwitchDemoViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "SUNListViewController.h"

@interface SUNSlideSwitchDemoViewController ()

@end

@implementation SUNSlideSwitchDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.title = @"每日Q游戏盒子";
//    self.slideSwitchView.tabItemNormalColor = [SUNSlideSwitchView colorFromHexRGB:@"868686"];
//    self.slideSwitchView.tabItemSelectedColor = [SUNSlideSwitchView colorFromHexRGB:@"bb0b15"];
//    self.slideSwitchView.shadowImage = [[UIImage imageNamed:@"red_line_and_shadow.png"]
//                                        stretchableImageWithLeftCapWidth:59.0f topCapHeight:0.0f];
    
    
    self.slideSwitchView.tabItemNormalColor = [UIColor redColor];
    self.slideSwitchView.tabItemSelectedColor = [UIColor blueColor];
    self.slideSwitchView.shadowImage = [[UIImage imageNamed:@"red_line_and_shadow.png"]
                                        stretchableImageWithLeftCapWidth:59.0f topCapHeight:0.0f];
    
    self.vc1 = [[_Test1ViewController alloc] init];
    self.vc1.title = @"   首页   ";
    _vc1.nav = self.navigationController;
    
    self.vc2 = [[SUNListViewController alloc] init];
    self.vc2.title = @"   分类   ";
    
    self.vc3 = [[SUNListViewController alloc] init];
    self.vc3.title = @"   最近玩过   ";
    
//    UIButton *rightSideButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightSideButton setImage:[UIImage imageNamed:@"icon_rightarrow.png"] forState:UIControlStateNormal];
//    [rightSideButton setImage:[UIImage imageNamed:@"icon_rightarrow.png"]  forState:UIControlStateHighlighted];
//    rightSideButton.frame = CGRectMake(0, 0, 20.0f, 44.0f);
//    rightSideButton.userInteractionEnabled = NO;
//    self.slideSwitchView.rigthSideButton = rightSideButton;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"左边" style:UIBarButtonItemStyleDone target:self action:@selector(leftDrawerButtonPress:)];
    self.navigationItem.leftBarButtonItem = item;
    [self.navigationItem setLeftBarButtonItem:item animated:YES];
    
    [self.slideSwitchView buildUI];
}

/**
 *  点击左边的响应事件
 */
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

#pragma mark - 滑动tab视图代理方法

- (NSUInteger)numberOfTab:(SUNSlideSwitchView *)view
{
    return 3;
}

- (UIViewController *)slideSwitchView:(SUNSlideSwitchView *)view viewOfTab:(NSUInteger)number
{
    if (number == 0) {
        return self.vc1;
    } else if (number == 1) {
        return self.vc2;
    } else if (number == 2) {
        return self.vc3;
    } else if (number == 3) {
        return self.vc4;
    } else if (number == 4) {
        return self.vc5;
    } else if (number == 5) {
        return self.vc6;
    } else {
        return nil;
    }
}

- (void)slideSwitchView:(SUNSlideSwitchView *)view panLeftEdge:(UIPanGestureRecognizer *)panParam
{
    if (!iOS7) {
        return;
    }
    
    SUNViewController *drawerController = (SUNViewController *)self.navigationController.mm_drawerController;
    [drawerController panGestureCallback:panParam];
}

- (void)slideSwitchView:(SUNSlideSwitchView *)view didselectTab:(NSUInteger)number
{
    SUNListViewController *vc = nil;
    
    if (number == 0) {
        vc = self.vc1;
    } else if (number == 1) {
        vc = self.vc2;
    } else if (number == 2) {
        vc = self.vc3;
    } else if (number == 3) {
        vc = self.vc4;
    } else if (number == 4) {
        vc = self.vc5;
    } else if (number == 5) {
        vc = self.vc6;
    }
    [vc viewDidCurrentView];
}

#pragma mark - 内存报警

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
