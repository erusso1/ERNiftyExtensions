//
//  IndexPath+Nifty.swift
//  Pods
//
//  Created by Ephraim Russo on 7/11/17.
//
//

import UIKit

extension IndexPath {
  
  public var description: String {
    
    #if os(iOS)
        return "Section: \((self as NSIndexPath).section) Item: \((self as NSIndexPath).item)"
    #endif

    #if os(watchOS)

    return String(describing: self)

    #endif
  }
}
