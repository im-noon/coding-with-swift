import Cocoa

func add(n1 : Int, n2 : Int) -> Int {
    return n1 + n2
}

func multiply(n1 : Int, n2 : Int) -> Int {
    return n1 * n2
}

func calculator(n1 : Int, n2 : Int, operation : (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

print(calculator(n1: 2, n2: 3, operation: add))

calculator(n1: 2, n2: 3){(n01, n02) in n01 * n02}
calculator(n1: 2, n2: 3){ $0, $1}
