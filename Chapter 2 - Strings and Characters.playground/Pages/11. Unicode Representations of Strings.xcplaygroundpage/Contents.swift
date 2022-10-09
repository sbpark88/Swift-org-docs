import Foundation

// 11. Unicode Representations of Strings (문자열의 유니코드 표현)
let dogString = "Dog‼🐶"
print("""

Dog!!🐶

(hexadecimal) | (decimal) | (etc)
D:  U+0044    |     68    | 4*16^1 + 4 = 68
o:  U+006F    |    111    | 6*16^1 + 15 = 111
g:  U+0067    |    103    | 6*16^1 + 7 = 103
‼:  U+203C    |   8252    | 2*16^3 + 3*16^1 + 12 = 8252
🐶: U+1F436   | 128054    | 1*16^4 + 15*16^3 + 4*16^2 + 3*16 + 6 = 128054

""")


// UTF-8 Representation (UTF-8 표현)
print("""

# 11.1 UTF-8 Representation
  : 2^3 = 8bit, thus, UTF-8 has a number of three ciphers.

  D, o, g  >> They have 3 digits or less.
  ‼, 🐶   >> They exceed 3 digits.

""")
for codeUnit in dogString.utf8 {
  print(codeUnit, terminator: " ")
}
print("""

The decimal value (8252) of the '‼' is separated by three decimal codeUnit values (226, 128, 188)
that is a three-byte UTF-8 representation to use 'etended grapheme clusters'.

Likewise, 🐶 is separated by four decimal codeUnit values (240, 159, 144, 182)
""")


// UTF-16 Representation (UTF-16 표현)
print("""

# 11.2 UTF-16 Representation
  : 2^4 = 16bit, thus, UTF-16 has a number of four ciphers.

  D, o, g, ‼  >> They have 4 digits or less.
  🐶         >> It exceeds 4 digits.

""")
for codeUnit in dogString.utf16 {
  print(codeUnit, terminator: " ")
}
print("""

The decimal value (128054) of the '🐶' is separated by tow decimal codeUnit values (55357, 56374)
""")


// Unicode Scalar Representation (유니코드 스칼라 표현)
print("""

# 11.3 Unicode Scalar Representation
  : Each UnicodeScalar has a value property that returns the scalar’s 21-bit value, represented within a UInt32 value.

  'UnicodeScalarProperty' is of type 'UnicodeScalarView'
  A collection of values of type 'UnicodeScalar'

""")
for scalar in dogString.unicodeScalars {
  print("\(scalar) :  \(scalar.value)")
}
print("""

A Unicode scalar value is a unique 21-bit number for a character or modifier,

U+0044
U+006F
U+0067
U+203C
U+1F436

therefore, just use it as is.
""")
