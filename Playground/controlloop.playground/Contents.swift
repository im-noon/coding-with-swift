import UIKit

let arrayOfNumber = [1, 2, 3, 4, 5, 6, 7, 8, 9]

// basic for loop
for number in arrayOfNumber {
    print(number)
    print("new iter.")
}

// basic calculation with for
let ageOfDogs = [1.5, 2.3, 1.3, 4.4, 2.5, 3.6, 4.7, 4.8, 2.9]

// basic for loop
var avg :Double = 0

for age in ageOfDogs {
    avg += age
}
avg /= Double(ageOfDogs.count)
print("average age of my dog : \(avg)")

// for .. in loop
print("for range...")
for number in 1...10 {
    print(number)
}

// for ... in with condition
print("for wiht condition")
for number in 1...10 where number % 2 == 0 {
    print(number)
}

func beerSongWithThisManyBottle(_ numberOfBottle :Int) -> String {
    var lyrics:String = ""
    
    var newline = ""
    for number in (1...numberOfBottle).reversed() {
        if number == 1 {
            newline = "\n\(number) bottle of beer on the wall, \n\(number) bottle of beer. Take one down and pass it around, \n\(number-1) bottle of beer on the wall."
        }
        else {
           newline = "\n\(number) bottles of beer on the wall, \n\(number) bottles of beer. Take one down and pass it around, \n\(number-1) bottles of beer on the wall."
        }

        lyrics += newline
    }
    lyrics += "\nNo more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, \(numberOfBottle) bottles of beer on the wall."
    
    return lyrics
}

print(beerSongWithThisManyBottle(10))
