import Foundation

// MARK: Optioanl
enum Maybe<Wrapped> {
    case some(Wrapped)
    case none
}

// MARK: Functor applies a function to a wrapped value
extension Maybe {
    func map<U>(_ transform: (Wrapped) -> U) -> Maybe<U> {
        switch self {
        case .some(let wrappedValue): return .some(transform(wrappedValue))
        case .none: return .none
        }
    }
}

// MARK: Applicative applies a wrapped function to a wrapped value.
extension Maybe {
    func apply<U>(_ wrappedTransform: Maybe<(Wrapped) -> U>) -> Maybe<U> {
        switch wrappedTransform {
        case .some(let transform): return self.map(transform)
        case .none: return .none
        }
    }
}

// MARK: Monad applies a function that returns wrapped value to a wrapped value.
extension Maybe {
    func flatMap<U>(_ transform: (Wrapped) -> Maybe<U>) -> Maybe<U> {
        switch self {
        case .some(let wrappedValue): return transform(wrappedValue)
        case .none: return .none
        }
    }
}


let foo: Maybe<Int> = .some(10)
let baz: Maybe<Maybe<Int>> = .some(foo)

//print(type(of: foo))   // Maybe<Int>
//print(type(of: baz))   // Maybe<Maybe<Int>>

print("----------------------------------------------")

func intToString(_ value: Int) -> String {
    String(value)
}

func maybeInt_to_MaybeString(_ monad: Maybe<Int>) -> Maybe<String> {
    return monad.map(intToString(_:))
    
    func intToString(_ value: Int) -> String {
        String(value)
    }
}

let fooPrime = foo.map(intToString(_:))
print(type(of: fooPrime))  // Maybe<String>
print(fooPrime)            // some("10")

let bazPrime = baz.map(maybeInt_to_MaybeString(_:))
print(type(of: bazPrime))  // Maybe<Maybe<String>>
print(bazPrime)            // some(__lldb_expr_47.Maybe<Swift.String>.some("10"))

//let bazPrime = baz.flatMap(maybeInt_to_MaybeString(_:))
//print(type(of: bazPrime))  // Maybe<String>
//print(bazPrime)            // some("10")
