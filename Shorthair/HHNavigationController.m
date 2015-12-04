//
//  HHNavigationController.m
//  Shorthair
//
//  Created by Herbert Hu on 15/11/29.
//  Copyright © 2015年 Herbert Hu. All rights reserved.
//

#import "HHNavigationController.h"
#import "DOPNavbarMenu.h"
#import "HHBaseViewController.h"
#import "UtilsMacro.h"
#import "UIColor+FlatColors.h"

#import "NewsSuperController.h"
#import "RankingsViewController.h"


@interface HHNavigationController () <DOPNavbarMenuDelegate>

@property (strong, nonatomic) DOPNavbarMenu *menu;

@property (strong, nonatomic) DOPNavbarMenuItem *item1;
@property (strong, nonatomic) DOPNavbarMenuItem *item2;
@property (strong, nonatomic) DOPNavbarMenuItem *item3;
@property (strong, nonatomic) DOPNavbarMenuItem *item4;
@property (strong, nonatomic) DOPNavbarMenuItem *item5;

//@property (strong, nonatomic) HHBaseViewController *vc1;
//@property (strong, nonatomic) HHBaseViewController *vc2;
@property (strong, nonatomic) HHBaseViewController *vc3;
@property (strong, nonatomic) HHBaseViewController *vc4;
@property (strong, nonatomic) HHBaseViewController *vc5;

@property (strong, nonatomic) NewsSuperController *newsSuperVC;
@property (strong, nonatomic) RankingsViewController *rankingsVC;

@property (strong, nonatomic) NSMutableArray *controllerArray;

@end

@implementation HHNavigationController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initAllMenuItems];
    [self initAllViewControllers];
    [self configureMenuItemsEventResponse];
    [self initMenu];
    
    _controllerArray = [[NSMutableArray alloc] initWithArray:@[_newsSuperVC, _rankingsVC, _vc3, _vc4, _vc5]];
    _menu.controllerArray = _controllerArray;

    
    [self navigationBar].barTintColor = BlueBayoux;
    [self navigationBar].tintColor = AthensGray;
    [self navigationBar].titleTextAttributes=[NSDictionary dictionaryWithObject:AthensGray forKey:NSForegroundColorAttributeName];
}

// TODO: 应该在该导航控制器所导航的控制器中实现下面的方法
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.menu) {
        [self.menu dismissWithAnimation:NO];
    }
}

#pragma mark - Event Response

- (void)showMenu {
    
    if (self.menu.isOpen) {
        
//        for (HHBaseViewController* vc in self.controllerArray) {
//            
//            [vc.hamburgerButton setState:LBHamburgerButtonStateHamburger];
//        }
        [self.menu dismissWithAnimation:YES];
        
        
        
    } else {
        
//        for (HHBaseViewController* vc in self.controllerArray) {
//            
//            [vc.hamburgerButton setState:LBHamburgerButtonStateNotHamburger];
//        }
        [self.menu showInNavigationController:self];
        
        
    }
}

- (void)configureMenuItemsEventResponse {
    
    [self setViewControllers:@[_newsSuperVC]];
    
    
    __weak typeof(HHNavigationController *) weakSelf = self;
    __weak typeof(NewsSuperController *) weakNewsSuperVC = _newsSuperVC;
    _item1.completionBlock = ^{
        
        [weakSelf setViewControllers:@[weakNewsSuperVC]];
    };
    
//    __weak typeof(HHNavigationController *) weakSelf = self;
//    __weak typeof(HHBaseViewController *) weakVC1 = _vc1;
//    _item1.completionBlock = ^{
//        
//        [weakSelf setViewControllers:@[weakVC1]];
//    };
    
    __weak typeof(RankingsViewController *) weakRankingsVC = _rankingsVC;
    _item2.completionBlock = ^{
        
        [weakSelf setViewControllers:@[weakRankingsVC]];
    };
    
    __weak typeof(HHBaseViewController *) weakVC3 = _vc3;
    _item3.completionBlock = ^{
        
        [weakSelf setViewControllers:@[weakVC3]];
    };
    
    __weak typeof(HHBaseViewController *) weakVC4 = _vc4;
    _item4.completionBlock = ^{
        
        [weakSelf setViewControllers:@[weakVC4]];
    };
    
    __weak typeof(HHBaseViewController *) weakVC5 = _vc5;
    _item5.completionBlock = ^{
        
        [weakSelf setViewControllers:@[weakVC5]];
    };

}

#pragma mark - Init

- (void)initAllMenuItems {
    
    _item1 = [[DOPNavbarMenuItem alloc] initWithTitle:@"News" icon:[UIImage imageNamed:@"icon_News"]];
    _item2 = [[DOPNavbarMenuItem alloc] initWithTitle:@"Rankings" icon:[UIImage imageNamed:@"icon_Rankings"]];
    _item3 = [[DOPNavbarMenuItem alloc] initWithTitle:@"Search" icon:[UIImage imageNamed:@"icon_Searching"]];
    _item4 = [[DOPNavbarMenuItem alloc] initWithTitle:@"Trending" icon:[UIImage imageNamed:@"icon_Trending"]];
    _item5 = [[DOPNavbarMenuItem alloc] initWithTitle:@"Settings" icon:[UIImage imageNamed:@"icon_Settings"]];
}

- (void)initAllViewControllers {
    
//    _vc1 = [HHBaseViewController new];
//    _vc2 = [HHBaseViewController new];
    _vc3 = [HHBaseViewController new];
    _vc4 = [HHBaseViewController new];
    _vc5 = [HHBaseViewController new];
    
    _newsSuperVC = [NewsSuperController new];
    _rankingsVC = [RankingsViewController new];
    
//    [_vc1.view setBackgroundColor:AthensGray];
//    [_vc2.view setBackgroundColor:[UIColor flatPeterRiverColor]];
    [_vc3.view setBackgroundColor:[UIColor flatBelizeHoleColor]];
    [_vc4.view setBackgroundColor:[UIColor flatGreenSeaColor]];
    [_vc5.view setBackgroundColor:[UIColor flatWetAsphaltColor]];
//    
//    [[(HHBaseViewController *)_vc1 hamburgerButton] designateState:LBHamburgerButtonStateHamburger];
//    [[(HHBaseViewController *)_vc2 hamburgerButton] designateState:LBHamburgerButtonStateNotHamburger];
    [[(HHBaseViewController *)_vc3 hamburgerButton] designateState:LBHamburgerButtonStateNotHamburger];
    [[(HHBaseViewController *)_vc4 hamburgerButton] designateState:LBHamburgerButtonStateNotHamburger];
    [[(HHBaseViewController *)_vc5 hamburgerButton] designateState:LBHamburgerButtonStateNotHamburger];
    
    
    [[(HHBaseViewController *)_newsSuperVC hamburgerButton] designateState:LBHamburgerButtonStateHamburger];
    [[(HHBaseViewController *)_rankingsVC hamburgerButton] designateState:LBHamburgerButtonStateNotHamburger];
}

- (void)initMenu {
    
    _menu = [[DOPNavbarMenu alloc] initWithItems:@[_item1, _item2, _item3, _item4, _item5] width:self.view.dop_width maximumNumberInRow:3];
    
    [_menu setBackgroundColor:[UIColor colorWithRed:73/255.0 green:92/255.0 blue:109/255.0 alpha:0.71]];
    [_menu setSeparatarColor:[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1.0]];
    _menu.delegate = self;
}

#pragma mark - DOPNavbarMenuDelegate

- (void)didShowMenu:(DOPNavbarMenu *)menu {
}

- (void)didDismissMenu:(DOPNavbarMenu *)menu {
}

- (void)didSelectedMenu:(DOPNavbarMenu *)menu atIndex:(NSInteger)index {
}

@end
