//: [Previous](@previous)


/*
 Given two sequences, find the length of longest subsequence present in both of them. A subsequence is a sequence that appears in the same relative order, but not necessarily contiguous. For example, “abc”, “abg”, “bdf”, “aeg”, ‘”acefg”, .. etc are subsequences of “abcdefg”.
 
 Input:“ABCDGH” and “AEDFHR”
 Solution: LCS is “ADH” of length 3.
 
 Approch: 2D array
 
 String1 = “ABCDGH”
 String2 = “AEDFHR”
 let m = String1.length
 let n = String2.length
 
 C[m+1][n+1] = [[Int]]

 \  |   A   B   C   D   G   H
 n\m| 0 1   2   3   4   5   6
 ---|-----------------------------------------------
    | 0 0   0   0   0   0   0
A   | 0 1   1   1   1   2   2
E   | 0 1   1   1   1   2   2
D   | 0 1   1   1   2   2   2
F   | 0 1   1   1   2   2   2
H   | 0 1   1   1   2   2   3
R   | 0 1   1   1   2   2   3
 

i = 1 to m {
    j = 1 to n {
        if string[i-1] == string[j-1] {
            C[i][j] = c[i-1][j-1] + 1
        }else {
            C[i][j] = max(c[i-1][j], c[i][j-1])
        }
    }
}
return c[m][n]
*/

import Foundation

extension String {
    subscript(i: Int) -> String {
        return String(self[index(startIndex, offsetBy: i)])
    }
}

func LCS(input1: String, input2: String)->Int {
    let m = input1.count
    let n = input2.count
    var c = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
    
    for i in 1...m {
        for j in 1...n {
            if input1[i-1] == input2[j-1] {
                c[i][j] = c[i-1][j-1] + 1
                print(input2[j-1])
            }else {
                c[i][j] = max(c[i-1][j],c[i][j-1])
            }
        }
    }
    return c[m][n]
}

func main() {
    let input1 = "ABCDGH"
    let input2 = "AEDFHR"
    let len = LCS(input1: input1, input2: input2)
    print(len)
}

main()
//: [Next](@next)
