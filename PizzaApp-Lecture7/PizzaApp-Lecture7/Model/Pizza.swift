//
//  Pizza.swift
//  PizzaApp-Lecture7
//
//  Created by Viraj Lakshitha Bandara on 2023-03-12.
//

import Foundation

struct Pizza: Identifiable, Encodable, Decodable {
    var id = UUID()
    var name: String
    var ingredients: String
    var imageName: String
    var thumbnailName: String
    var type: String
}

struct PizzaDAO: Encodable, Decodable {
    var name: String
    var ingredients: String
    var imageName: String
    var thumbnailName: String
    var type: String
}
