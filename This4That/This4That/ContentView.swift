//
//  ContentView.swift
//  This4That
//
//  Created by csuftitan on 4/14/24.
//

import SwiftUI
import UIKit

class ContentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "This4That"
        view.backgroundColor = .white

        // Add UI elements and navigation buttons for different sections
        setupUI()
    }

    func setupUI() {
        // Add buttons for different sections
        let nearbyStoresButton = UIButton(type: .system)
        nearbyStoresButton.setTitle("Nearby Stores", for: .normal)
        nearbyStoresButton.addTarget(self, action: #selector(nearbyStoresButtonTapped), for: .touchUpInside)
        // Add constraints or frame setup for the button

        // Add more buttons for other sections as needed
    }

    @objc func nearbyStoresButtonTapped() {
        let nearbyStoresVC = NearbyStoresViewController()
        navigationController?.pushViewController(nearbyStoresVC, animated: true)
    }

    // Add actions for other buttons to navigate to different sections
    
    
    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {

        var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            
            let homePageVC = HomePageViewController()
            let navigationController = UINavigationController(rootViewController: homePageVC)
            
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            
            return true
        }
    }
}
