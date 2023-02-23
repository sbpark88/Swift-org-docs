import Foundation

struct Vector3D: Equatable {
//    var x = 0.0, y = 0.0, z = 0.0
    var (x, y, z) = (0.0, 0.0, 0.0)
}

let alpha = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let beta = Vector3D(x: 2.0, y: 3.0, z: 4.0)

if alpha == beta {
    print("These two vectors are also equivalent.")
}
