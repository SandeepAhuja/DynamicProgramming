//: [Previous](@previous)

/**
 Given weights and values of n items, put these items in a knapsack of capacity W to get the maximum total value in the knapsack. In other words, given two integer arrays val[0..n-1] and wt[0..n-1] which represent values and weights associated with n items respectively. Also given an integer W which represents knapsack capacity, find out the maximum value subset of val[] such that sum of the weights of this subset is smaller than or equal to W. You cannot break an item, either pick the complete item, or don’t pick it (0-1 property).
 
 Input: value = [60, 100, 120]
        weight = [10, 20, 30]
        bagWeight = 50
 
 Naive solution:
i   R[i]    weight  knapsack     Weight    condition
0   60        10       10         60                totalWeight < bagWeight
1   100       20       30         160               totalWeight < bagWeight
2   120       30       60         160               totalWeight < bagWeight == false

 
1   100       20       20         100               totalWeight < bagWeight
2   120       30       50         220               totalWeight < bagWeight == false
 


   

 

 
 */

import Foundation

func knapSack(values:[Int],weights:[Int],knapSack:Int)->Int {
    
}
func main() {
    let value = [60, 100, 120]
    let weight = [10, 20, 30]
    let bagWeight = 50
    
    let result = knapSack(value,weight,bagWeight)
    print(result)
}

//: [Next](@next)
