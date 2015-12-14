func addTwoInts(a:String,b:String) -> String {
    return "\(a) + \(b)"
}
var mathFunction:(String,String)->String = addTwoInts
mathFunction("2","3")


print("Result:\(mathFunction("1","3"))")

mathFunction
func printAddResult(add:(Int,Int)->Int,a:Int,b:Int) {
    print("the add result is \(add(a, b))")
}

func sum(a: Int, b: Int) {
    let a = a + b
    let b = a - b
    print(a, b)
}
sum(20, b: 10)



