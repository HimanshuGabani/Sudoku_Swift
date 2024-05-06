import Foundation

var arr = Array(repeating: Array(repeating: 0, count: 9), count: 9)

var random = Array(1...9)

@discardableResult
func callMe()->Bool{
    for i in arr.indices{
        for j in arr.indices where arr[i][j] == 0 {
            let o = ((i/3)*3,(j/3)*3)
            let family  = (0...2).reduce([]) { a,b in a + (0...2).map {arr[o.0+b][o.1+$0]} }
            let colm = arr.indices.map({arr[$0][j]})
            let posiblity = Set(random).subtracting(arr[i]).subtracting(colm).subtracting(family)
            for x in posiblity{
                arr[i][j] = x
                
                if(callMe()){
                   return true
                }
            }
            arr[i][j] = 0
            return false
        }
    }
    return true
}
callMe()

print(arr.map({"\($0)"}).joined(separator: "\n"))



