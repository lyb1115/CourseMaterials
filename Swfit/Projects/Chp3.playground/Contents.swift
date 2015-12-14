var welcome = "welcome"
var d:Character = "d"
welcome.append(d)


var chars : [Character] =
["w","e","l","l"]

var charsStr = String (chars)


let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
//greeting[greeting.endIndex]
greeting[greeting.endIndex.predecessor()]
// !
greeting[greeting.startIndex.successor()]
// u

let index = greeting.startIndex.advancedBy(1)
greeting[index]

greeting.characters.indices
for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}


//var welcome = "hello"
welcome.insert("!", atIndex: welcome.endIndex)
welcome.insert("?", atIndex: welcome.startIndex)


var a:String = "string"
var b:Int = 7
var c:Int = 7,dd:Int = 5,g:Int = 11

let aa = 8

//enum MyEnum {
//    case `self`
//    case North
//}
//MyEnum.`self`
//let myenum:MyEnum = .`self`


print("this is an :\(a)")

let minValue = UInt8.min
print(minValue)
UInt16.min




