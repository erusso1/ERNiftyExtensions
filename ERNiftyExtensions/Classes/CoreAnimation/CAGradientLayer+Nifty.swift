//
//  CAGradientLayer+Nifty.swift
//  Pods
//
//  Created by Ephraim Russo on 6/5/17.
//
//

extension CAGradientLayer {
    
    @nonobjc public static func from(colors:[UIColor], start: CGPoint = CGPoint(x: 0.5, y: 0.0), end: CGPoint = CGPoint(x: 0.5, y: 1.0)) -> CAGradientLayer {
        
        let colors = colors.map({$0.cgColor})        
        let maskLayer = CAGradientLayer()
        maskLayer.startPoint = start
        maskLayer.endPoint = end
        maskLayer.colors = colors
        return maskLayer
    }
}
