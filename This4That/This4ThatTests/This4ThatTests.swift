//
//  This4ThatTests.swift
//  This4ThatTests
//
//  Created by csuftitan on 4/14/24.
//

import XCTest
@testable import This4That

final class This4ThatTests: XCTestCase {
    
    func testAddToCart() throws {
        var cart = CartManager()
        cart.addToCart(product: productList[0])
        XCTAssertEqual(cart.products[0].id, productList[0].id)
    }
    
    func testRemoveFromCart() throws {
        var cart = CartManager()
        cart.addToCart(product: productList[0])
        cart.removeFromCart(product: cart.products[0])
        XCTAssertFalse(cart.has(product: productList[0]))
    }

    func testCheckout() throws {
        var cart = CartManager()
        var prod = productList
        cart.addToCart(product: productList[0])
        XCTAssertEqual(cart.total, productList[0].price)
        cart.checkOut()
        XCTAssertFalse(cart.has(product: productList[0]))
        XCTAssertEqual(cart.total, 0)
    }
    
    func testRemoveFromProductList() throws {
        var cart = CartManager()
        var prod = productList[0]
        cart.addToCart(product: productList[0])
        cart.checkOut()
        for product in productList {
            XCTAssertNotEqual(product.id, prod.id)
        }
    }
}
