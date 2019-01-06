//
//  UIStatusBarCapturingNavigationController.swift
//  ERNiftyExtensions
//
//  Created by Ephraim Russo on 1/5/19.
//

import Foundation
import UIKit

open class UIStatusBarCapturingNavigationController: UINavigationController {
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        self.modalPresentationCapturesStatusBarAppearance = true
    }
    
    open override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        
        let vcs = super.popToRootViewController(animated: animated)
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        return vcs
    }
    
    open override func popViewController(animated: Bool) -> UIViewController? {
        
        let vc = super.popViewController(animated: animated)
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        return vc
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        super.pushViewController(viewController, animated: animated)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return viewControllers.last?.preferredStatusBarStyle ?? .default
    }
}
