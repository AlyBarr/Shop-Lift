//
//  Home.swift
//  This4That
//
//  Created by csuftitan on 4/14/24.
//

import SwiftUI

struct Home: View{

    //Category View Properties
    @State var selectedCategory = "Clothes"

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
                    CategoryListView
                    
                    //collection view
                    HStack{
                        Text("Clothing Collections")
                            .font(.system(size: 25))
                        
                        Spacer()
                        NavigationLink{
                            CollectionView()
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
                        .foregroundColor(.black)
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    //product list
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(productList, id: \.id) { item in
                                ProductCard(product: item)
                            }
                            
                        }
                    }
                }
            }
        }
    }
        
        //CategoryList View
        var CategoryListView: some View{
            HStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        ForEach(categoryList, id: \.id) {item in
                            Button {
                                selectedCategory = item.title
                            } label: {
                                HStack{
                                    if item.title == "All" {
                                        Image(item.icon)
                                            .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                    }
                                    
                                    Text(item.title)
                                }
                                .padding()
                                .background(selectedCategory == item.title ? .black :
                                        .gray.opacity(0.1))
                                .foregroundColor(selectedCategory != item.title ? .black :
                                        .white)
                                .clipShape(Capsule())
                        }
                    }
                }
                    .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    Home()
}


//product card view
struct ProductCard: View {
    
    var product: Product
    
    
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
                        Text("$\(product.price).00")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 90, height: 70)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
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
