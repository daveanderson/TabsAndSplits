//
//  SplitViewController.m
//  TabsAndSplits
//
//  Created by David Anderson on 2014-08-18.
//  Copyright (c) 2014 Robots and Pencils Inc. All rights reserved.
//

#import "SplitViewController.h"

@interface SplitViewController ()

@end

@implementation SplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    // Configure ourselves based on our inherited size and traits
    [self customizeViewsForSize:self.view.frame.size andTraits:self.traitCollection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    
    
    [self customizeViewsForSize:size andTraits:self.traitCollection];
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (void)customizeViewsForSize:(CGSize)newSize andTraits:(UITraitCollection *)newTraits {
    
    // Default display mode if horizontal size class is Compact is
    // UISplitViewControllerDisplayModeAllVisible regardless of size
    if (newTraits.horizontalSizeClass == UIUserInterfaceSizeClassCompact) {
        self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    }
    else {
        
        // If the new size represents a view where the width is greater than the
        // height (landscape), modify the display mode of the split view controller to be
        // side-by-side (DisplayModeAllVisible) otherwise we will set the primary view
        // controller as overlayed.

        if (newSize.width > newSize.height) {
            self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
        }
        else {
            // Overlay mode will overlay the tab bar as well!!
            // Given that this SplitViewController is inside a UITabBarController it seems a violation
            // of the visual hierarchy to have the
            self.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
            
            UIBarButtonItem *displayModeButtonItem = [self displayModeButtonItem];

            // The displayModeButtonItem will cause the `preferredDisplayMode` to (animated) be
            // changed to UISplitViewControllerDisplayModePrimaryOverlay
            // Unfortunately, even though the `SplitViewController` is *inside* a UITabBarController, when
            // preferredDisplayMode is set to UISplitViewControllerDisplayModePrimaryOverlay, the
            // overlaid Master overlays even the UITabBar.
            
            if ([self.viewControllers count] > 1) { // showing detail
                UINavigationController *navController = self.viewControllers[1];
                UIViewController *detailViewController = [navController.viewControllers firstObject];
                detailViewController.navigationItem.leftBarButtonItem = displayModeButtonItem;
            }
        }
    }
}


@end
