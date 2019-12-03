import UIKit

// ******************************************************************************************************************************************

// Example 1

protocol Toy {}

class Doll: Toy {}

class TeddyBear: Toy {}

// Swift 5.1 introduces opaque return types using the 'some' keyword
func getToy() -> some Toy {
    return Doll()
}

// This will not compile because Swift hides the type info of the result of getToy()
//let doll: Doll = getToy()

// This is fine
let toy: Toy = getToy()

// ******************************************************************************************************************************************

// Example 2

// Even though Strings and Ints are both Equatable, we cannot do this. A method with an opaque return type can only return one type.
//func getAStringOrAnInt(iWantAnInt: Bool) -> some Equatable {
//    if (iWantAnInt) {
//        return 5
//    }
//    return "Five"
//}

// ******************************************************************************************************************************************

// Example 3

// Equatable has associated type requirements, so it cannot be used as a return type in this way
//func getAnEquatable() -> Equatable {
//    8
//}

// Use 'some' to return a specific type that conforms to Equatable. The exact type that is returned (in this case Int) is hidden from the caller
func getAnEquatable() -> some Equatable {
    8
}

func getAnotherEquatable() -> some Equatable {
    10
}

func getAThirdEquatable() -> some Equatable {
    "Caterpillar"
}

// The result of getAnEquatable() can't be compared with an Int literal because the caller can't be sure that it's an Int
//print(getAnEquatable() == 5)

// This compiles because Swift guarantees that getAnEquatable() always returns the same type, even though the caller doesn't know what it is
print(getAnEquatable() == getAnEquatable())

// Swift makes sure we don't try to compare different Types
//print(getAnEquatable() == getAThirdEquatable())

// This is a bit surprising!
// Even though the compiler knows that getAnEquatable() and getAnotherEquatable() both return Ints, we cannot compare them because this type info is hidden and we only know that they are both Equatable, not necessarilyt the same type
// The error message is quite clear: "Binary operator '==' cannot be applied to operands of type 'some Equatable' (result of 'getAnEquatable()') and 'some Equatable' (result of 'getAnotherEquatable()')"
//print(getAnEquatable() == getAnotherEquatable())

// ******************************************************************************************************************************************

