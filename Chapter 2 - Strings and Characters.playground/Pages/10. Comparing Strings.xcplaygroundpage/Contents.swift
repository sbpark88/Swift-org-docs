import Foundation

// 10. Comparing Strings (문자열 비교)
print("""
Swift provides three ways to compare textual values:
string and character equality, prefix equality, and suffix equality.

""")


// String and Character Equality (문자열과 문자 비교)
print("""
# 10.1 Equality

String and character equality is checked with the “equal to” operator (==)
and the “not equal to” operator (!=), as described in Comparison Operators:

""")
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}


// Two String values (or two Character values) are considered equal if their extended grapheme clusters are canonically equivalent.
let eAcuteQuestion = "Caf\u{E9}"                    // LATIN SMALL LETTER E WITH ACUTE (U+00E9)
let combinedEAcuteQuestion = "Caf\u{65}\u{301}"     // LATIN SMALL LETTER E (U+0065) followed by COMBINING ACUTE ACCENT (U+0301)
print("\neAcuteQuestion: \(eAcuteQuestion), combinedEAcuteQuestion: \(combinedEAcuteQuestion)")
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered euqal")
}


// Note that "A" used in English != "A" used in Russian
let latinCapitalLetterA: Character = "\u{41}"           // LATIN CAPITAL LETTER A (U+0041, or "A"), as used in English.
let cyrillicCapitalLetterA: Character = "\u{0410}"      // CYRILLIC CAPITAL LETTER A (U+0410, or "А"), as used in Russian.
print("\nlatinCapitalLetterA: \(latinCapitalLetterA), cyrillicCapitalLetterA: \(cyrillicCapitalLetterA)")
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters aren't equivalent.")
}


let characterA: Character = "A"
let stringA: String = "A"
let substringA: Substring = stringA.prefix(1)
print("\ncharacterA: \(characterA), stringA: \(stringA), substringA: \(substringA)")
if stringA == substringA {
    print("String and Substring are considered equal")
}
print("""

However, (character and string) or (character and substring) cannot compare equality, due to difference data type!!

""")


// Prefix and Suffix Equality (접두사와 접미사 비교)
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
print("\n\n# romeoAndJuliet is")
romeoAndJuliet.forEach { print($0) }

print("\n# 10.2.1 Prefix")
var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

print("\n# 10.2.2 Suffix")
var mansionCount = 0
var cellCount = 0

var romeoAndJulietIterator = romeoAndJuliet.makeIterator()
while let scene = romeoAndJulietIterator.next() {
    switch true {
    case scene.hasSuffix("Capulet's mansion"): mansionCount += 1
    case scene.hasSuffix("Friar Lawrence's cell"): cellCount += 1
    default: continue
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
