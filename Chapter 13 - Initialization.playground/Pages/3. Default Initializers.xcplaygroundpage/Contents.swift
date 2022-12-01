import Foundation

// 1. Default Initializers for Structures and Classes
// Class provides default values for all of its properties
//class ShoppingListItem {
//    var name: String?
//    var quantity = 1
//    var purchased = false
//
//    init(name: String) {
//        self.name = name
//    }
//}
//var item = ShoppingListItem(name: "Bread")


// Class dosen't provide at least one initializer itself.
//class ShoppingListItem {
//    var name: String
//    var quantity = 1
//    var purchased = false
//
//    init(name: String) {
//        self.name = name
//    }
//}
//var item = ShoppingListItem(name: "Bread")

// Class provides default values for all of its properties
// & dosen't provide at least one initializer itself.
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()

print("-------------------------------------")
// 2. Memberwise Initializers for Structure Types
//struct Size {
//    var width: Double, height:Double
//}
//var square = Size(width: 2.0, height: 2.0)


//struct Size {
//    var width: Double = 5.0, height:Double
//}
//var square = Size(height: 5.0)
//var rectangle = Size(width: 7.0, height: 3.0)


struct Size {
    var width: Double = 5.0, height:Double = 5.0
}
var square = Size()
var rectangle = Size(width: 7.0)
var anotherRectangle = Size(height: 12.0)
var hugeSqure = Size(width: 100.0, height: 100.0)
