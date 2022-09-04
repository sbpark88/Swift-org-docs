import Foundation

// 4. Comparison Operators (비교 연산자)
let (a, b) = (5, 7)
print("(a, b) is (\(a), \(b))")
print("\n# 1. Comparison Operators")
print("Equal to(==):                    a == b is \(a == b)")
print("Not equal to(!=):                a != b is \(a != b)")
print("Greater than(>):                 a > b is \(a > b)")
print("Less than(<):                    a < b is \(a < b)")
print("Greater than or equal to(>=):    a >= b is \(a >= b)")
print("Less than or equal to(<=):       a <= b is \(a <= b)")
print("Swift also provides (=== and !==) to test wheather two object references both refer to the same object instance.")

// Tuple Comparison
print("\n# 2. Tuple Comparison")
print("You can compare two tuples if they have the same type and the same number of values.")
print("튜플의 비교는 왼쪽에서 오른쪽으로, 한 번에 하나씩, '서로 다른 값이 나올때까지' 비교한다. 단, 마지막 비교는 동일 값에 대해서도 정확히 비교한다.")

print("(1, \"zebra\") < (2, \"apple\") is \((1, "zebra") < (2, "apple"))      >> First values are not equal, 1 < 2 is true, stop!")
print("(3, \"apple\") < (2, \"zebra\") is \((3, "apple") < (2, "zebra"))      >> First values are not equal, 3 < 2 is false, stop!\n")

print("(1, \"zebra\") < (1, \"apple\") is \((1, "zebra") < (1, "apple"))      >> First values are equal, so compare second value, 'zebra' < 'apple' is false, stop!")
print("(1, \"apple\") < (1, \"zebra\") is \((1, "apple") < (1, "zebra"))      >> First values are equal, so compare second value, 'apple' < 'zebra' is true, stop!")
print("(1, \"apple\") < (1, \"apple\") is \((1, "apple") < (1, "apple"))      >> First values are equal, and second values are equal, however they are last values and 'Less than' is false, stop!")
print("(1, \"apple\") <= (1, \"apple\") is \((1, "apple") <= (1, "apple"))    >> Similar to upper case, but last values compare 'Less than or equal to' condition, thus it is true!!\n")
