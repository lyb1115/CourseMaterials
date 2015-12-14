import UIKit
//: # 控制流（Control Flow）
//: 类似 C 语言的流程控制结构
//: * 多次执行任务的 for 和 while 循环
//: * 特定条件选择执行不同代码分支的 if 、 guard 和 switch 语句
//: * 跳转到其他代码的 break 和 continue 语句
//: * for-in 循环:遍历数组（array），字典（dictionary），区间（range），字符串（string）和其他序列类型
//: * switch 语句比 C 语言中更加强大
//:     * Swift 无需写 break
//:     * case 还可以匹配更多的类型模式
//:         * 区间匹配（range matching）
//:         * 元组（tuple）
//:         * 特定类型
//: *      匹配的值可以是由 case 体内部临时的常量或者变量决定
//: *      where 分句描述更复杂的匹配条件

//: ## 主要内容
//: * For 循环
//: * While 循环
//: * 条件语句
//: * 控制转移语句（Control Transfer Statements）
//: * 提前退出
//: * 检测API可用性


//: ### For 循环
//: Swift 提供两种 for 循环形式
//: * for-in 循环对一个集合里面的每个元素执行一系列语句
//: * for 循环:每次循环完成后增加计数器的值来实现
//: #### For-In
//: 遍历一个集合里面的所有元素
//: * 数字表示的区间
//: * 数组中的元素
//: * 字符串中的字符

for index in 1...10 {
    print("the index is \(index)")
}

for index in [1,3,5,6]
{
    print("the index is \(index)")
}

for char in "Welcome".characters {
    print("the char is \(char)")
}

//: 使用下划线（ _ ）替代变量名来忽略对值的访问
//: * 以下程序计算3的5次方
var anser = 1
let base = 3
var power = 5
for _ in 1...power {
   anser *= base
}
print(anser)

//: * 遍历一个字典来访问它的键值对
//:字典元素的遍历顺序和插入顺序可能不同，字典的内容在内部是无序的
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animal,leg) in numberOfLegs {
    print("the \(animal) has \(leg) legs")
}

//: #### 标准 C 样式 for 循环
//: 一般情况下这种循环方式的格式
/*:
*for initialization; condition; increment {
statements
不同的是，Swift 不需要使用圆括号将“initialization;
condition; increment”包括起来
*
}
*/
for var index = 0; index < 5; ++index {
    print("index is \(index)")
}
/*:
循环执行流程如下：
1. 循环首次启动时，初始化表达式（ initialization expression ）被调用一次
2. 条件表达式（condition expression）被调用，调用结果为 false ，循环结束。调用结果为 true ，则会执行大括号内部的代码
3. 执行所有语句之后，执行递增表达式（increment expression）,
当递增表达式运行完成后，重复执行第 2 步
*/
//:初始化表达式中声明的常量和变量（比如 var index = 0 ）只在 for 循环的生命周期里有效
//: *注意第二个print输出index*
var index:Int
for index = 0; index < 5; ++index {
    print("the index is\(index)")
}
print("the excute time is \(index)")


//: ### While 循环
/*:
两种 while 循环形式：
* while 循环，每次在循环开始时计算条件是否符合
* repeat-while 循环，每次在循环结束时计算条件是否符合
*/

//:While
/*:
*while condition {*
    *statements*
*}*
 */


//: # Snakes and Ladders Example
/*:
游戏的规则如下：
  *游戏盘面包括 25 个方格，游戏目标是达到或者超过第 25 个方格；
  *每一轮，你通过掷一个6边的骰子来确定你移动方块的步数，移动的路线由上图中横向的虚线所示；
  *如果在某轮结束，你移动到了梯子的底部，可以顺着梯子爬上去；
  *如果在某轮结束，你移动到了蛇的头部，你会顺着蛇的身体滑下去。
*/

let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 27
var diceRoll = 0
while square < finalSquare {
    
    //++diceRoll == 7 ? 1: diceRoll
    if ++diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
    while square < board.count {
        square += board[square]
    }
    
}
//:Repeat-While
/*:repeat-while 循环的格式：
repeat {
    statements
} while condition */
//:用Repeat-While完成上面的例子
//: *为什么上梯、蛇滑下先执行*


//repeat {
//if ++diceRoll == 7 {
//diceRoll = 1
//}
//square += board[square]
//square += diceRoll
//
//} while square < finalSquare

//M_PI

//: ### 条件语句
//: if 语句和 switch 语句。通常，当条件较为简单且可能的情况很少时，使用 if 语句。而 switch 语句更适用于条件较复杂、可能情况较多且需要用到模式匹配（pattern-matching）的情境

//:If 
//: if 语句最简单的形式就是只包含一个条件，当且仅当该条件为 true 时，才执行相关代码

//: * 判断温度是否小于等于 32 华氏度（水的冰点）。如果是，则打印一条消息；否则，不打印任何消息，继续执行 if 块后面的代码。*

//:if 语句允许二选一，也就是当条件为 false 时，执行 else 语句
var
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// 输出 "It's not that cold. Wear a t-shirt."
//:把多个 if 语句链接在一起
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

//:*最后的 else 语句是可选的*
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
}
// 输出 "It's really warm. Don't forget to wear sunscreen."


//:#Switch
//:switch 语句会尝试把某个值与若干个模式（pattern）进行匹配

//: * 最简单的形式就是把某个值与一个或若干个相同类型的值作比较

//switch some value to consider {
//    case value 1:
//    respond to value 1
//    case value 2, value 3:
//    respond to value 2 or 3
//    default:
//    otherwise, do something else
//} 


//: switch 语句必须是完备的
//:不可能涵盖所有值的情况下，你可以使用默认（ default ）分支满足该要求，这个默认分支必须在 switch 语句的最后面
//: *例子使用 switch 语句来匹配一个名为 someCharacter 的小写字符：*
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
"n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}// 输出 "e is a vowel"

//:不存在隐式的贯穿（No Implicit Fallthrough）
//:在Swift中 break 不是必须的:与 C 语言和 Objective-C 中的 switch 语句不同，在 Swift 中，当匹配的 case 分支中的代码执行完毕后，程序会终止 switch 语句，而不会继续执行下一个 case 分支。

//: *每一个 case 分支都必须包含至少一条语句*
//: * 下面这样书写代码是无效 *

//let anotherCharacter: Character = "a"
//switch anotherCharacter {
//case "a":
//case "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//}
// this will report a compile-time error


//: 一个 case 也可以包含多个模式，用逗号把它们分开（如果太长了也可以分行写）：

//switch some value to consider {
//    case value 1, value 2:
//    statements
//}


//: # 区间匹配
//: *例子展示了如何使用区间匹配来输出任意数字对应的自然语言格式：*
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// 输出 "There are dozens of moons orbiting Saturn."

//: # 元组（Tuple）
//: *例子展示了如何使用一个 (Int, Int) 类型的元组来分类下图中的点(x, y)：*
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
// 输出 "(1, 1) is inside the box"



//:#值绑定（Value Bindings）
//: *case 分支的模式允许将匹配的值绑定到一个临时的常量或变量，这些常量或变量在该 case 分支里就可以被引用了*
//: # 如何在一个 (Int, Int) 类型的元组中使用值绑定来分类下图中的点(x, y)
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// 输出 "on the x-axis with an x value of 2"
//: 1.*  case 都声明了常量 x 和 y 的占位符，用于临时获取元组 anotherPoint 的一个或两个值。*
//: 2.* 这个 switch 语句不包含默认分支。这是因为最后一个 case —— case let(x, y) 声明了一个可以匹配余下所有值的元组。这使得 switch 语句已经完备了，因此不需要再书写默认分支 *

[#Image(imageLiteral: "coordinateGraphMedium_2x.png")#]

//: # Where
//:case 分支的模式可以使用 where 语句来判断额外的条件

//: *把下图中的点(x, y)进行了分类*

[#Image(imageLiteral: "coordinateGraphComplex_2x (1).png")#]



let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// 输出 "(1, -1) is on the line x == -y"

//注意点:
//1.声明了常量 x 和 y 的占位符
//2.最后一个 case 分支匹配了余下所有可能的值














//: ### 控制转移语句（Control Transfer Statements
//: ### 提前退出
//: ### 检测API可用性



let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    print("contine")
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

// 输出 "grtmndsthnklk"


let numberSymbol: Character = "三" // 简体中文里的数字 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "?", "一", "?":
    possibleIntegerValue = 1
case "2", "?", "二", "?":
    possibleIntegerValue = 2
case "3", "?", "三", "?":
    possibleIntegerValue = 3
case "4", "?", "四", "?":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// 输出 "The integer value of 三 is 3."


let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    //fallthrough
default:
    description += " an integer."
}
print(description)
// 输出 "The number 5 is a prime number, and also an integer."
//
//let finalSquare = 25
//var board = [Int](count: finalSquare + 1, repeatedValue: 0)
//board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//var square = 0
//var diceRoll = 0

gameLoop: while square != finalSquare {
    if ++diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // 到达最后一个方块，游戏结束
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // 超出最后一个方块，再掷一次骰子
        continue gameLoop
    default:
        // 本次移动有效
        square += diceRoll
        square += board[square]
    }
}



print("Game over!")




func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}
greet(["name": "John"])
// prints "Hello John!"
// prints "I hope the weather is nice near you."
greet(["name": "Jane", "location": "Cupertino"])
// prints "Hello Jane!"
// prints "I hope the weather is nice in Cupertino."

if #available(iOS 9, OSX 10.10, *) {
    // 在 iOS 使用 iOS 9 的 API, 在 OS X 使用 OS X v10.10 的 API
} else {
    // 使用先前版本的 iOS 和 OS X 的 API
}
