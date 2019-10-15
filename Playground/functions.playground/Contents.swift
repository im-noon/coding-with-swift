// Function without input
func getMilk() {
    print("go to the shop")
    print("buy 3 cartons of milk")
    print("pay 2$")
    print("come home")
}

// Function with input
func getMilkCartions(howManyMilkCartons : Int)  {
    let milkPerCartonCost:Double = 0.75;
    let milkCost:Double = Double(howManyMilkCartons) * milkPerCartonCost;
    
    print("go to the shop")
    print("buy \(howManyMilkCartons) cartons of milk")
    print("pay \(milkCost)$")
    print("com home")
}

// Function with output
func getMilkCartons(howManyMilkCartons :Int, howMuchMoney: Int) -> Int {
    let milkPerCartonCost:Int = 2;
    let milkCost:Int = howManyMilkCartons * milkPerCartonCost;
    let change :Int = howMuchMoney - Int(milkCost);
    
    print("go to the shop")
    print("buy \(howManyMilkCartons) cartons of milk")
    print("pay \(milkCost)$")
    print("com home")
    return change
}

// call the getMilk function
getMilkCartions(howManyMilkCartons: 12)
var amountOfChange = getMilkCartons(howManyMilkCartons: 1, howMuchMoney: 10)
print("Hello master, here's your \(amountOfChange)$ change")
