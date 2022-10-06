import Foundation

// 4. Sets (집합) Part 1 - Creation
/*
An unordered collection of unique elements.
Swift’s Set type is bridged to Foundation’s NSSet class.
*/


// 1. Hash Values for Set Types (셋 해시값)
// 'Set' type must conform to be the 'Hashable' protocol, when two 'objects' are totaly equal, their hash values are equal.

// 2. Set Type Syntax
// Set의 `initializer syntax`는 다음과 같다.
// var newSet = Set<Element>()
// var newSet: Set<Element> = [elements...]  // Do not use to Empty Set.

/*
아래서 다시 설명하겠지만 `Set`은 `Shorthand Syntax`의 사용이 불가능하다.
*/


// 3. Creating and Initializing an Empty Set (빈 셋 생성)
var letters = Set<Character>()
/*
Set cannot use the 'Shorthand Syntax' to create 'Empty Set'(Cannot distingusih with Array's Shorthand Syntax).
*/

letters.insert("c")
letters = []
/*
lettrs is now an empty set, but is still of type Set<Character>
*/


// 4. Creating a Set with an Array Literal (배열 리터럴을 이용한 셋 생성)
/*
`Shorthand Syntax`는 사용할 수 없지만 `Array Literal`을 이용해 `Set`을 생성할 수 있다.
*/
// var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

/*
`Set` 역시 Array iteral을 이용해 초기 데이터가 주어지는 경우 `Type Inference`를 사용할 수 있다.
단, Array와의 구분을 위해 Set이라는 것은 명시해야한다.
*/
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]


/*
Array와 달리 서로 다른 Type의 데이터는 담을 수 없다.
var anySet: Set<Any> = ["ABC", 5, "DEF"]  // type 'Any' does not conform to protocol 'Hashable'
*/
