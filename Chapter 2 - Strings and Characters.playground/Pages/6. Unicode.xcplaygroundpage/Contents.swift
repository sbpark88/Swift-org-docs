import Foundation

// 6. Unicode (유니코드)
/*
 Unicode is an international standard for encoding, representing, and processing text in different writing systems.
 Swift’s String and Character types are fully Unicode-compliant.
 */

// Unicode Scalar Values (유니코드 스칼라)
/*
 Swift’s native String type is built from Unicode scalar values.
 A Unicode scalar value is a unique 21-bit number for a character or modifier.
 */
print("Unicode Scalar Values")
print("Unicode 'U+0061' can represented by '\u{0061}' form.")
print("U+0061: \u{61}, U+1F425: \u{1F425}")

// Extended Grapheme Clusters (자모 그룹의 확장)
/*
 Every instance of Swift’s Character type represents a single extended grapheme cluster.
 An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined)
 produce a single human-readable character.
 */
print("\nExtended Grapheme Clusters")
print("This cluster contains a single scalar")
let eAcute: Character = "\u{E9}"    // é
print("\u{E9}")

print("This cluster contains two scalars.")
print("U+0065:        \u{65}")
print("U+0301:         \u{301}")
let combinedEAcute: Character = "\u{65}\u{301}"
print("U+0065&U+0301: \(combinedEAcute)")

print("\nIn Korean...")
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
print("U+D55C:               \(precomposed)")
print("U+1112&U+1161&U+11AB: \(decomposed)")

print("\nREGIONAL INDICATOR SYMBOL LETTER U (U+1F1FA) and REGIONAL INDICATOR SYMBOL LETTER S (U+1F1F8)")
print("U+1F1FA:         \u{1F1FA}")
print("U+1F1F8:         \u{1F1F8}")
print("U+1F1FA&U+1F1F8: \u{1F1FA}\u{1F1F8}")
