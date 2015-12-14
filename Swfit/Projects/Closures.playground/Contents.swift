//: Playground - noun: a place where people can play

import UIKit

////:{(parameters)-> return_Type in
//    statement
//}
//:eg.1
let simpleCloure = {
    print("wecome to swift closure")
}
simpleCloure()

//:eg.2

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(value1:String,value2:String) -> Bool {
    return value1 > value2
}
names.sort(backwards)


names.sort({ (a:String, b:String) -> Bool in
   return a > b
})
//函数类型作为参数
func add(a:Int,b:Int) -> Int {
    return a + b
}

func printAdd(add:(Int,Int)->Int,a:Int,b:Int) {
   print(add(a,b))
}
printAdd(add, a: 2, b: 3)

//
let subtract = { (a:Int,b:Int)-> Int in
    return a - b
}
printAdd(subtract, a: 3, b: 2)

printAdd({ (a:Int,b: Int) -> Int in
    return a + b
    }, a: 3, b: 2)


//func makeIncrementor(forIncrement amount: Int) -> () -> Int

