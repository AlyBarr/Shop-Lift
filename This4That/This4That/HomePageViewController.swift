//
//  HomePageViewController.swift
//  This4That
//
//  Created by csuftitan on 4/14/24.
//
import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup UI elements for the home page
        setupUI()
    }

    func setupUI() {
        // Add labels, buttons, and other UI elements to the home page
        let titleLabel = UILabel(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 50))
        titleLabel.text = "Welcome to This4That"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(titleLabel)

        let nearbyStoresButton = UIButton(frame: CGRect(x: 50, y: 200, width: view.frame.width - 100, height: 50))
        nearbyStoresButton.setTitle("Find Nearby Stores", for: .normal)
        nearbyStoresButton.backgroundColor = .blue
        nearbyStoresButton.addTarget(self, action: #selector(nearbyStoresButtonTapped), for: .touchUpInside)
        view.addSubview(nearbyStoresButton)

        // Add more UI elements as needed
    }

    @objc func nearbyStoresButtonTapped() {
        // Handle tap on nearby stores button
        // Navigate to the nearby stores page
        let nearbyStoresVC = NearbyStoresViewController()
        navigationController?.pushViewController(nearbyStoresVC, animated: true)
    }
}
