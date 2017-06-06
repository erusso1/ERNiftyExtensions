//
//  UIView+Nifty.swift
//  Pods
//
//  Created by Ephraim Russo on 6/5/17.
//
//

extension UIView {
    
    public var gradient: CAGradientLayer? {
        
        get { return self.layer.sublayer(withName: "nifty_gradient_key") as? CAGradientLayer }
        
        set {
            
            if newValue == nil {
                let g = self.layer.sublayer(withName: "nifty_gradient_key") as! CAGradientLayer
                g.removeFromSuperlayer()
            }
            
            else {
                
                newValue!.frame = self.bounds
                newValue!.name = "nifty_gradient_key"
                self.layer.addSublayer(newValue!)
            }
        }
    }
}
