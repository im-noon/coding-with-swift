import UIKit

var str = "Hello, playground"
// Conculation
// if-else
func loveCalulator(yourName:String, theirName:String) -> String {
    let loveScore = Int.random(in: 0..<101)
    let yourLoveScore = "Your love score is \(loveScore)."
    
    if loveScore > 80 {
        return "\(yourLoveScore) \(yourName) and \(theirName), your love each other like Kanye love Kanye."
    }
    else if loveScore > 40 && loveScore <= 80 {
        return "\(yourLoveScore) No love possible, you go together like coke and mentos."
    }
    else {
        return "\(yourLoveScore) No love possible, you'll be forever alone!"
    }
}

func bmiCalulation(weightInKgs:Double, heightInM:Double) -> String {
    let bmi = weightInKgs/(heightInM * heightInM)
    var interpretation = ""
    
    if bmi > 25 {
        interpretation = "Your are overweight."
    }
    else if bmi > 18.5 && bmi <= 25 {
        interpretation = "Your are normal weight."
    }
    else {
        interpretation = "Your are under weight."
    }
    return String(format: "You BMI is %.2f. %@", bmi, interpretation)
}

func bmiInMetricUnit(weightInKgs:Double, heightInM:Double) -> String {
    return bmiCalulation(weightInKgs: weightInKgs, heightInM: heightInM)
}

func bmiInImperialUnit(weightInPounds:Double, heightInFeet:Double, heightInInces:Double) -> String {
    let weightInKgs = weightInPounds * 0.45359237
    let heightInM = (heightInFeet * 12 + heightInInces) * 0.0254
    return bmiCalulation(weightInKgs: weightInKgs, heightInM: heightInM)
}

print(loveCalulator(yourName: "Adam", theirName: "Eve"))
print(bmiInMetricUnit(weightInKgs: 75, heightInM: 1.65))
print(bmiInImperialUnit(weightInPounds: 140, heightInFeet: 5, heightInInces: 11))


