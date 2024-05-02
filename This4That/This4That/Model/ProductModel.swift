//
//  ProductModel.swift
//  This4That
//
//  Created by csuftitan on 4/14/24.
//

import SwiftUI

struct Product: Identifiable{
    var id: UUID = .init()
    var name: String
    var category: String
    var image: String
    var  color: Color
    var price: Int
    
}

//sample product

//Product(name: "", category: "", image: "", color: , price: ),

var productList = [
    Product(name: "Shirt", category: "Clothes", image: "image 1", color: .yellow, price: 8),
    Product(name: "Hat", category: "Clothes", image: "image 2", color: .blue, price: 8),
    Product(name: "Scarf", category: "Clothes", image: "image 3", color: .red, price: 8),
    Product(name: "Tie", category: "Clothes", image: "image 4", color: .black, price: 8),
    Product(name: "Socks", category: "Clothes", image: "image 5", color: .gray, price: 8),
    Product(name: "Shoes", category: "Clothes", image: "image 6", color: .green, price: 8),
    Product(name: "Pants", category: "Clothes", image: "image 7", color: .brown, price: 8),
    Product(name: "Belt", category: "Clothes", image: "image 8", color: .white, price: 8),
    Product(name: "Underwear", category: "Clothes", image: "image 9", color: .orange, price: 8),
    Product(name: "Jacket", category: "Clothes", image: "image 10", color: .pink, price: 8),
    Product(name: "Sweater", category: "Clothes", image: "image 11", color: .purple, price: 8),
    Product(name: "Hotdog", category: "Food", image: "", color: .black, price: 4),
    Product(name: "Phone", category: "Electronics", image: "", color: .pink, price: 100),
]
