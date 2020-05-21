//: [Previous](@previous)

/* Problem Statement
 You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security system connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

 Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.
 
 Example 1:

 Input: [1,2,3,10]
 Output: 4
 Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
              Total amount you can rob = 1 + 3 = 4.
 
 
 Example 2:
 
 Input: [2,1,1,2]
 Output: 4
 Explanation: R[i] where i 1 to N houses and R[i] is max rob money till house i.
 
 Base cases:
 ------------------------------------------------------------------------------------
 R[0] = P[0]
 R[1] = P[1]
 R[2] = P[0] + P[2]
 
 Base Conditions:
 ------------------------------------------------------------------------------------
 if P.count == 1 {
    return P[0]
 }
  
 Exit Statement:
 ------------------------------------------------------------------------------------
 return  max(R[n-2],R[n-1])
 
 Draft Solution:
 ------------------------------------------------------------------------------------
 i |
 --|----------------------------------------------------------------------------------
 0 |  R[0] = P[0] = 2
 1 |  R[1] = P[1] = 1
 2 |  R[2] = P[0] + P[2] = 3
 3 |  R[3] = max((R[i-2]+P[i]),(R[i-3]+P[i])) = max(3,4) = 4
 
 
 Example 3:
 
 Input: P = [2,7,9,3,1]
 Output: 12
 Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
              Total amount you can rob = 2 + 9 + 1 = 12.
 
 Base cases:
 ------------------------------------------------------------------------------------------
 R[0] = P[0]
 R[1] = P[1]
 R[2] = P[0] + P[2]
 
 Base Conditions:
 ------------------------------------------------------------------------------------
 if P.count == 2 {
    return max(P[0],P[1])
 }
 
 Draft Solution:
 ------------------------------------------------------------------------------------
 i |
 --|----------------------------------------------------------------------------------
 0 | R[0] = P[0] = 2
 1 | R[1] = P[1] = 7
 2 | R[2] = max((R[i-2]+P[i])) R[0] + P[2] = 11
 3 | R[3] = max((R[i-2]+P[i]),(R[i-3]+P[i])) = max(10,5) = 10
 4 | R[4] = max((R[i-2]+P[i]),(R[i-3]+P[i]), (R[i-4]+P[i])) = max(12,8,3) = 12
 */

/* Solution 1
 *
 */
import Foundation

func rob(P: [Int])->Int {
    let N = P.count
    
    if N == 0 { return 0 }
    
    //Base Condition
    if N == 1 {
        return P[0]
    }
    
    //Initialize an empty array to store sub solutions of rob of house i
    var R = [Int](repeating: 0, count: N)
    
    //Base cases
    R[0] = P[0]
    R[1] = P[1]
    
    //Intialize a variable to retain the max Rob amount
    var maxRob = -1
                
    for i in 2..<N {
        maxRob = -1
        for j in 0..<i-1 {
            let temp = R[j] + P[i]
            if temp > maxRob {
                maxRob = temp
            }
        }
        R[i] = maxRob
    }
    
    return max(R[N-2],R[N-1])
}

func main() {
    var robHouses = [1,2,3,1]
    var robAmount = rob(P: robHouses)
    print(robAmount)
    
    robHouses = [2,7,9,3,1]
    robAmount = rob(P: robHouses)
    print(robAmount)

    robHouses = [2,1,1,2]
    robAmount = rob(P: robHouses)
    print(robAmount)

    robHouses = [1,12,3,4,5,7]
    robAmount = rob(P: robHouses)
    print(robAmount)

    robHouses = []
    robAmount = rob(P: robHouses)
    print(robAmount)
}
main()

//: [Next](@next)
