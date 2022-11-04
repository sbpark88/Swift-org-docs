import Foundation

// 1. `Beverage` has `coffee`, `tea` and `juice` as its own values.
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

var myBeverage: Beverage
myBeverage = .coffee


// 2. `Barcode` has `upc(Int, Int, Int, Int)` and `qrCode(String)` as its associated values.
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode: Barcode
productBarcode = .upc(8, 85909, 51226, 3)
print("productBarcode is '\(productBarcode)'")      // productBarcode is 'upc(8, 85909, 51226, 3)'


productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
print("productBarcode is '\(productBarcode)' now")  // productBarcode is 'qrCode("ABCDEFGHIJKLMNOP")' now


// 3. Switch Statements with Associated Values
//let printBarcode = { (productBarcode: Barcode) in
//    switch productBarcode {
//    case .upc(let numberSystem, let manufacturer, let product, let check):
//        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
//    case .qrCode(let productCode):
//        print("QR code: \(productCode).")
//    }
//}

let printBarcode = { (productBarcode: Barcode) in
    switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR code: \(productCode).")
    }
}

productBarcode = .upc(8, 85909, 51226, 3)
printBarcode(productBarcode)    // UPC: 8, 85909, 51226, 3.

productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
printBarcode(productBarcode)    // QR code: ABCDEFGHIJKLMNOP.

//func printBarcode (_ productBarcode: Barcode) {
//    switch productBarcode {
//    case .upc(let numberSystem, let manufacturer, let product, let check):
//        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
//    case .qrCode(let productCode):
//        print("QR code: \(productCode).")
//    }
//}

//func printBarcode (_ productBarcode: Barcode) {
//    switch productBarcode {
//    case let .upc(numberSystem, manufacturer, product, check):
//        print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
//    case let .qrCode(productCode):
//        print("QR code: \(productCode).")
//    }
//}
