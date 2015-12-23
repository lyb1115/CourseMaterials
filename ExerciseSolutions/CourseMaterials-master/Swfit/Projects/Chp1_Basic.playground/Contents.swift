//: Playground - noun: a place where people can play
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0


//let Int:Int = 3
let double:Double = 5

let int = 6
//var Int = 9
var constant = 10
var con = 1
let `float` = 9.1

enum myEnum {
    case `self`, `super`
}

let int5 = 5
var double6_7 = 6.7

//var result = int5 + double6_7

var result = 5 + 6.7

let i = 1
if i==1 {
    
}
//:定义了一个String，如果是整数，输出整数；如果不是，输出消息“不能获得整数”
var possibleStr:String = "123";

if Int(possibleStr) == nil {
    print("不能获得整数")
} else {
   print(possibleStr)
}

if let num = Int(possibleStr) {
    print("the number is \(num)")
} else {
   print("不能获得整数")
}


var anImplictlyUnwrappedOption:String! = nil

if anImplictlyUnwrappedOption != nil {
    print(anImplictlyUnwrappedOption)
} else {
    print("nil value")
}

if let unwrapped = anImplictlyUnwrappedOption {
    print(unwrapped)
} else {
    print("nil value")
}

anImplictlyUnwrappedOption = nil
//anImplictlyUnwrappedOption + "Fu"
//print(anImplictlyUnwrappedOption)

var option:String? = "Fiona"
print(option!)

option = nil

//print(option!)

//:定义一个能throw异常的方法

enum EncryptionError:ErrorType {
    case Empty
    case Short
    
}
func passwordLength(length:Int) throws ->String{
//    if length == 0 {
//    throw EncryptionError.Empty
//    }
    if length <= 5
    {
    throw EncryptionError.Short
    }
    return "correct"
}

do {
  let result =  try passwordLength(2)
    print(result)
}
catch {
     EncryptionError.Empty
     print("psw is empty")
    
}
catch {
    EncryptionError.Short
    print("psw is too short")
}





func aMethodCanThrow() throws {
    
    
    print("i can throw")
}

do {
    try aMethodCanThrow()
    print("no error")
} catch {
   print("an error")
}


let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")


