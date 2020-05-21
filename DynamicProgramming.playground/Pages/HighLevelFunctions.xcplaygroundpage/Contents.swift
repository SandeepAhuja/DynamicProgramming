//: [Previous](@previous)

import Foundation

extension Array {
    public func customMap<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        var result = [T]()
        for item in self {
            result.append(try transform(item))
        }
        return result
    }
    
    public __consuming func customFilter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element] {
        var result = [Element]()
        for item in self {
            if try isIncluded(item) == true {
                result.append(item)
            }
        }
        return result
    }    
}

func main() {
    let numerals = [1,2,3,4,5,6]
    var result = numerals.map { (value) -> Int in
        return value * value
    }
    print(result)
    result = numerals.customMap { (value) -> Int in
        return value * value
    }
    print(result)
    result = numerals.customFilter { (value) -> Bool in
        return value < 3
    }
    print(result)
}
main()

//: [Next](@next)

