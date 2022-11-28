import Foundation

// 1. Subscript Syntax
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
(0...10).forEach { print(threeTimesTable[$0], terminator: "  ") }
// 0  3  6  9  12  15  18  21  24  27  30


print("\n----------------------------------")
// 2. Subscript Usage
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
print("The number of legs of ant is \(numberOfLegs["ant"]!).")
// The number of legs of ant is 6.

numberOfLegs["bird"] = 2
print(numberOfLegs)  // ["spider": 8, "ant": 6, "cat": 4, "bird": 2]


print("----------------------------------")
// 3. Subscript Options
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
print(matrix)   // Matrix(rows: 2, columns: 2, grid: [0.0, 0.0, 0.0, 0.0])

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

//matrix[2, 0] = 3.2  // __lldb_expr_13/1. Subscripts.xcplaygroundpage:45: Assertion failed: Index out of range

print(matrix[1, 0]) // 3.2
