import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBarController()
        window?.makeKeyAndVisible()
    }
    
    func createTabBarController() -> UITabBarController {
        let tabbar = UITabBarController()
        UITabBar.appearance().tintColor = .systemIndigo
        tabbar.viewControllers = [createHomeNC(), createHistoryNC(), createLiveNC()]
        return tabbar
    }
    
    func createHomeNC() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "flame.fill"), tag: 0)
        return UINavigationController(rootViewController: homeVC)
    }
    
    func createHistoryNC() -> UINavigationController {
        let historyVC = HistoryVC()
        historyVC.title = "History"
        historyVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "clock"), tag: 1)
        return UINavigationController(rootViewController: historyVC)
    }
    
    func createLiveNC() -> UINavigationController {
        let exercisesVC = LiveVC()
        exercisesVC.title = "Live"
        exercisesVC.tabBarItem = UITabBarItem(title: "Exercises", image: UIImage(systemName: "rectangle.grid.2x2"), tag: 2)
        return UINavigationController(rootViewController: exercisesVC)
    }
    
}

