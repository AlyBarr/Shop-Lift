//
//  ContentView.swift
//  This4That
//
//  Created by csuftitan on 4/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Home(cartManager: cartManager)
                    .environmentObject(cartManager)
                if cartManager.products.count > 0 {
                    HStack(spacing: 30){
                        /*Text("\(cartManager.products.count)")
                            .padding()
                            .background(.yellow)
                            .clipShape(Circle())
                            .foregroundColor(.black)*/
                        VStack(alignment: .leading){
                            NavigationLink(destination: CartView(cartManager: cartManager)) {
                                Text("View Cart")
                                    .font(.system(size: 24, weight: .semibold))
                                    .padding(10)
                                    .background(.yellow)
                                    .foregroundColor(.black)
                                    .clipShape(Capsule())
                            }
                            Text("\(cartManager.products.count) Item")
                                .font(.system(size: 18))
                                
                        }
                        
                        Spacer()
                        
                        if (cartManager.products.count < 6) {
                            ForEach(cartManager.products, id: \.name){ product in
                                Image(product.image)
                                    .resizable()
                                    .padding(8)
                                    .frame(width:60, height: 60)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.leading, -60)
                            }
                        } else {
                            Image(cartManager.products[0].image)
                                .resizable()
                                .padding(8)
                                .frame(width:60, height: 60)
                                .background(.white)
                                .clipShape(Circle())
                                .padding(.leading, -60)
                            Image(cartManager.products[1].image)
                                .resizable()
                                .padding(8)
                                .frame(width:60, height: 60)
                                .background(.white)
                                .clipShape(Circle())
                                .padding(.leading, -60)
                            Image(cartManager.products[2].image)
                                .resizable()
                                .padding(8)
                                .frame(width:60, height: 60)
                                .background(.white)
                                .clipShape(Circle())
                                .padding(.leading, -60)
                            Image(cartManager.products[3].image)
                                .resizable()
                                .padding(8)
                                .frame(width:60, height: 60)
                                .background(.white)
                                .clipShape(Circle())
                                .padding(.leading, -60)
                            Image(cartManager.products[4].image)
                                .resizable()
                                .padding(8)
                                .frame(width:60, height: 60)
                                .background(.white)
                                .clipShape(Circle())
                                .padding(.leading, -60)
                        }
                    }
                    .padding(30)
                    //.frame(width: .infinity, height: 120)
                    .background(.black)
                    .clipShape(.rect(topLeadingRadius: 60, topTrailingRadius: 60))
                    .foregroundColor(.white)
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
    
#Preview {
    ContentView()
        .environmentObject(CartManager())
    // Add actions for other buttons to navigate to different sections
}
