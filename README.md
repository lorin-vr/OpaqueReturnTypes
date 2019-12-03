
# OpaqueReturnTypes

Playground to mess around with the opaque return type feature introduced in Swift 5.1

## Requirements
Xcode 11 or higher

## Why would we want opaque result types?
* We can use protocols as return types without worrying about Self or associated type requirements
* We don’t have to expose internal types
* In the future we can change the type we're returning without breaking anything outside
* Our function is in charge of the type it returns, not the caller of the function (unlike with generics)
* It's handy in SwiftUI because ```some View``` is much nicer than long, meaningless concrete types

## References:
https://www.hackingwithswift.com/articles/187/how-to-use-opaque-return-types-in-swift-5-1
https://medium.com/@PhiJay/whats-this-some-in-swiftui-34e2c126d4c4