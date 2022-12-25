import Foundation

_ = {
    defer {
        print("first")
    }
    defer {
        print("second")
    }
    print("three")
}()
