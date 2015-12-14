/*:
函数（Functions）
本页包含内容：
* 函数定义与调用（Defining and Calling Functions）
* 函数参数与返回值（Function Parameters and Return Values）
* 函数参数名称（Function Parameter Names）
* 函数类型（Function Types）
* 嵌套函数（Nested Functions）
*/



//: ###### 函数的定义与调用（Defining and Calling Functions）

//:定义一个 "sayHello(_:)"函数


func sayHello (personName:String) -> String {
   return "say hello to \(personName)"
}
//:注意：*sayHello后不用像OC一样加冒号(:)*
//:函数的调用
sayHello("JayKong")


func sayHelloAgain(personName: String) -> String {
    return "Hello again, " + personName + "!"
}
print(sayHelloAgain("Anna"))
// prints "Hello again, Anna!"
//: ### 函数参数与返回值（Function Parameters and Return Values）

//:* 无参函数（Functions Without Parameters）
//:### 写出一个无参函数
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// prints "hello, world"

//:* 多参数函数 (Functions With Multiple Parameters)
//:### 练习：写出一个多参数函数
func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloAgain(personName)
    } else {
        return sayHello(personName)
    }
}
print(sayHello("Tim", alreadyGreeted: true))
// prints "Hello again, Tim!"

//:* 无返回值函数（Functions Without Return Values）
//:### 练习：定义一个sayGoodbye(_:) ，这个函数直接输出 String 值，而不是返回它
func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}
sayGoodbye("Dave")
// prints "Goodbye, Dave!"

//: 没有定义返回类型的函数会返回特殊的值，叫 Void,可以写成 ()


//: 一个函数的返回值可以被忽略：
func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}
printAndCount("hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting("hello, world")
// prints "hello, world" but does not return a value
//:* 多重返回值函数（Functions with Multiple Return Values）
//: 你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回。

//:### 练习：定义了一个名为 minMax(_:) 的函数，作用是在一个 Int 数组中找出最小值与最大值。
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
//:* 可选元组返回类型(Optional Tuple Return Types)
//: 通过在元组类型的右括号后放置一个问号来定义一个可选元组，例如 (Int, Int)? 或 (String, Int, Bool)?
//:### 写一个函数返回整型数组的最大、最小值，一个[Int]参数,返回(Int,Int)


func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
//: ### 函数参数名称（Function Parameter Names）
//: 函数参数都有一个外部参数名（external parameter name）和一个局部参数名（local parameter name）

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}
someFunction(1, secondParameterName: 2)
//: 所有参数必须有独一无二的局部参数名
//
//func mustBeUnique(unique1:Int,unique2:Int,unique1:Int){
//    
//}
//:* 指定外部参数名（Specifying External Parameter Names）
func someFunction(externalParameterName localParameterName: Int) {
    // function body goes here, and can use localParameterName
    // to refer to the argument value for that parameter
}
someFunction(externalParameterName: 1)

func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}
print(sayHello(to: "Bill", and: "Ted"))
// prints "Hello Bill and Ted!"

//:* 忽略外部参数名（Omitting External Parameter Names）
//: 如果你不想为第二个及后续的参数设置外部参数名，用一个下划线（ _ ）代替一个明确的参数名
func someFunction(firstParameterName: Int, _ secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}
someFunction(1, 2)
//:* 默认参数值（Default Parameter Values）
//: 当默认值被定义后，调用这个函数时可以忽略这个参数
func someFunction(parameterWithDefault: Int = 12) {
    // function body goes here
    // if no arguments are passed to the function call,
    // value of parameterWithDefault is 12
}
someFunction(1)
someFunction(6) // parameterWithDefault is 6
someFunction() // parameterWithDefault is 12
//:* 可变参数（Variadic Parameters）
//: 一个 可变参数（variadic parameter） 可以接受零个或多个值

//:### 练习：写一个函数用来计算一组任意长度数字的算术平均数（arithmetic mean）
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
//:* 常量参数和变量参数（Constant and Variable Parameters）
//:通过在参数名前加关键字 var 来定义变量参数：

//:### 练习:将一个字符串"hello"前加4个空格
func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, totalLength: 10, pad: "-")
// paddedString is equal to "-----hello"
// originalString is still equal to "hello"
//:* 输入输出参数（In-Out Parameters）
//:swapTwoInts(_:_:)
func swapTwoInts(inout _a:Int, inout _b:Int) {
    let temp = _a
     _a = _b
     _b = temp
    
}
var firstA = 10
var firstB = 7
swapTwoInts(&firstA, _b: &firstB)
firstA
firstB

//不用inout
func swapTwoIntsWithoutInout(var _a:Int,var _b:Int) {
    let temp = _a
    _a = _b
    _b = temp
}
swapTwoIntsWithoutInout(firstA, _b: firstB)
firstA
firstB

//: ### 函数类型（Function Types）
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}
//(Int ,Int) -> Int

func printHelloWorld() {
    print("hello, world")
}
//() -> void
//:* 使用函数类型（Using Function Types）
//: 定义一个类型为函数的常量或变量
var aFunction:(Int,Int)->Int

//:* 函数类型作为参数类型（Function Types as Parameter Types）

//: ### 练习：写一个函数printMathResult，打印出两个整数相加的结果，要求将类型为(Int, Int) -> Int的addTwoInts函数作为参数
func addTwoInts(a:Int,b:Int) -> Int {
    return a + b
}

func printMathResult(addTwoInts:(Int,Int) -> Int,_a:Int,_b:Int) {
    
  print("result:\(addTwoInts)")
}
print(addTwoInts(3, b: 8))
//:* 函数类型作为返回类型（Function Types as Return Types）

//: ### *写一个函数chooseStepFunction(_:)返回类型为(Int)->Int，一个参数为Bool*
func stepForward( input:Int) ->Int {
   return input + 1
}


func stepBackward ( input:Int) ->Int {
   return input - 1
}



func chooseStepFunction(isIn:Bool) -> (Int)->Int {
    return isIn ? stepForward : stepBackward
}
var steps = 10
var stepforward = chooseStepFunction(10 > 0)
stepForward(10)

//: ### 嵌套函数（Nested Functions）
//: **用返回嵌套函数的方式重写chooseStepFunction(_:) 函数**
func chooseStepFunction(step:Int)-> (Int)->Int {
    
    func stepForward( input:Int) ->Int {
      return input + 1
    }
    func stepBackward(input:Int)->Int {
      return  input - 1
    }
    if step > 0 {
    return stepForward
    } else
    {
    return stepBackward
    }
}

var stepin = chooseStepFunction(1)
stepin(2)
var stepout = chooseStepFunction(-1)
stepout(1)


func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction2(currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!


