import Foundation


// 1. Default behavior of `map(_:)`
let numbers: [Int] = [2, 5, 3, 9, 11, 14]

var doubled: [Int] = [Int]()
doubled = numbers.map { $0 * 2 }
print(doubled)          // [4, 10, 6, 18, 22, 28]


print("-----------------------------------------")
// 2. The new Collection is able to have another data type.
let degrees = [20, 45, 180, 360, 185]

let rads = degrees.map { Double($0) * Double.pi / 180.0 }
let tenThousand: Double = pow(10, 4)

rads.forEach { print("\(round($0 * tenThousand) / tenThousand) radian") }


print("-----------------------------------------")
// 3. `map(_:)` in Set
let people: Set<String> = ["Thomasin McKenzie", "Anya Taylor-Joy", "Matt Smith", "Diana Rigg", "Rita Tushingham"]
let firstName = people.map { $0.split(separator: " ")[0] }
let lastName = people.map { $0.split(separator: " ")[1] }

print(firstName)    // ["Anya", "Rita", "Thomasin", "Matt", "Diana"]
print(lastName)     // ["Taylor-Joy", "Tushingham", "McKenzie", "Smith", "Rigg"]


print("-----------------------------------------")
// 4. `map(_:)` in Dictionary
let info: [String: String] = ["name": "andrew",
                              "city": "berlin",
                              "job": "developer",
                              "hobby": "computer games"]

let keys = info.map { $0.key }
let values = info.map { $0.value }

print(keys)     // ["city", "name", "hobby", "job"]
print(values)   // ["berlin", "andrew", "computer games", "developer"]

print("\ntupleData")
let tupleData = info.map { $0 }
print(type(of: tupleData))          // Array<(key: String, value: String)>
print(type(of: tupleData[0]))       // (key: String, value: String)
print(type(of: tupleData[0].key))   // String
print(type(of: tupleData[0].value)) // String

tupleData.forEach {
    print($0)
}

print("\nupdatedKeysAndValues")
let updatedKeysAndValues = info.map { ($0.uppercased(), $1.capitalized) }
print(type(of: updatedKeysAndValues))       // Array<(String, String)>
print(type(of: updatedKeysAndValues[0]))    // (String, String)

updatedKeysAndValues.forEach {
    print($0)
}

print("")
let anotherKeysAndValues = info.map { (list: $0.uppercased(), userInfo: $1.capitalized) }
print(type(of: anotherKeysAndValues))       // Array<(list: String, userInfo: String)>
print(type(of: anotherKeysAndValues[0]))    // (list: String, userInfo: String)

anotherKeysAndValues.forEach {
    print($0)
}

print("")
//let capitalizedInfo = Dictionary(uniqueKeysWithValues: anotherKeysAndValues)
//let capitalizedInfo = info.lazy
//    .map { ($0.uppercased(), $1.capitalized) }
//    .reduce(into: [String: String]()) { $0[$1.0] = $1.1 }

let capitalizedInfo = info.lazy
    .map { ($0.uppercased(), $1.capitalized) }
    .reduce(into: [String: String]()) {
        let str = """
                $0: \($0)
                $1.0: \($1.0),  $1.1: \($1.1)

                """
        print(str)
        return $0[$1.0] = $1.1
    }


print(type(of: capitalizedInfo))    // Dictionary<String, String>
print(capitalizedInfo)



print("-----------------------------------------")
// 5. `mapValues(_:)` in Dictionary
let updatedValues = info.mapValues { $0.capitalized }
print(updatedValues)
