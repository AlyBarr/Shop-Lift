//
//  ProductListingViewController.swift
//  This4That
//
//  Created by csuftitan on 4/14/24.
//

import UIKit

class ProductListingViewController: UIViewController {

    var product: Product?

    override func viewDidLoad() {
            super.viewDidLoad()
            // Setup UI elements for the product listing page
            setupUI()
            setupNavigationBar()
    }

    func setupNavigationBar() {
        navigationItem.title = "Product Details"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title:"Back", style: .plain, target: self, action: #selector(backButtonTapped))
    }

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    func setupUI() {
        guard let product = product else { return }

        // Add labels, image view, and other UI elements to display product information
        let productImageView = UIImageView(frame: CGRect(x: 20, y: 100, width: 150, height: 150))
        productImageView.image = product.image
        view.addSubview(productImageView)

        let nameLabel = UILabel(frame: CGRect(x: 20, y: 270, width: view.frame.width - 40, height: 30))
        nameLabel.text = product.name
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(nameLabel)

        let priceLabel = UILabel(frame: CGRect(x: 20, y: 310, width: view.frame.width - 40, height: 30))
        priceLabel.text = "Price: $\(product.price)"
        priceLabel.textAlignment = .center
        view.addSubview(priceLabel)

        let descriptionLabel = UILabel(frame: CGRect(x: 20, y: 350, width: view.frame.width - 40, height: 100))
        descriptionLabel.text = product.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        view.addSubview(descriptionLabel)

        // Add more UI elements as needed
    }
}
