class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [PlaceMapController.alloc.init, PlaceListController.alloc.init]
    tabbar.selectedIndex = 0
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tabbar)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    return true
  end

  def place_details_controller
    @place_details_controller ||= PlaceDetailsController.alloc.init
  end
end
