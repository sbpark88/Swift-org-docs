import Foundation

// MARK: Optioanl
enum Maybe<Wrapped> {
   case some(Wrapped)
   case none
}

//extension Maybe where Wrapped == Int {
//   func add(_ value: Int) -> Maybe<Int> {
//       switch self {
//       case .some(let wrappedValue): return .some(wrappedValue + value)
//       case .none: return .none
//       }
//   }
//}
//
//let foo: Maybe<Int> = .some(10)
//let bar = foo.add(7)
//print(foo)      // some(10)
//print(bar)      // some(17)
//
//let baz: Maybe<Int> = .none
//print(baz)      // none


// MARK: Functor applies a function to a wrapped value
extension Maybe {
    func map<U>(_ transform: (Wrapped) -> U) -> Maybe<U> {
        switch self {
        case .some(let wrappedValue): return .some(transform(wrappedValue))
        case .none: return .none
        }
    }
}

func intToString(_ value: Int) -> String {
    String(value)
}

let foo: Maybe<Int> = .some(10)
let baz: Maybe<Int> = .none

let fooPrime = foo.map(intToString(_:))
let bazPrime = baz.map(intToString(_:))
print(fooPrime)     // some("10")
print(bazPrime)     // none
