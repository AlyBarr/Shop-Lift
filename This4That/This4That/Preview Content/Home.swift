//
//  Home.swift
//  This4That
//
//  Created by csuftitan on 4/14/24.
//

import SwiftUI


struct Home: View{

    //Category View Properties
    @State var selectedCategory = "All"
    //@EnvironmentObject var cartManager: CartManager
    @StateObject var cartManager: CartManager

    var body: some View{
        NavigationView{
            ScrollView{
                VStack{
                    HStack{
                        Text("Order From This4That")
                            .font(.system(size: 35))
                            .padding(.trailing)

                        Spacer()

                        Image(systemName: "arrow.left")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(30)
                    //Category List
                    HStack{
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                ForEach(categoryList, id: \.id) { item in
                                    Button(action: {
                                        selectedCategory = item.title
                                    }) {
                                        Text(item.title)
                                    }
                                        .padding()
                                        .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                                        .foregroundColor(selectedCategory != item.title ? .black : .white)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                    
                    if (selectedCategory == "All") {
                        Clothing(cartManager: cartManager)
                        Food(cartManager: cartManager)
                        Electronic(cartManager: cartManager)
                    } else if (selectedCategory == "Clothing") {
                        Clothing(cartManager: cartManager)
                    } else if (selectedCategory == "Food") {
                        Food(cartManager: cartManager)
                    } else if (selectedCategory == "Electronics") {
                        Electronic(cartManager: cartManager)
                    }
                }
            }
        }
    }
}


#Preview {
    Home(cartManager: CartManager())
        .environmentObject(CartManager())
}

struct Clothing: View {
    //@EnvironmentObject var cartManager: CartManager
    @StateObject var cartManager: CartManager
    var body: some View {
        HStack{
            Text("Clothing Collections")
                .font(.system(size: 25))

            Spacer()

            NavigationLink{
                CollectionView(category: "Clothes", cartManager: cartManager)
                    .environmentObject(CartManager())
            } label: {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
            }
            .foregroundColor(.black)

        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(productList, id: \.id) { item in
                    if (item.category == "Clothes") {
                        ProductCard(product: item)
                            .environmentObject(cartManager)
                    }
                }

            }
        }
    }
}

struct Food: View {
    //@EnvironmentObject var cartManager: CartManager
    @StateObject var cartManager: CartManager
    var body: some View {
        HStack{
            Text("Food Collections")
                .font(.system(size: 25))

            Spacer()

            NavigationLink{
                CollectionView(category: "Food", cartManager: cartManager)
                    .environmentObject(CartManager())
            } label: {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
            }
            .foregroundColor(.black)

        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(productList, id: \.id) { item in
                    if (item.category == "Food") {
                        ProductCard(product: item)
                            .environmentObject(cartManager)
                    }
                }

            }
        }
    }
}

struct Electronic: View {
    //@EnvironmentObject var cartManager: CartManager
    @StateObject var cartManager: CartManager
    var body: some View {
        HStack{
            Text("Electronic Collections")
                .font(.system(size: 25))

            Spacer()

            NavigationLink{
                CollectionView(category: "Electronics", cartManager: cartManager)
                    .environmentObject(CartManager())
            } label: {
                Image(systemName: "arrow.right")
                    .imageScale(.large)
            }
            .foregroundColor(.black)

        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(productList, id: \.id) { item in
                    if (item.category == "Electronics") {
                        ProductCard(product: item)
                            .environmentObject(cartManager)
                    }
                }

            }
        }
    }
}

//product card view
struct ProductCard: View {
    
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack{
            Image(product.image)
                .resizable()
                .scaledToFit()
                .padding(.trailing, -200)
                .rotationEffect(Angle(degrees: 30))
            
            ZStack{
                
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 30, weight: .semibold))
                        .frame(width: 140)
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    Spacer()
                    
                    HStack{
                        if (cartManager.has(product: product)) {
                            Text("Already in Cart")
                                .font(.system(size: 24, weight: .semibold))
                        } else {
                            Text("$\(product.price).00")
                                .font(.system(size: 24, weight: .semibold))
                            
                            Spacer()
                            
                            Button {
                                cartManager.addToCart(product: product)
                            } label: {
                                Image(systemName: "basket")
                                    .imageScale(.large)
                                    .padding()
                                    .frame(width: 90, height: 70)
                                    .background(.black)
                                    .clipShape(Capsule())
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, -10)
                        }
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height:80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                })
            }
            .padding(30)
            .frame(width: 335, height: 420)
            
        }
        .frame(width: 335, height: 420)
        .background(product.color.opacity(0.2))
        .clipShape(.rect(cornerRadius:  58))
        .padding(.leading, 20)
    }
}
