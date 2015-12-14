//: ## Generics
//:
//: Write a name inside angle brackets to make a generic function or type.
//:
func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
repeatItem("knock", numberOfTimes:4)

//: You can make generic forms of functions and methods, as well as classes, enumerations, and structures.
//:
// Reimplement the Swift standard library's optional type
enum OptionalValue<wrapped> {
    case None 
    case Some(wrapped) 
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)
var someValue = OptionalValue.Some(50)
switch possibleInteger {
case .Some(let number):
    print("the number is \(number)")
case .None: break
    
}
someValue = .None


//: Use `where` after the type name to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.
//:
func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
//anyCommonElements([1, 2, 3], [3])
var same = [Int]()
func anyCommonElements (lhs: Array<Int>, _ rhs: Array<Int>) -> Bool {
    for  lhsItem in lhs {
        for  rhsItem in rhs {
            if lhsItem == rhsItem {
                (lhsItem)
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])
same
//: > **Experiment**:
//: > Modify the `anyCommonElements(_:_:)` function to make a function that returns an array of the elements that any two sequences have in common.
//:
//: Writing `<T: Equatable>` is the same as writing `<T where T: Equatable>`.
//:


//: [Previous](@previous)
