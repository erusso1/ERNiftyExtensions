//
//  Globals.swift
//  ERNiftyExtensions
//
//  Created by Ephraim Russo on 2/6/19.
//

import Foundation

public typealias JSONObject = [String : Any]

public typealias VoidCompletionHandler = () -> Void

public typealias ErrorCompletionHandler = (Error?) -> Void

public typealias BoolCompletionHandler = (Bool) -> Void

public func afterDelay(_ delay:Double, on queue: DispatchQueue = .main, closure:@escaping ()->()) {
    queue.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

public func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

public func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

public func +<Key, Value> (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
    var result = lhs
    rhs.forEach{ result[$0] = $1 }
    return result
}

public func += <K, V> (left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left.updateValue(v, forKey: k)
    }
}

public func printPretty(_ item: Any) {
    
    print("*****************************************")
    print("")
    print(item)
    print("")
}
