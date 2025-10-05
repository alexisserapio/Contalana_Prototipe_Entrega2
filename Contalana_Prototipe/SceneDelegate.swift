//
//  SceneDelegate.swift
//  Contalana_Prototipe
//
//  Created by UNAM on 22/08/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        let rootViewController: UIViewController
        let businessExists = UserDefaults.standard.bool(forKey: "businessExists")
        let formAnswered = UserDefaults.standard.bool(forKey: "formAnswered")
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if !businessExists {
            rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "welcomeViewController")
        } else if !formAnswered { // Uso un 'else if' para hacerlo más legible
            rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "formViewController")
        } else {
            rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "mainSceneViewController")
        }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let ventana = UIWindow(windowScene: windowScene)//Se instancia una ventana y la desempaqueta en el contexto
        ventana.rootViewController = rootViewController
        self.window = ventana
        ventana.makeKeyAndVisible()
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

