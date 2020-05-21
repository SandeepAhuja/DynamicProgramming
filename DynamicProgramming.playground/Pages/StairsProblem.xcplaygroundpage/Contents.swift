/*
 You want to climb n stairs. You can either climb 1 or 2 steps. How many different ways you can climb the n stairs?
 */
import Foundation

/*
 Recursion Solution
 TC = Exponential
 */
func recursionSteps(_ n: Int)-> Int {
    if n == 1 { return 1 }
    if n == 2 { return 2 }
    if n == 3 { return 4 }
    return recursionSteps(n-1) + recursionSteps(n-2)
}

/*
 Dynamic Problem Solution
 TC: Linear
 */
func DPSteps(_ n: Int)-> Int {
    var steps = [Int](repeating: 0, count: n)
    steps[0] = 1
    steps[1] = 2
    steps[2] = 4
    
    for i in 3..<n {
        steps[i] = steps[i-1] + steps[i-2] + steps[i-3]
    }
    return steps[n-1]
}


func main() {
    var totalWays = recursionSteps(10)
    print(totalWays)
    
    totalWays = DPSteps(4)
    print(totalWays)
}

main()


