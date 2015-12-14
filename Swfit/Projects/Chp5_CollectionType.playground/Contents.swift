
import UIKit
//: ## 集合类型 (Collection Types)
//:Swift 语言提供 Arrays 、 Sets 和Dictionaries 三种基本的集合类型用来存储集合数据。数组（Arrays）是有序
//:数据的集。集合（Sets）是无序无重复数据的集。字典（Dictionaries）是无序的键值对的集。
[#Image(imageLiteral: "CollectionTypes_intro_2x.png")#]


//:  * 集合的可变性（Mutability of Collections）
//:  * 数组（Arrays）
//:  * 集合（Sets）
//:  * 字典（Dictionaries）

//:  ### 集合的可变性（Mutability of Collections）
//:如果创建一个 Arrays 、 Sets 或 Dictionaries 并且把它分配成一个变量，这个集合将会是可变的
//:分配成常量，那么它就是不可变的，它的大小不能被改变
//:在我们不需要改变集合大小的时候创建不可变集合是很好的习惯。如此 Swift 编译器可以优化我们创建的集合。

//:  ### 数组（Arrays）
//:数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中
//:数组的简单语法
//: * Array<Element> 等价于 [Element]，Element是唯一存在的数据类型
//:创建一个空数组
var someInts = [Int]()
someInts = Array<Int>()

someInts.append(3)
someInts = []
//: 创建一个带有默认值的数组
var threeStrings = [String](count: 4, repeatedValue: "dog")

//: 通过两个数组相加创建一个数组
//:  * 需要是相同类型数组
var firstArr = [Int](count: 3, repeatedValue: 1)
var secondArr = [Int](count: 4, repeatedValue: 3)
var addArr = firstArr + secondArr

//: 用字面量构造数组
var someDoubles = [1,2,3]
var shoppingList:[String] = ["eggs","apple"]

var shoppingList2:Array<String> = ["eggs","apple"]
//: 访问和修改数组
//: * 只读属性count
print("the number of shopinglist is \(shoppingList.count)")
//: * isEmpty属性
if shoppingList.isEmpty {
    print("the count is 0")
} else {
    print("the number of shopinglist is \(shoppingList.count)")
}
//: * append(_:)方法
shoppingList.append("banna")
//: 加法赋值运算符（ += ）
shoppingList += ["Flour"]
//: * 下标语法:数据项的索引值直接放在数组名称的方括号
//:      下标获取值
shoppingList[0]
shoppingList
//:      下标改变某个已有索引值对应的数据值
shoppingList[1] = "orange"

shoppingList
//:      下标改变一系列数据值
shoppingList[1...2] = ["pear","cake"]
shoppingList
//:      不可以用下标访问的形式去在数组尾部添加新项
//shoppingList[4] = "cabbage"

shoppingList

//: insert(_:atIndex:) 方法来在某个具体索引值之前添加数据项：
shoppingList.insert("Fiona Fu", atIndex: 0)

//: removeAtIndex(_:) 方法来移除数组中的某一项
//: *返回这个被移除的数据项*
shoppingList.removeAtIndex(0)

//: removeLast() 方法把数组中的最后一项移除
//: *返回这个被移除的数据项*
shoppingList.removeLast()

//:数组的遍历
//:for-in 循环来遍历

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("index \(index + 1)'s value is \(value)")
}




//:  ### 集合（Sets)
/*:
集合(Set)用来存储相同类型并且没有确定顺序的值
*当集合元素顺序不重要时或者希望确保每个元素只出现一次
时可以使用集合而不是数组*

集合类型的哈希值
*作为集合的值的类型或者是字典的键的类型必须是可哈希化
*一个哈希值是 Int 类型的，相等的对象哈希值必须相同，比如 a==b ,因此必须 a.hashValue == b.hashValue

*一个类型为了存储在集合中，该类型必须是可哈希化的,Swift 的所有基本类型(比如 String , Int , Double 和 Bool )默认都是可哈希化的
*自定义类型要符合Swift标准库中的*Hashable协议*
    *要提供一个类型为 Int 的可读属性 hashValue 
    * Hashable 协议符合 Equatable 协议
    *提供一个"是否相等"运算符( == )的实现
== 的实现必须满足下面三种情况
* a == a (自反性)
* a == b 意味着 b == a (对称性)
* a == b && b == c 意味着 a == c (传递性)

集合类型语法
Swift 中的 Set 类型被写为 Set<Element>,没有等价的简化形式
创建和构造一个空的集合
*/

//: * 通过构造器语法
var emptySet = Set<Int>()
var letters = Set<String>()
var chars = Set<Character>()
//: * 通过一个空的数组字面量
//: Set 类型必须显式声明
var anotherEmptySet:Set<Int> = []
//:简化的方式
var inferedSet:Set = [3,4,5]
//:用数组字面量创建集合
var emptyInt = [Int]()
emptyInt = [3,4,5]
emptySet = [3,4,5]
//: *emptySet = emptyInt* 不正确

//:访问和修改一个集合
//:找出一个 Set 中元素的数量
emptySet.count
//:检查 count 属性是否为 0
emptySet.isEmpty
//:添加一个新元素 insert(_:) 方法
emptySet.insert(6)
//: remove(_:) 方法去删除一个元素
emptySet.remove(6)
//:该 Set 不包含该值，则返回 nil
emptySet.remove(1)
//:removeAll()方法删除所有元素
emptySet.removeAll()
//:contains(_:) 检查是否包含一个特定的值
emptySet.contains(1)

//:遍历一个集合
//:求Set中所有整数的和
emptySet = [1,2,3,4]
var total = 0
for number in emptySet {
    total += number
}
total

//:使用 sort() 方法按顺序来遍历Set 中的值
 emptySet.sort()
//:集合操作
//:高效地完成Set的基本操作：合并、共有元素、全包含、部分包含或者不相交
//:基本集合操作
var operateA:Set = [1,3,4,9]
var operateB:Set = [1,3,5,10]
var intersectSet = operateA.intersect(operateB)
operateA
operateB
operateA.exclusiveOr(operateB)
operateA.union(operateB)
operateA.subtract(operateB)

[#Image(imageLiteral: "setVennDiagram_2x.png")#]

//: intersect(_:) 两个集合中都包含的值
//: exclusiveOr(_:) 在一个集合中但不在两个集合中的值
//: union(_:) 两个集合的值
//: subtract(_:) 不在该集合（b)中的值


let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sort()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersect(evenDigits).sort()
// []
oddDigits.subtract(singleDigitPrimeNumbers).sort()
// [1, 9]
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()
// [1, 2, 9]



//:集合成员关系和相等
/*:
*运算符( == ):是否包含全部相同的值。
• isSubsetOf(_:) :是否也被包含在另外一个集合中
• isSupersetOf(_:):一个集合中包含另一个集合中所有的值。
• isStrictSubsetOf(_:) 或者isStrictSupersetOf(_:) 一个集合是否是另外一个集合的子集合
或者父集合并且两个集合并不相等。
• isDisjointWith(_:) 是否不含有相同的值。

*/
[#Image(imageLiteral: "setEulerDiagram_2x.png")#]
let houseAnimals: Set = ["?", "?"]
let farmAnimals: Set = ["?", "?", "?", "?", "?"]
let cityAnimals: Set = ["?", "?"]
houseAnimals.isSubsetOf(farmAnimals)
houseAnimals.isSubsetOf(cityAnimals)
houseAnimals.isStrictSupersetOf(cityAnimals)
houseAnimals.isDisjointWith(cityAnimals)
let operateC:Set = [1,2]
let operateD:Set = [3,4]
operateC.isDisjointWith(operateD)


//:  ### 字典（Dictionaries）
/*:
*字典是一种存储多个相同类型的值的容器
*每个值（value）都关联唯一的键（key）
*字典中的数据项并没有具体顺序
*通过标识符（键）访问数据(值）
*/
//:字典类型快捷语法 
//:Dictionary<Key,Value>
//:[Key: Value]
//:*Key 是字典中键的数据类型
//:*Value 是字典中对应于这些键所存储值的数据类型

//:创建一个空字典
//:*构造语法创建
var namesOfIntergers = [Int:String]()
//:*空字典字面量
namesOfIntergers[16]="SixTeen"
namesOfIntergers = [:]
var otherNamesOfIntergers:[Int:String] = [:]
//:用字典字面量创建字典
//: *[key 1: value 1, key 2: value 2, key 3: value 3]*
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//:简写方式：当键和值都有各自一致的类型
var airs = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var papers:[Int: String] = [0000:"试卷一",0001:"试卷2"]
var paps = [0000:"试卷一",0001:"试卷2"]

//:访问和修改字典

//:count 来获取某个字典的数据项数量
airports.count
//: isEmpty 来快捷地检查字典的 count 属性是否等于0
airports.isEmpty

//:添加新的数据项:
//: * 使用下标语法
//: * 使用updateValue(_:forKey:)
//: * updateValue(_:forKey:) 这个方法返回更新值之前的原值(可选值)

airports["BJ"] = "Bj airsport"

//airports["BJ"] = "BeiJing Airsport"
let oldValue = airports.updateValue("Beijing airsport", forKey: "BJ")
oldValue
airports

//:返回nil的情况
//: * 更新的值不存在
//: * 请求的键没有对应的值存在

airports.updateValue("JiangXi airport", forKey:"JX" )
airports["NC"]
airports

//:字典中移除键值对
//: *  removeValueForKey(_:)：返回被移除的值或者在没有值的情况下返回 nil 
//: * 移除一个键值对:下标语法来通过给某个键的对应值赋值为 nil
airports["JX"]
airports.removeValueForKey("BJ")

if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dublin Airport."
//:字典遍历
//:*for-in遍历:每一个字典中的数据项都以 (key, value) 元组形式返回
//:* 过访问 keys 或者 values 属性

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// YYZ: Toronto Pearson
// LHR: London Heathrow

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: YYZ
// Airport code: LHR
for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: Toronto Pearson
// Airport name: London Heathrow

//:使用 keys 或者 values 属性构造一个新数组

let airportCodes = [String](airports.keys)
// airportCodes 是 ["YYZ", "LHR"]
let airportNames = [String](airports.values)
// airportNames 是 ["Toronto Pearson", "London Heathrow"]

//: 顺序遍历字典的键或值:sort() 方法





