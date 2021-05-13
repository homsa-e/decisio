//
//  SceneDelegate.swift
//  TabBarDecisio
//
//  Created by Александр Егоров on 26.04.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let TBController = UITabBarController()
        
        let feedVC = FeedViewController()
        let vc2 = UIViewController()
        let vc3 = UIViewController()
        let appearance = UITabBarItem.appearance()
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray,
                                           NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .bold),
                                           NSAttributedString.Key.baselineOffset: UIOffset(horizontal: 10, vertical: 10)],
                                          for: .normal)
        appearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemBlue], for: .selected)
        vc2.view.backgroundColor = .blue
        vc3.view.backgroundColor = .green
        vc2.tabBarItem.title = "Мои споры"
        vc3.tabBarItem.title = "Профиль"
        vc2.tabBarItem.image = UIImage(systemName: "hand.draw")
        vc3.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        TBController.viewControllers = [vc2, feedVC, vc3]
        TBController.selectedIndex = 1
        TBController.tabBar.backgroundColor = .gray
        TBController.tabBar.tintColor = .systemBlue
        window?.rootViewController = TBController
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

