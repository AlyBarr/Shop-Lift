//
//  This4ThatApp.swift
//  This4That
//
//  Created by csuftitan on 4/14/24.
//

import UIKit
import CoreLocation
import MapKit
import SwiftUI

@main
class This4ThatApp: UIResponder, UIApplicationDelegate {

        var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            
            let contentViewController = ContentViewController() // Using UIKit's ContentViewController
            let navigationController = UINavigationController(rootViewController: contentViewController)
            
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            
            return true
        }
}

// Example data model for a product
struct Product {
    let name: String
    let price: Double
    let description: String
    let image: UIImage?
}

// Example class to manage nearby stores and product listings
class StoreManager: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager!
    var nearbyStores: [Store] = []

    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //guard let userLocation = locations.last else { return }
        // Use userLocation to find nearby stores
    }
}

// Example class representing a store
struct Store {
    let name: String
    let location: CLLocationCoordinate2D
    let products: [Product]
}

// Example UIViewController for displaying nearby stores on a map
class NearbyStoresViewController: UIViewController, MKMapViewDelegate {
    let mapView = MKMapView()
    let storeManager = StoreManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        view.addSubview(mapView)
        // Add constraints for mapView
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let userLocation = locations.last else { return }
        let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }

    // Implement mapView(_:viewFor:) to customize the annotation view for stores
}
