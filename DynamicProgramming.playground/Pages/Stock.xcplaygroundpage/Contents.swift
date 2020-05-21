//: [Previous](@previous)


//Optimization Problem
/* Best Time to Buy and Sell Stock

 Problem Statement: Say you have an array for which the ith element is the price of a given stock on day i.

 If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.

 Note that you cannot sell a stock before you buy one.
 
 
 Example 1:

 Input: [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
              Not 7-1 = 6, as selling price needs to be larger than buying price.
 

 Example 2:

 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 
 Example 3:
 Input: [100, 180, 260, 310, 40, 535, 695]
 Output: 655
 
 Assumptions:
 ---------------------------------------------------------------------------------
 P[i] is an array where i={0,n} and P[i] is price of stock at day ith
 R[i] is an array where i={0,n} and R[i] is maximum profit at day ith
 Profit at any ith day is P[i] - min(P[i],R[i-1])
 Minimum price at any ith day is min(P[i],R[i-1])
 
 Recursive Approach:
 ---------------------------------------------------------------------------------
 R[0] = 0 //Base condition
 R[1] = P[i] - min(P[i],P[i-1]) = 80
 R[2] = P[i] - min(P[i],P[i-1],P[i-2]) = 160
 R[3] = P[i] - min(P[i],P[i-1],P[i-2],P[i-3]) = 210
 R[4] = P[i] - min(P[i],P[i-1],P[i-2],P[i-3],P[i-4]) = 0
 R[5] = P[i] - min(P[i],P[i-1],P[i-2],P[i-3],P[i-4],P[i-5]) = 495
 R[6] = P[i] - min(P[i],P[i-1],P[i-2],P[i-3],P[i-4],P[i-5],P[i-6]) = 655
 
 Dynamic Programming Approch:
 ---------------------------------------------------------------------------------
 We need to store minimum price before ith day in R[i]
 
 R[0] = P[0] //base condition
 R[1] = P[i] - min(P[i],R[i-1])
 R[2] = P[i] - min(P[i],R[i-1])
 R[3] = P[i] - min(P[i],R[i-1])
 R[4] = P[i] - min(P[i],R[i-1])
 R[5] = P[i] - min(P[i],R[i-1])
 R[6] = P[i] - min(P[i],R[i-1])

 */

import Foundation

/**
 We need to store minimum price before ith day in R[i]
 [100, 180, 260, 310, 40, 535, 695]
 R[0] = P[0] //base condition 100           0
 R[1] = P[i] - min(P[i],R[i-1]) 100         80
 R[2] = P[i] - min(P[i],R[i-1]) 100         160
 R[3] = P[i] - min(P[i],R[i-1]) 100         210
 R[4] = P[i] - min(P[i],R[i-1]) 40          0
 R[5] = P[i] - min(P[i],R[i-1]) 40          495
 R[6] = P[i] - min(P[i],R[i-1]) 40          655
 
 max
 */
//Dynamic programming solution
func maxProfit(_ prices: [Int]) -> Int {
    if prices.isEmpty {
        return 0
    }
    var mxProfit = 0
    var R = [Int](repeating: 0, count: prices.count);
    R[0] = prices[0]
    for i in 1..<prices.count {
        R[i] = min(prices[i], R[i-1]);
        let temp = prices[i] - R[i]
        if temp > mxProfit {
            mxProfit = temp
        }
    }
    return mxProfit
}

/* Dynamic Programming Solution
 
 */
    
func main(){
    var profit = maxProfit([100, 180, 260, 310, 40, 535, 695])
    print(profit)
    profit = maxProfit([7,6,4,3,1])
    print(profit)
    profit = maxProfit([3,2,6,5,0,3])
    print(profit)
}
main()

//: [Next](@next)
