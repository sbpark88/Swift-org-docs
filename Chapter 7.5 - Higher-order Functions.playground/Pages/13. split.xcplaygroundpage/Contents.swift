import Foundation

// 1. split(separator:maxSplits:omittingEmptySubsequences:)
//let line = "BLANCHE:   I don't want realism. I want magic!"
//let splited = line.split(separator: " ")
//print(splited)          // ["BLANCHE:", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]
//print(type(of: line))       // String
//print(type(of: splited))    // Array<Substring>
//
//
//print("-----------------------------------------")
//let splitedMaxOne = line.split(separator: " ", maxSplits: 1)
//print(splitedMaxOne)    // ["BLANCHE:", "  I don\'t want realism. I want magic!"]
//
//
//print("-----------------------------------------")
//let splitedOmitFalse = line.split(separator: " ", omittingEmptySubsequences: false) // default true
//print(splitedOmitFalse) // ["BLANCHE:", "", "", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]


print("-----------------------------------------")
// 2. split(maxSplits:omittingEmptySubsequences:whereSeparator:)
let line = "BLANCHE:   I don't want realism. I want magic!"
let splited = line.split { $0 == " " }
print(splited)          // ["BLANCHE:", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]
print(type(of: splited))    // Array<Substring>
