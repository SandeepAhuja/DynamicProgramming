//: [Previous](@previous)

/*
 Write an efficient program to find the sum of contiguous subarray within a one-dimensional array of numbers which has the largest sum.
 Input: [-2, -3, 4, -1, -2, 1, 5, -3]
*/

import Foundation

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

//Recursive Solution Tc = O(n)
func maxSum(input: [Int])->Int {
    var max_so_far = input[0], currentMax = input[0]
    for i in 1..<input.count {
        currentMax = max(input[i], currentMax + input[i])
        max_so_far = max(max_so_far,currentMax)        
    }
    return max_so_far
}

func main() {
    let input = [-2, -3, 4, -1, -2, 1, 5, -3]
    let result = maxSum(input: input)
    print(result)
}

main()
//: [Next](@next)
