//: [Previous](@previous)

/*
 Given a rod of length n and prices P[i] for i= 1,...,n, where P[i] is the price of a rod of length i. Find the maximum total revenue you can make by cutting and selling the rod(Assume no cost for cutting the rod).
 */
import Foundation

/*
 Recursion Method
 P1 + r(n-1)
 P2 + r(n-2)
 Pn-2 + r(2)
 Pn-1 + r(1)
 Pn
 
 base case P0 = 0
 maxRevenue = max(P1 + r(n-1),P2 + r(n-2),...,Pn-2 + r(2),Pn)
 
 */
func revenue(n: Int, prices:[Int])->Int {
    if n == 0 { return 0 }
    var maxRevenue = -1
    for i in 0..<n {
        let temp = prices[n-i-1] + revenue(n: i, prices: prices)
        if temp > maxRevenue {
            maxRevenue = temp
        }
    }
    return maxRevenue
}

/*
 Dynamic Programming method
 create an empty array of r[i] where i=1...n and R[i] is revenue of length i.
 calculate the maximum revenue of length i and insert into revenue[i]
 */
func DP_Revenue(n: Int, prices:[Int])->Int {
    var revenue = [Int](repeating: 0, count: n+1)
    revenue[0] = 0
    for i in 1...n {
       var maxRevenue = -1
        for j in 1...i {
            let temp = prices[j-1] + revenue[i-j]
            if temp > maxRevenue {
                maxRevenue = temp
            }
        }
        revenue[i] = maxRevenue
    }
    return revenue[n]
}


func main() {
    let prices = [1,5,8,9,10]
    var maxRevenue = revenue(n: 5, prices: prices)
    print(maxRevenue)
    maxRevenue = DP_Revenue(n: 5, prices: prices)
    print(maxRevenue)
}

main()

//: [Next](@next)
