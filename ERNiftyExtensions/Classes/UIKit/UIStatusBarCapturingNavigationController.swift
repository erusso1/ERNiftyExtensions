//
//  UIStatusBarCapturingNavigationController.swift
//  ERNiftyExtensions
//
//  Created by Ephraim Russo on 1/5/19.
//

import Foundation

class UIStatusBarCapturingNavigationController: UINavigationController {
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        
        let vcs = super.popToRootViewController(animated: animated)
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        return vcs
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        
        let vc = super.popViewController(animated: animated)
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        return vc
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        super.pushViewController(viewController, animated: animated)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return viewControllers.last?.preferredStatusBarStyle ?? .default
    }
}
