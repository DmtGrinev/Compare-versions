import UIKit

func versionCompare(curentVersion: String, otherVersion: String) -> String {
    
    
    
    var curentVersionArray: [String] = curentVersion.components(separatedBy: ".")
    var otherVersionArray: [String] = otherVersion.components(separatedBy: ".")
    
    addZeros(array: &curentVersionArray)
    let curentVersion = curentVersionArray.joined(separator: ".")
    curentVersion.count
    addZeros(array: &otherVersionArray)
    let otherVersion = otherVersionArray.joined(separator: ".")
    otherVersion.count
    
    
    let versionDelimiter = "."
    var curentComponents = curentVersion.components(separatedBy: versionDelimiter)
    var otherVersionComponents = otherVersion.components(separatedBy: versionDelimiter)
    let zeroDiff = curentComponents.count - otherVersionComponents.count
    
    if zeroDiff == 0 {
        let versionCompare = (curentVersion.compare(otherVersion, options: .numeric))
        if versionCompare == .orderedSame {
            return "curentVersion = otherVersion"
        } else if versionCompare == .orderedAscending {
            return "curentVersion < otherVersion"
        } else if versionCompare == .orderedDescending {
            return "curentVersion > otherVersion"
        }
        
    } else {
        let zeros = Array(repeating: "0", count: abs(zeroDiff))
        if zeroDiff > 0 {
            otherVersionComponents.append(contentsOf: zeros)
        } else {
            curentComponents.append(contentsOf: zeros)
        }
        curentComponents.joined(separator: versionDelimiter)
        let versionCompare = curentVersion.compare(otherVersionComponents.joined(separator: versionDelimiter), options: .numeric)
        
        if versionCompare == .orderedSame {
            return "curentVersion = otherVersion"
        } else if versionCompare == .orderedAscending {
            return "curentVersion < otherVersion"
        } else if versionCompare == .orderedDescending {
            return "curentVersion > otherVersion"
        }
    }
    return ""
}

versionCompare(curentVersion: ".", otherVersion: "1...")









func addZeros (array: inout[String]) -> [String] {
    var first = 0
    for i in 0...array.count - 1 {
        let indexFirst  = array.index(array.startIndex, offsetBy: i)
        if array[indexFirst] == "" {
            array[first] = "0"
            first += 1
        } else {
            first += 1
        }
    }
    return array
}
