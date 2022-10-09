import Foundation

// 6. Sets (집합) Part 3 - Operations and Equality
// Performing Set Operations (셋 연산 수행)
/*
The following mathematical operations can be performed between two 'Set Collections'.
*/

// 1. Fundamental Set Operations (기본 셋 연산)
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// 1. intersection (교집합)
// 교집합은 `intersection(_:)` 메서드를 사용한다.
let intersection = oddDigits.intersection(evenDigits).sorted()
print(intersection)         // []

// 2. symmetric difference (대칭차집합)
// 대칭차집합은 `symmetricDifference(_:)` 메서드를 사용한다.
let symmetricDifference = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
print(symmetricDifference)  // [1, 2, 9]

// 3. union (합집합)
// 합집합은 `union(_:)` 메서드를 사용한다.
let union = oddDigits.union(evenDigits).sorted()
print(union)                // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

// 4. difference of sets (차집합)
// 차집합은 `subtracting(_:)` 메서드를 사용한다.
let differenceOfSets = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
print(differenceOfSets)     // [1, 9]


// 2. Set Membership and Equality (셋의 맴버십과 동등 비교)
/*
두 Set 간의 관계를 표현할 수 있다.
Set a is a superset of Set b (Set a는 Set b의 상위집합이다)
Set b is a subset of Set a (Set b는 Set a의 부분집합이다)
Set b and Set c are disjoint with one another (Set b와 Set c는 서로소 집합관계다)

*/

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

// 1. Equality (상동)
// 상동은 `==` (equal operator)를 사용한다.
print(houseAnimals == houseAnimals)   // true

// 2. Superset (상위집합)
// Superset은 `isSuperset(of:)` 메서드를 사용한다.
print(farmAnimals.isSuperset(of: houseAnimals))   // true
print(farmAnimals.isSuperset(of: cityAnimals))    // false

// Superset을 판단하는 또 다른 메서드 `isStrictSuperset(of:)`가 있다.
print(farmAnimals.isStrictSuperset(of: houseAnimals))   // true
print(farmAnimals.isStrictSuperset(of: cityAnimals))    // false

/*
위 두 결과를 보면 `isSuperset(of:)` 메서드와 `isStrictSuperset(of:)` 메서드는 동일해보인다.
하지만 다음 결과를 보면 차이점을 알 수 있다.
*/
print(farmAnimals.isSuperset(of: farmAnimals))          // true
print(farmAnimals.isStrictSuperset(of: farmAnimals))    // false
/*
- `isSuperset(of:)` 메서드는 두 `Set`이 동일한 경우에도 `Superset` 관계를 인정한다.
- `isStrictSuperset(of:)` 메서드는 두 `Set`이 동일한 경우 `Superset` 관계를 인정하지 않는다.
*/


// 3. Subset (부분집합)
// Subset은 `isSubset(of:)` 메서드를 사용한다.
print(houseAnimals.isSubset(of: farmAnimals))   // true
print(cityAnimals.isSubset(of: farmAnimals))    // false

// Subset을 판단하는 또 다른 메서드 `isStrictSubset(of:)`가 있다.
print(houseAnimals.isStrictSubset(of: farmAnimals))   // true
print(cityAnimals.isStrictSubset(of: farmAnimals))    // false

/*
- `isSubset(of:)` 메서드는 두 `Set`이 동일한 경우에도 `Subset` 관계를 인정한다.
- `isStrictSubset(of:)` 메서드는 두 `Set`이 동일한 경우 `Subset` 관계를 인정하지 않는다.
*/
print(farmAnimals.isSubset(of: farmAnimals))          // true
print(farmAnimals.isStrictSubset(of: farmAnimals))    // false

// 4. Disjoint Sets (서로소 집합)
// 서로소 집합은 `isDisjoint(with:)` 메서드를 사용한다.
print(houseAnimals.isDisjoint(with: cityAnimals))   // true
print(houseAnimals.isDisjoint(with: farmAnimals))   // false

