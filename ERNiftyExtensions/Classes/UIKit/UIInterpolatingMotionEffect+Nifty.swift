//
//  UIInterpolatingMotionEffect+Nifty.swift
//  ERNiftyExtensions
//
//  Created by Ephraim Russo on 12/12/18.
//

import Foundation
import UIKit

extension UIInterpolatingMotionEffect {
    public convenience init(keyPath: String, type: UIInterpolatingMotionEffect.EffectType, span: Int) {
        self.init(keyPath: keyPath, type: type)
        self.minimumRelativeValue = -span
        self.maximumRelativeValue = span
    }
}
