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
        VStack(alignment: .leading){
            Home()
                .environmentObject(cartManager)
            if cartManager.products.count > 0 {
                HStack(spacing: 30){
                    Text("\(cartManager.products.count)")
                        .padding()
                        .background(.yellow)
                        .clipShape(Circle())
                        .foregroundColor(.black)
                    VStack(alignment: .leading){
                        Text("Cart")
                            .font(.system(size: 26, weight: .semibold))
                        
                        Text("\(cartManager.products.count) Item")
                            .font(.system(size: 18))
                    }
                                  
                    Spacer()
                    
                    ForEach(cartManager.products, id: \.name){ product in
                        Image(product.image)
                            .resizable()
                            .padding(8)
                            .frame(width:60, height: 60)
                            .background(.white)
                            .clipShape(Circle())
                            .padding(.leading, -60)
                    }
                }
                .padding(30)
                .frame(width: .infinity, height: 100)
                .background(.black)
                .foregroundColor(.white)
            }
        }
    }
}
    
#Preview {
    ContentView()
    
    // Add actions for other buttons to navigate to different sections
    
}
