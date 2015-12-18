//
//  MainWireframe.swift
//  Example
//
//  Created by Davide Mendolia on 25/10/15.
//  Copyright © 2015 GoKarumi S.L. All rights reserved.
//

import Foundation
import BothamUI
import UIKit

class RootWireframe: ExampleWireframe {
    func presentInitialViewControllerInWindow(window: UIWindow) {
        let viewController = serviceLocator.provideRootTabBarController()
        viewController.viewControllers = self.tabsViewControllers()
        let tabBar = viewController.tabBar
        configureTabBarItems(tabBar)
        window.rootViewController = viewController
    }

    private func tabsViewControllers() -> [UIViewController] {
        let charactersNavigationController = serviceLocator.provideCharactersNavigationController()
        serviceLocator.navigatorContainer.register(charactersNavigationController)

        let comicsNavigationController = serviceLocator.provideComicsNavigationController()
        ServiceLocator.sharedInstance.navigatorContainer.register(comicsNavigationController)

        return [
            charactersNavigationController,
            comicsNavigationController
        ]
    }

    private func configureTabBarItems(tabBar: UITabBar) {
        tabBar.accessibilityLabel = "MainWireframe TabBar"
        tabBar.tintColor = UIColor.tabBarTintColor

        let charactersTabBarItem = tabBar.items?[0]
        charactersTabBarItem?.image = UIImage(named: "tab_bar_icon_characters")

        let comicsTabBarItem = tabBar.items?[1]
        comicsTabBarItem?.image = UIImage(named: "tab_bar_icon_comics")
    }
}