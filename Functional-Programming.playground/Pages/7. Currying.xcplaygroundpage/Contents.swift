import Foundation

// MARK: Without currying
//func howMuch(goods: String, price: Int, count: Int, unit: String) -> String {
//    "\(goods) \(count) \(unit) = \(price * count)원"
//}
//
//print(howMuch(goods: "사과", price: 1350, count: 5, unit: "개"))   // 사과 5 개 = 6750원
//print(howMuch(goods: "참치", price: 2730, count: 3, unit: "캔"))   // 참치 3 캔 = 8190원


// MARK: With currying
//func howMuch(goods: String, unit: String) -> (Int) -> (Int) -> String {
//    { price in { count in "\(goods) \(count) \(unit) = \(price * count)원" }}
//}
//
//let applePrice = howMuch(goods: "사과", unit: "개")
//let tunaPrice = howMuch(goods: "참치", unit: "캔")
//
//let todayApplePrice = applePrice(1350)
//let todayTunaPrice = tunaPrice(2730)
//
//print(todayApplePrice(5)) // 사과 5 개 = 6750원
//print(todayTunaPrice(3)) // 참치 3 캔 = 8190원


// MARK: With currying & Inline closures
let howMuch = { (goods: String, unit: String) in { (price: Int) in { (count: Int) in
    "\(goods) \(count) \(unit) = \(price * count)원"
}}}

let applePrice = howMuch("사과", "개")
let tunaPrice = howMuch("참치", "캔")

let todayApplePrice = applePrice(1350)
let todayTunaPrice = tunaPrice(2730)

print(todayApplePrice(5)) // 사과 5 개 = 6750원
print(todayTunaPrice(3)) // 참치 3 캔 = 8190원
