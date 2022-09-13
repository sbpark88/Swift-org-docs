import Foundation

// 7. Counting Characters (문자 세기)
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

var word = "cafe"
print("the number of character in \(word) is \(word.count)")  // 4

word += "\u{301}" // Combining acute accent, U_0301
print("\nthe number of character in \(word) is \(word.count)")  // Still, 4
let message = """
The extended grapheme clusters may not always affect a string's character count.
However, this do not means same amount of memeory store.
"""
print(">> The extended grapheme clusters may not always affect a string's character count.")
