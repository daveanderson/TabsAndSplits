TabsAndSplits
=============

A demonstration of two UISplitViewControllers as children of a UITabBarController

On the iPad simulator in landscape, the two tabs provide the following arrangement of views (as expected). ![](http://cl.ly/image/3A421C3y3g3U/Image%202014-08-19%20at%2010.05.53%20AM.png)

![](http://cl.ly/image/35120L3r022d/Image%202014-08-19%20at%2010.06.09%20AM.png)

Note: The double-arrow button in the top left corner of the detail view is the `UISplitViewController` `-displayModeButtonItem`.

In landscape the `UISplitViewController`'s `preferredDisplayMode` property is set to 

```
self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
```

Using `- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator ` we are watching to see when we switch from landscape to portrait. When detected we change the `UISplitViewController`'s `preferredDisplayMode` property to

```
self.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
```

This results in the following arrangement of views (as expected).

![](http://cl.ly/image/191c2F3q2a3O/Image%202014-08-19%20at%2010.10.55%20AM.png)

Note: The back (<) button in the top left corner of the detail view is the `UISplitViewController` `-displayModeButtonItem`. Tapping this button will, using animation, change the `UISplitViewController`'s `preferredDisplayMode` property to `UISplitViewControllerDisplayModePrimaryOverlay`.

Using this sample app in portrait mode, it is desirable that on tapping the back (<) button in the top left corner in the detail view that the master view should be displayed as an overlay. However, the overlay appears "above" the `UITabBar` as seen below:

![](http://cl.ly/image/3Q3H2R262N0Z/Image%202014-08-19%20at%2010.14.47%20AM.png)

There does not appear to be a way to display the overlay in such a fashion as it is *under* the tab bar, but an overlay of the detail view. The appearance of the master view *over top of the tab bar* seems like a violation of the implied view hierarchy.

It was expected, given the arrangement of a UISplitViewController inside a UITabBarController, that the overlay master view controller would be displayed under the tab bar but over the detail view, as see in the following **mockup**:

![](http://cl.ly/image/0p0n401d043Q/Image%202014-08-19%20at%2010.22.40%20AM.png)

It should be noted that the iOS 7 documentation specifically states that 

> A split view controller must always be the root of any interface you create. In other words, you must always install the view from a UISplitViewController object as the root view of your application’s window. The panes of your split view interface may then contain navigation controllers, tab bar controllers, or any other type of view controller you need to implement your interface.

https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewControllerCatalog/Chapters/SplitViewControllers.html

Despite this statement, however, it appears that several of Apple's own iPad apps are breaking the recommended convention. (The `UISplitViewControllerDisplayModePrimaryOverlay` option is only available in iOS8.)

## Podcasts

![](http://cl.ly/image/053J1o0X2p1o/Image%202014-08-19%20at%2011.35.40%20AM.png)

## iTunes U

![](http://cl.ly/image/0D3u3L2h1B1A/Image%202014-08-19%20at%2011.30.04%20AM.png)

## WWDC

![](http://cl.ly/image/323W2c3G1L1A/Image%202014-08-19%20at%2011.30.31%20AM.png)
