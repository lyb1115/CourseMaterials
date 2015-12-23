
enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
var planet = Planet.Venus
planet = .Jupiter

enum Direction{
    case South
    case North
    case West
    case East
}
var direction = Direction.East
direction = .South


//你可以使用 switch 语句匹配单个枚举值：
direction = .South
switch direction {
case .North:
    print("Lots of planets have a north")
case .South:
    
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}
// 输出 "Watch out for penguins”


//当不需要匹配每个枚举成员的时候，你可以提供一个 default 分支来涵盖所有未明确处理的枚举成员：
let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
print("Mostly harmless")
default:
print("Not a safe place for humans")
}
// 输出 "Mostly harmless”
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

//用任意一种条形码类型创建新的条形码，例如：
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)

//同一个商品可以被分配一个不同类型的条形码，例如：
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

//你可以在 switch 的 case 分支代码中提取每个关联值作为一个常量（用 let 前缀）或者作为一个变量（用 var 前缀）来使用：
switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    numberSystem + manufacturer
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
    print("QR code: \(productCode).")
}

//如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个 let 或者 var ：
switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
    print("QR code: \(productCode).")
}



enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
//枚举类型 ASCIIControlCharacter 的原始值类型被定义为Character ，并设置了一些比较常见的 ASCII 控制字符。

enum ASCIIControlCharacter2: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet2: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

//2下面的例子是 CompassPoint 枚举的细化，使用字符串类型的原始值来表示各个方向的名称：
enum CompassPoint: String {
    case North, South, East, West
}
//上面例子中， CompassPoint.South 拥有隐式原始值 South ，依次类推


//使用枚举成员的 rawValue 属性可以访问该枚举成员的原始值：
let earthsOrder2 = Planet2.Earth.rawValue
// earthsOrder 值为 3


let sunsetDirection = CompassPoint.West.rawValue
// sunsetDirection 值为 "West"






//例子利用原始值 7 创建了枚举成员 Uranus ：
let possiblePlanet = Planet2(rawValue: 7)
// possiblePlanet 类型为 Planet? 值为 Planet.Uranus


//如果你试图寻找一个位置为 9 的行星，通过原始值构造器返回的可选 Planet 值将是 nil ：
let positionToFind = 9
if let somePlanet = Planet2(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}


//递归枚举（recursive enumeration）是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，编译器会插入一个间接层。你可以在枚举成员前加上 indirect 来表示该成员可递归。例如，下面的例子中，枚举类型存储了简单的算术表达式：
//enum ArithmeticExpression {
//    case Number(Int)
//    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
//    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
//}
//你也可以在枚举类型开头加上 indirect 关键字来表明它的所有成员都是可递归的：
//indirect enum ArithmeticExpression {
//    case Number(Int)
//    case Addition(ArithmeticExpression, ArithmeticExpression)
//    case Multiplication(ArithmeticExpression, ArithmeticExpression)
//}

enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}
//例如，下面是一个对算术表达式求值的函数：
func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}


// 计算 (5 + 4) * 2
var five = ArithmeticExpression.Number(5)
var eight = ArithmeticExpression.Number(8)
var five_eight = ArithmeticExpression.Addition(eight, five)


let three = ArithmeticExpression.Number(3)


let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))
// 输出 "18"
