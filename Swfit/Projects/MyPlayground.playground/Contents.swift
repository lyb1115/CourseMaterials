//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let minValue = UInt8.min
print(minValue)
UInt8.max
UInt16.max

let a = 10
let fb = 1.1
let ab = Double(a) + fb

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


//let b :Int8 = Int8.max + 1

let aDouble:Double  = 11.1
let aInt:Int = 11;
Int(aDouble)
Double(aInt)


typealias AudioSample = Int16

var audioS : AudioSample = 16
AudioSample.max
Int16.max

var boolme :Bool = true
var boolfaluse:Bool = false


if boolme {
    print("false")
} else {
    print("true")
}

 var aTuple = (1,2)
//(int,int)
var anotherTuple = ("astr",2)

var varTuple = (first:3,second:2)

let (firsta,_) = (1,2)


aTuple.0
aTuple.1



var aoptionInt: Int?
//var aStringOpt: String = nil

var anumberStr = "123"
var anotherNumStr = "345"
if var number = Int(anumberStr), let number2 =  Int(anotherNumStr) where number > number2 {
    print(number2)
    ++number
    print(number)
}else {
  print("not number")
}

if Int(anumberStr) != nil {
    Int(anumberStr)!
}

var newOpt:String! = "3455"
print(newOpt)


var anImplictlyUnwrappedOption:String! = nil
//print(anImplictlyUnwrappedOption)

var anniceopt:String? = nil
//anniceopt!


func canThrowError() throws {
    
}
do   {
  try canThrowError()
    print("contine")
}
catch {
    print("an error")
}

let(aelement,belemtn) = (1,2)
aelement
belemtn

var aStrme = "me"
var aStreyou = "you"
aStreyou + "  \(aStrme)"
"me" + "you"
aStrme += aStreyou
var aaaaaaa = 10
//var bbbbbbb = ++aaaaaaa
var ccccccc = aaaaaaa++
for character in "Dog!🐶".characters {
    print(character)
}

let charMe:Character = "!"
var toAdd = "dog"
toAdd.append(charMe)
toAdd.appendContentsOf("me")

//The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quote) and \' (single quote)

var escapedStr = "abc"

let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}"


let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한


let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝


let greeting = "Jay Kong"
greeting.startIndex
greeting[greeting.startIndex]
greeting.endIndex.predecessor()
greeting[greeting.endIndex.predecessor()]

greeting[greeting.startIndex.successor()]
 greeting[greeting.startIndex.advancedBy(2)]

let index = greeting.startIndex.advancedBy(1)
greeting[index]

var gettingmetoyou = "alllis me"
gettingmetoyou.insert("!", atIndex: gettingmetoyou.startIndex)
var startchar:[Character] = ["a","b","c"]

gettingmetoyou.insertContentsOf(startchar, at: gettingmetoyou.startIndex)

gettingmetoyou.removeAtIndex(gettingmetoyou.startIndex)
gettingmetoyou


let range = gettingmetoyou.endIndex.advancedBy(-6) ..< gettingmetoyou.endIndex
gettingmetoyou.removeRange(range)
gettingmetoyou

gettingmetoyou.hasPrefix("bc!")

gettingmetoyou.characters.indices

for index in gettingmetoyou.characters.indices {
    print("\(gettingmetoyou[index]) ", terminator: "")
}


