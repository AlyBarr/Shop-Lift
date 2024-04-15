//
//  NearbyStoresViewContoroller.swift
//  This4That
//
//  Created by csuftitan on 4/14/24.
//
import UIKit
import MapKit

class NearbyStoresViewContoroller: UIViewController, MKMapViewDelegate {

    let mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nearby Stores"
        view.backgroundColor = .white

        setupMapView()
    }

    func setupMapView() {
        mapView.delegate = self
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)

        // Add constraints for the map view
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Add code to populate the map with nearby stores
        addNearbyStoresToMap()
    }

    func addNearbyStoresToMap() {
        // Code to fetch nearby stores and add annotations to the map
        // Example:
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        annotation.title = "Example Store"
        mapView.addAnnotation(annotation)
    }

    // MKMapViewDelegate methods can be implemented here if needed
}
