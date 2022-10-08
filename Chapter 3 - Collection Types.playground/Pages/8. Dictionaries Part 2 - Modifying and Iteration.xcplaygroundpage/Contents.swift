import Foundation

// 8. Dictionaries (사전) Part 2 - Modifying and Iteration
// Accessing and Modifying a Dictionay

// 1. Retrieve a value or add or modify using 'Subscript Syntax'.
// 1 ) `Subscript Syntax`를 이용해 `Dictionary`의 값에 접근하거나, 추가, 수정할 수 있다

// - 값에 접근하기
//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//print(shoppingList["Eggs"])
//print(shoppingList["Eggs"] ?? 0)

// - 값 수정하기
//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//shoppingList["Milk"] = 4000
//print(shoppingList["Milk"])

// - 값 추가하기
//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//shoppingList["Flour"] = 3600
//print(shoppingList)

// - 값 제거하기
//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//shoppingList["Milk"] = nil
//print(shoppingList)     // ["Eggs": 4500]


// 2. 'updateValue(_:forKey:)' method also add or modify a dictionary, however, it returns old value.

// - 값 수정하기
//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//shoppingList.updateValue(4000, forKey: "Milk")
//print(shoppingList["Milk"] as Any)


//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//
//if let oldValue = shoppingList.updateValue(4000, forKey: "Milk") {
//    print("The old value for Milk was \(oldValue).")
//    print("The current value for Milk is \(shoppingList["Milk"]!).")
//}

//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//
//if let oldValue = shoppingList["Milk"] = 4000 {   // error: initializer for conditional binding must have Optional type, not '()'
//    print("The old value for Milk was \(oldValue).")
//    print("The current value for Milk is \(shoppingList["Milk"]!).")
//}



// - 값 추가하기
//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//shoppingList.updateValue(3600, forKey: "Flour")
//print(shoppingList)

//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//
//if let oldValue = shoppingList.updateValue(3600, forKey: "Flour") {
//    print("The old value for Flour was \(oldValue).")
//    print("The current value for Flour is \(shoppingList["Flour"]!).")
//} else {
//    // cannot use oldValue because of else-clause
//    print("The flour was not exist.")
//    print("The current value for Flour is \(shoppingList["Flour"]!).")
//}

//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//let oldValue = shoppingList.updateValue(3600, forKey: "Flour")
//print(oldValue as Any)  // nil
//print(shoppingList)


// - 값 제거하기
//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//shoppingList.removeValue(forKey: "Milk")
//print(shoppingList)

//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//
//if let oldValue = shoppingList.removeValue(forKey: "Milk") {
//    print("The removed shopping list milk price was \(oldValue).")
//    print("The milk is not exist any more.")
//}


// - 딕셔너리 비우기
//var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
//shoppingList.removeAll()
//print(shoppingList)     // [:]

var shoppingList: [String: Int] = ["Eggs": 4500, "Milk": 3200]
shoppingList = [:]
print(shoppingList)     // [:]



// Iterating Over a Dictionary (딕셔너리의 순회)
let fruits = [
    "Apple": 4200,
    "Pear": 6800,
    "Persimmon": 3400,
    "Tangerine": 2800,
    "Orange": 4300,
    "Mango": 5100,
    "Plum": 7100,
    "Cherry": 8500
]

// array 이거 entire values of array로 고치자 음... 이것도 이상한데 아무튼 set이랑 딕셔너리랑 통일시키기
// 1. You can iterate over the entire values of set in an arra with the for-in loop.
// 1. You can iterate over the entire dictionary
// 1. `for-in` 반복문을 이용해 딕셔너리의 전체 `elements`에 접근할 수 있다
//for (goods, price) in fruits {
//    print("\(goods)'s price is \(price)won.")
//}


//for goods in fruits.keys {
//    print(goods, terminator: "  ")
//}
//

//print("\n")
//for price in fruits.values {
//    print(price, terminator: "  ")
//}

//let goodsArray = fruits.keys
//print(goodsArray)



print("\n----")
// default, ascending order
for goods in fruits.keys.sorted() {
    print(goods, terminator: "  ")
}
print("\n----")
// ascending order
for goods in fruits.keys.sorted(by: <) {
    print(goods, terminator: "  ")
}
print("\n----")
// descending order
for goods in fruits.keys.sorted(by: >) {
    print(goods, terminator: "  ")
}

print("\n----")


// ascending order by keys
for (goods, price) in fruits.sorted(by: {$0.0 < $1.0}) {
    print("\(goods)'s price is \(price)won.")
}

print("\n----")

// descending order by values
for (goods, price) in fruits.sorted(by: {$0.1 > $1.1}) {
    print("\(goods)'s price is \(price)won.")
}


