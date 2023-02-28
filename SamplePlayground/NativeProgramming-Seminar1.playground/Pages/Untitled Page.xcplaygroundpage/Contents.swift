class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func getDetails() {
        print("Name: \(name), Age: \(age)")
    }
}

class Student: Person {
    var school: String
    
    init(school: String) {
        self.school = school
    }
}

var student = Student(school: "Viraj")
