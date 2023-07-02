//
//  SceneDelegate.swift
//  Navigation
//
//  Created by ln on 06.08.2022.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        let feedNavController = UINavigationController(rootViewController: FeedViewController())
        let logInViewController = UINavigationController(rootViewController: LogInViewController())
        let tabBarController = UITabBarController()

        tabBarController.viewControllers = [ feedNavController , logInViewController]
        tabBarController.viewControllers?.enumerated().forEach {
            $1.tabBarItem.title = $0 == 0 ? NSLocalizedString("feed.controller", comment: "") : NSLocalizedString("profile.controller", comment: "")
            $1.tabBarItem.image = $0 == 0 ? UIImage(systemName: "house.fill") : UIImage(systemName: "person.fill")
        }
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
        do {
            try Auth.auth().signOut()
        }
        catch {
            print ("Ошибка signOut")
        }
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

