
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
