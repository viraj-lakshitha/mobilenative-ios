import UIKit

var greeting = "Hello, playground"

// Constants => since this is constant, you can change it later on and also you have to give a value to constant
// If you want define the type of the constant, but it's not mandatory
let id = 20191157
let email:String = "viraj.20191157@iit.ac.lk"
let pi: Double = 3.1415926535

// Variables
var university = "Westminster"
var hometown:String = "Kurunegala"

// hometown = 12 -> if data type define or not, you can change the type after ward
var population = 1_000_000 // this is similar to 1000000

// If you want to typecast one to another, you have default func
var name:String = "viraj"
name = String(1234)

var number1: Double = 12
var number2: Float = 12.5
number2 = Float(number1)

// Tuples => key value pairs
var details: (attr: String, val: String) = ("Name", "Viraj Lakshitha")
print(details.0) // Name || or you can access it as details.attr
print(details.1) // Viraj Lakshitha || or you can access it as details.val

details = (attr: "Home Town", val: "Colombo")


// Control Flow
if (2 > 1) {
    print("2 is greater than 1")
}

let animal = "horse"

if (animal == "dog" || animal == "cat") {
    print("\(animal) is house-hold")
} else {
    print("\(animal) is not house-hold")
}

var timeOfDay = 12
var greet: String

if (timeOfDay > 6) {
    greet = "Early Morning"
} else if (timeOfDay > 12) {
    greet = "Morning"
} else if (timeOfDay > 17) {
    greet = "Afternoon"
} else if (timeOfDay > 20) {
    greet = "Evening"
} else if (timeOfDay < 24) {
    greet = "Night"
} else {
    greet = "INVALID HOUR!"
}

print(greeting)

let age = 12
if (age > 21) {
    print("can vote")
} else {
    print("cannot vote")
}

print("\(age > 21 ? "can vote" : "cannot vote")")

let currentDay = "Wendesday"

switch (currentDay) {
case "Saturday", "Sunday":
    print("Weekend")
case "Monday", "Tuesday", "Wendesday", "Thursday", "Friday":
    print("Weekend")
default:
    print("Undefined")
}

let indexOfDay = 1

switch(indexOfDay) {
case 1...5:
    print("Weekdays")
case 6, 7:
    print("Weekend")
default:
    print("Undefined")
}

let num = 10

switch(num) {
case let x where x % 2 == 0:
    print("Even")
default:
    print("Odd")
}

let currentCordinates: (x: Int, y: Int, z: Int) = (0,1,2)

switch(currentCordinates){
case (0,0,0):
    print("Origin")
case (0,_,_):
    print("On X cordinate")
case (_,0,_):
    print("On Y cordinate")
case (_,_,0):
    print("On Z cordinate")
default:
    print("On \(currentCordinates) cordinates")
}

switch(currentCordinates) {
case (let x, let y, _) where x == y:
    print("Along the x == y axis")
case (let x, let y, _) where x * x == y:
    print("Along the x ^ 2 axis")
default:
    print("IDK")
}

for index in 2..<5 {
    print(index)
}

for _ in 2...5 {
    print("Hello")
}

var sum = 0

for _ in 0..<5 {
    sum = sum + 1
}

while (sum < 10) {
    sum = sum + 1
    print(sum)
}

repeat {
    sum = sum + 1
    print(sum)
} while sum < 15

func printName(name: String) {
    print("Hellow \(name)")
}

printName(name: "Viraj")

func printName2(outsideName insideName: String) { // also you can omit the outside parameter by the "_"
    print("Howdy, \(insideName)")
}

printName2(outsideName: "Viraj")

func getPerson(name: String, age: Int) -> String {
    return "Hi! \(name) and your age \(String(age))"
}

getPerson(name: "Viraj", age: 22)

var value = 10

func updateValue(value: Int) -> Int {
    return value + 1
}

updateValue(value: value)

// if you want to directly update parameter value, then use inout
func updateValue2(value: inout Int) {
    value += 1
}

updateValue2(value: &value)

// function as variable
func addNums(num1: Int, num2: Int) -> Int {
    return num1+num2
}

var addFunc: (Int, Int) -> Int = addNums
print("addFunc -> \(addFunc(1,2))")

var personDetails: (String, Int) -> String = getPerson
print("getPerson -> \(getPerson(name: "Viraj", age: 22))")

// function as parameter for function
func functionAsParamForFunc(function: (Int, Int) -> Int, a: Int, b: Int) -> Int {
    return function(a, b)
}

functionAsParamForFunc(function: addFunc, a: 10, b: 10)

// Class
class PersonClass {
    var name: String
    var age: Int = 22
    
    // If you define the default values, then you can skip the parameters in constructor
    init(name: String) {
        self.name = "PersonName"
    }
    
    func getDetails() {
        print("Name: \(name), Age: \(age)")
    }
}

// Struct
struct PersonStruct {
    var name: String
    var age: Int
}

// Diff of class and struct => In class we have to define a default constructor (init) function. Class are pass by reference and structs pass by the values

var virajPersonC = PersonClass(name: "Viraj")
virajPersonC.name
virajPersonC.age
virajPersonC.getDetails()

var virajPersonS = PersonStruct(name: "Viraj", age: 22)
virajPersonS.name
virajPersonS.age

var virajPerson2C = virajPersonC
virajPerson2C.name = "Viraj_New"
virajPerson2C.name
virajPerson2C.age
virajPerson2C.getDetails()
