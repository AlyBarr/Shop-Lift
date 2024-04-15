//
//  CategoryModel.swift
//  This4That
//
//  Created by csuftitan on 4/14/24.
//
import SwiftUI

struct CategoryModel: Identifiable, Hashable{
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "Clothing", title: "Clothing"),
    CategoryModel(icon: "Food", title: "Food"),
    CategoryModel(icon: "Electronics", title: "Electronics"),

]
