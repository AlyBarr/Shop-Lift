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
    Product(name: "Shirt", category: "Clothes", image: "image 1", color: .yellow, price: 38),
    Product(name: "Hat", category: "Clothes", image: "image 2", color: .blue, price: 3),
    Product(name: "Scarf", category: "Clothes", image: "image 3", color: .red, price: 4),
    Product(name: "Tie", category: "Clothes", image: "image 4", color: .black, price: 2),
    Product(name: "Socks", category: "Clothes", image: "image 5", color: .gray, price: 2),
    Product(name: "Shoes", category: "Clothes", image: "image 6", color: .green, price: 20),
    Product(name: "Pants", category: "Clothes", image: "image 7", color: .brown, price: 28),
    Product(name: "Belt", category: "Clothes", image: "image 8", color: .red, price: 24),
    Product(name: "Shorts", category: "Clothes", image: "image 9", color: .orange, price: 4),
    Product(name: "Jacket", category: "Clothes", image: "image 10", color: .pink, price: 48),
    Product(name: "Sweater", category: "Clothes", image: "image 11", color: .purple, price: 38),
    Product(name: "Hotdog", category: "Food", image: "image 12", color: .black, price: 4),
    Product(name: "Phone", category: "Electronics", image: "image 13", color: .pink, price: 200),
    Product(name: "Cereal", category: "Food", image: "image 14", color: .green, price: 2),
    Product(name: "Charger", category: "Electronics", image: "image 15", color: .blue, price: 4),
    Product(name: "Corn", category: "Food", image: "image 16", color: .yellow, price: 5),
    Product(name: "Tablet", category: "Electronics", image: "image 17", color: .purple, price: 140),
]

func removeProd(cart: inout [Product]) {
    for i in (0...cart.count - 1) {
        for j in (0...productList.count - 1) {
            if (cart[i].id == productList[j].id) {
                productList.remove(at: j)
                return
            }
        }
    }
}
