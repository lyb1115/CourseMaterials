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


names.sort(){ (a:String, b:String) -> Bool in
    return a > b
}
names.sort(>)
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


var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// prints "5"
let customerProvider = { customersInLine.removeAtIndex(0) }
print(customersInLine.count)
// prints "5"
print("Now serving \(customerProvider())!")
// prints "Now serving Chris!"
print(customersInLine.count)
// prints "4"


//将闭包作为参数传递给函数时，你能获得同样的延时求值行为。
// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serveCustomer(customerProvider: () -> String) {//在这里相当于定义了一个闭包
    print("Now serving \(customerProvider())!")
}
serveCustomer( { customersInLine.removeAtIndex(0) } )
// prints "Now serving Alex!"
//:*延迟形为：你用定义了一个函数声明了一个包含函数类型为参数的，这就相当于声明了一个闭包（但是没有gg具体的声明是什么），你什么时候执行这个闭包，要看你什么时候调用这个函数


// customersInLine is ["Ewa", "Barry", "Daniella"]
func serveCustomer(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer(customersInLine.removeAtIndex(0))
// prints "Now serving Ewa!"


//如果你想让这个闭包可以“逃逸”，则应该使用 @autoclosure(escaping) 特性.
// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(@autoclosure(escaping) customerProvider: () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.removeAtIndex(0))
collectCustomerProviders(customersInLine.removeAtIndex(0))
print("Collected \(customerProviders.count) closures.")
// prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// prints "Now serving Barry!"
// prints "Now serving Daniella!"

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}






