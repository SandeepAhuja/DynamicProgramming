//: [Previous](@previous)

/** Problem statement
 Given N eggs and K floors, the task is to find the minimum number of trials needed in the worst case to find the floor below which all floors are safe. A floor is safe if dropping an egg from it does not break the egg. Please refer n eggs and k floors for more insight.
 
 The following is a description of the instance of this famous puzzle involving n=2 eggs and a building with k=36 floors.

 Suppose that we wish to know which stories in a 36-story building are safe to drop eggs from, and which will cause the eggs to break on landing. We make a few assumptions:

 …..An egg that survives a fall can be used again.
 …..A broken egg must be discarded.
 …..The effect of a fall is the same for all eggs.
 …..If an egg breaks when dropped, then it would break if dropped from a higher floor.
 …..If an egg survives a fall then it would survive a shorter fall.
 …..It is not ruled out that the first-floor windows break eggs, nor is it ruled out that the 36th-floor do not cause an egg to break.
 
 If only one egg is available and we wish to be sure of obtaining the right result, the experiment can be carried out in only one way. Drop the egg from the first-floor window; if it survives, drop it from the second-floor window. Continue upward until it breaks. In the worst case, this method may require 36 droppings. Suppose 2 eggs are available. What is the least number of egg-droppings that is guaranteed to work in all cases?
 The problem is not actually to find the critical floor, but merely to decide floors from which eggs should be dropped so that the total number of trials are minimized.
 
 
 find the minimum number of trials needed in the worst case to find the floor below which all floors are safe?
 n=2 eggs
 k=36 floor
 
 */
import Foundation

func eggDropRecursive(_ eggs: Int,_ floors: Int)->Int {
    if floors == 0  || floors == 1 {
        return floors
    }
    if eggs == 1 {
        return floors
    }
    var res = 0
    var min = NSIntegerMax
    for x in 1...floors {
        res = max(eggDropRecursive(eggs-1,x-1), eggDropRecursive(eggs,floors-x))
        if res < min {
            min = res
        }
    }
    return min + 1
}

func eggDropDP(_ eggs: Int,_ floors: Int)->Int {
    var r = [[Int]](repeating: [Int](repeating: 0, count: floors+1), count: eggs+1)
    for j in 0...floors {
        r[1][j] = j
    }
    for j in 0...eggs {
        r[j][1] = 1
    }
    var result = 0
    
    for x in 2...eggs {
        for y in 2...floors {
            r[x][y] = NSIntegerMax
            for k in 1...y {
                result = 1 + max(r[x-1][k-1], r[x][y-k])
                if result < r[x][y] {
                    r[x][y] = result
                }
            }
            
        }
    }
    return r[eggs][floors]
}


func main(){
//    var result = eggDropRecursive(2, 10)
//    print(result)
    var result = eggDropDP(2,36)
    print(result)
}
main()


//: [Next](@next)
