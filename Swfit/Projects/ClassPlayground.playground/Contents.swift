//: Playground - noun: a place where people can play

//import UIKit
//
//print("hello swift")
//
//let constantValue = 100
//var variableValue = 99
//variableValue = 888
//
//let valueHaveType:Float = 3.4
//var valueInt:Int = 44
//
//var myString = "the number is"
//myString = myString + "\(valueInt)"
//
//var str2 = "the str is "
//var anotherStr = "another str2 is :\(valueInt)"
//
//
////var numberStr = str2 + (String)valueInt
//
////"44","cat"
//
//var a44 = "44"
//var cat = "cat"
//var my44 = (Int)(a44)
//var mycat = (Int)(cat)
//
//let apples = 3
//let oranges = 5
//let appleSummary = "I have \(apples) apples"
//let fruitSummary = "I have \(apples + oranges)pieces of fruit"
//
//var shoppingList = ["catfish","water","tilips","bluepaint"]
//shoppingList[1] = "bottle of water"
//print(shoppingList)
//print(shoppingList[1])
//print(shoppingList[0])
//print(shoppingList[2])
//
//var occupations  = ["Malcolm":"Captain","Kaylee":"Mechanic"]
//occupations["Jayne"] = "PublicRelations"
//print(occupations)
//
//let emptyArr = [String]()
//let emptyDic = Dictionary<String,Float>()
////shoppingList = []
//print(shoppingList)
//
//var optionalString:String? = "jaykong"
//optionalString = nil;
//var anotherName = "lucyFu"
//var greetingname = "hello"
//
//if let name = optionalString {
//   greetingname = "hello,\(name)"
//} else {
//    greetingname = "hello,\(anotherName)"
//}
//
//
////var i = 1
////repeat
////{
////  ++i
////} while i == 4
//
//let veg = "red pepper"
//switch veg {
//    case "celery":
//    let vegComt = "aad Some on log"
//    case "cucumber","watercress":
//    let vegCmt = "that make a good sandwich"
//case let x where x.hasSuffix("pepper"):
//    
//    let vegcmt = "is it a spicey\(x)"
//    
//
//default:
//    print("default")
//}
//
//for index in 1..<3 {
//    print(index)
//}
//var numberOfshop = 0
//for _ in shoppingList {
// ++numberOfshop
//}
//for _ in 1...3 {
//    
//}
//
//for var i = 0; i < 3; ++i{
//    print(i)
//}
//
//
//let innumbers = ["Prime":[2,3,5,7,11,13],"Fibonacci":[1,1,2,3,5,8],"Square":[1,4,9,16,25]]
//var largest = 0
//var thekind:String?
//for (kind,numbers) in innumbers {
//    for number in numbers {
//        if number > largest {
//            largest = number
//            
//        }
//    }
//    thekind = kind
//}
////largest
//print(thekind)
//
//
//var n = 3
//while n < 100   {
//    ++n
//}
//var reaptInt = 111
//repeat {
//++reaptInt
//} while reaptInt < 100
//
//
//let individualScores = [75, 43, 103, 87, 12]
//var teamScore = 0
//for score in individualScores {
//    if score > 50 {
//        teamScore += 3
//    } else {
//        teamScore += 1
//    }
//}
//teamScore
//
//
//var u = 20
//var v = 15
//var temp = 0
//while v != 0 {
//    temp = u % v
//    u = v;
//    v = temp
//  
//}
//print(u)


func greet(name:String,food:String)->String {
    return "hello\(name),today is \(food)"
    
}

greet("JayKong", food: "beef")

func noPara() {
    print("no para");
}
noPara()

func onePare(name:String) {
    print("this is my name\(name)")
}
onePare("JayKong")

func onePara(name:String)->String {
    return "this is my name\(name)"
}
onePara("JayKong")

//func onePareReturn(name:String)->(String,Int){
//    return ("JayKong's score",100)
//}
//
//var result =  onePare("JayKong")
//
//
//let (name,num) = result




