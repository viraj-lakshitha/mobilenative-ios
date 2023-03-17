//: [Previous](@previous)

import Foundation

let encoder = JSONEncoder()
let decoder = JSONDecoder()

struct TriangleCalculation: Codable {
    var altitude: String
    var base: String
    var hypoteneus: String
    var perimeter: String
    var area: String
}

var sampleObject: TriangleCalculation = TriangleCalculation(altitude: "altitudeValue", base: "baseValue", hypoteneus: "hypoteneusValue", perimeter: "perimeterValue", area: "areaValue")

let soEncode = try encoder.encode(sampleObject)
let soString = String(data: soEncode, encoding: .utf8)
