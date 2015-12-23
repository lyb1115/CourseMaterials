
class Car {
    let color = "red"
    var miles = "300km"
    func fillGas() {
        print("feeding me up")
    }
}
let aCar = Car()

struct XYPoint {
    var x:Double = 0
    var y:Double = 0
}

let xyPoint = XYPoint()

struct Resolution {
    var width = 0
    var height = 0
}
let someResolution = Resolution()

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someVideoMode = VideoMode()

print("The width of someResolution is \(someResolution.width)")
// 输出 "The width of someResolution is 0"
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// 输出 "The width of someVideoMode is 0"

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// 输出 "The width of someVideoMode is now 1280"


let vga = Resolution(width:640, height: 480)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd


cinema.width = 2048
//这里，将会显示 cinema 的 width 属性确已改为了 2048 ：
print("cinema is now \(cinema.width) pixels wide")

print("hd is still \(hd.width) pixels wide")
// 输出 "hd is still 1920 pixels wide"


//枚举也遵循相同的行为准则：
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}
// 输出 "The remembered direction is still .West"

//请看下面这个示例，其使用了之前定义的 VideoMode 类：
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

//tenEighty 被赋予名为 alsoTenEighty 的新常量，同时对 alsoTenEighty 的帧率进行修改：
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// 输出 "The frameRate property of theEighty is now 30.0"

//运用这两个运算符检测两个常量或者变量是否引用同一个实例：
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same Resolution instance.")
}
//输出 "tenEighty and alsoTenEighty refer to the same Resolution instance."

class Fraction {
    var numerator:Int = 0
    var denominator:Int = 0
    
    func printFraction() {
        print("fraction is \(numerator)/\(denominator)")
    }
    
    func add(a:Fraction) -> Fraction {
        let f = Fraction()
       f.numerator = self.numerator * a.denominator + a.numerator * self.denominator
        f.denominator = self.denominator * a.denominator
        return f
    
    }
    
}

var frac1 = Fraction()
frac1.numerator = 1
frac1.denominator = 3

var frac2 = Fraction()
frac2.numerator = 1
frac2.denominator = 2
var f3 = frac1.add(frac2)
f3.printFraction()

class Calculator {
    var accumulator:Double = 0
    func add(a:Double)->Double {
        accumulator += a
        return accumulator
    }
}
