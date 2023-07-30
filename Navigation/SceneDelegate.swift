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
        
        func createMapViewController() -> UINavigationController {
            let mapVC = MapViewController()
            mapVC.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "house.fill"), tag: 0)
            return UINavigationController(rootViewController: mapVC)
        }
        
        func createLoginViewController() -> UINavigationController {
            let loginVC = LogInViewController()
            loginVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
            return UINavigationController(rootViewController: loginVC)
        }
        
        func createSavedPostsViewController() -> UINavigationController {
            let savedPostsVC = SavedPostsViewController()
            savedPostsVC.tabBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "square.and.arrow.up"), tag: 2)
            return UINavigationController(rootViewController: savedPostsVC)
        }
        
        func createTabBarController() -> UITabBarController {
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [ createMapViewController() , createLoginViewController(), createSavedPostsViewController()]
            return tabBarController
            
        }

        self.window?.rootViewController = createTabBarController()
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

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}

