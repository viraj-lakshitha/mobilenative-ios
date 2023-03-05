import UIKit

var greeting = "Hello, playground"

struct Test {
    var name: String
    var age: Int
    var details: String {
        get {
            return "Name: \(name), Age: \(age)"
        }
        set {
            name = newValue
            print("Name: \(name), Age: \(age)")
        }
    }
}

var test = Test(name: "Viraj", age: 22)
print(test.details)
test.details = "Viraj-New"
print(test.details)
