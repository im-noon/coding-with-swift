import Foundation

var pizzaInInches : Int = 14 {
    willSet {
        print(pizzaInInches)
        print(newValue)
    }
    didSet {
        print(oldValue)
        print(pizzaInInches)
    }
}

pizzaInInches = 33

var numberOfPeople: Int = 6
let slicePerPerson : Int = 5

var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
}
var numberOfPizza : Int {
    get {
        let numberOfPeoplePerPizza = numberOfSlices / slicePerPerson
        return numberOfPeople / numberOfPeoplePerPizza
    }
    set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicePerPerson
    }
}

numberOfPizza = 4

print(numberOfPeople)
