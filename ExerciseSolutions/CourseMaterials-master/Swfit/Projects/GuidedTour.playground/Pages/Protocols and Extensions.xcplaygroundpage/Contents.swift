//: ## Protocols and Extensions
//:
//: Use `protocol` to declare a protocol.
//:
protocol ExampleProtocol {
     var simpleDescription: String { get }
     mutating func adjust()
}

//: Classes, enumerations, and structs can all adopt protocols.
//:
class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105
     func adjust() {
          simpleDescription += "  Now 100% adjusted."
     }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"
     mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
/*
enum SimpleEnum:ExampleProtocol {
    case simpleDescription
    var simpleDescription: String
        { return  "A simple structure"}
   
   
    mutating func adjust() {
        simpleDescription + " (adjusted)"
    }
}
var c = SimpleEnum.simpleDescription

*/
//: > **Experiment**:
//: > Write an enumeration that conforms to this protocol.
//:
//: Notice the use of the `mutating` keyword in the declaration of `SimpleStructure` to mark a method that modifies the structure. The declaration of `SimpleClass` doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.
//:
//: Use `extension` to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.
//:
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
 }
print(7.simpleDescription)
/*
extension Double:ExampleProtocol {
    var absoluteValue:Double {
        return abs(self)
    }
    
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }

}*/
extension Double {
    var absoluteValue2:Double {
        if (self > 0) {
            return self
        } else {
            return -self
        }
    }
}
(-1.2).absoluteValue2
//: > **Experiment**:
//: > Write an extension for the `Double` type that adds an `absoluteValue` property.
//:
//: You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.
//:
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Uncomment to see the error

let protocolValue1:ExampleProtocol
protocolValue1 = b;


let simpleClass = SimpleClass()

//: Even though the variable `protocolValue` has a runtime type of `SimpleClass`, the compiler treats it as the given type of `ExampleProtocol`. This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.
//:


//: [Previous](@previous) | [Next](@next)
