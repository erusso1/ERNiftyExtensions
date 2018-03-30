//
//  UIImage+Nifty.swift
//  ERNiftyExtensions
//
//  Created by Ephraim Russo on 3/29/18.
//

import UIKit
import Foundation

extension UIImage {
    
    public func resizedTo(_ size: CGSize) -> UIImage? {
    
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        self.draw(in: CGRect(origin: .zero, size: size))
        let output = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return output;
    }
}
