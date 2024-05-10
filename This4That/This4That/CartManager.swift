//
//  CartManager.swift
//  This4That
//
//  Created by csuftitan on 4/28/24.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Product){
        products.append(product)
        total += product.price 
    }
    
    func removeFromCart(product: Product){
        products = products.filter {$0.id != product.id}
        total -= product.price
    }
    
    func has(product: Product) -> Bool {
        for prod in products {
            if (prod.id == product.id) {
                return true
            }
        }
        return false
    }
    
    func checkOut() {
        for prod in products {
            removeProd(cart: &products)
        }
        products.removeAll()
    }
    
}
