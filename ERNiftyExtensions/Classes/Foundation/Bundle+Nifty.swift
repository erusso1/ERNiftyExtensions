//
//  Bundle+Nifty.swift
//  Pods
//
//  Created by Ephraim Russo on 6/5/17.
//
//

import Foundation

extension Bundle {
    
    public func object<T>(forInfoPlistKey key: String) -> T? { return self.object(forInfoDictionaryKey: key) as? T }
}
