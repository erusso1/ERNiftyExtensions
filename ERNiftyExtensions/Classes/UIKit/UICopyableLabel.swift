//
//  ERCopyableLabel.swift
//  SocialBrowser
//
//  Created by Ephraim Russo on 10/7/15.
//  Copyright © 2015 iubble Incorportated. All rights reserved.
//

import Foundation
import UIKit

open class UICopyableLabel: UILabel {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        sharedInit()
    }
    
    private func sharedInit() {
        
        isUserInteractionEnabled = true
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showMenu(_:)))
        
        self.addGestureRecognizer(longPress)
    }
    
    @objc private func showMenu(_ recognizer:UILongPressGestureRecognizer) {
        becomeFirstResponder()
        if recognizer.state == .began {
            self.alpha = 0.6
        }
        
        let menu = UIMenuController.shared
        if !menu.isMenuVisible {
            menu.setTargetRect(bounds, in: self)
            menu.setMenuVisible(true, animated: true)
        }
    }
    
    open override func copy(_ sender: Any?) {
        self.alpha = 1
        let board = UIPasteboard.general
        board.string = text
        let menu = UIMenuController.shared
        menu.setMenuVisible(false, animated: true)
    }

    open override var canBecomeFirstResponder: Bool { return true }
    
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        if action == #selector(copy(_:)) {
            
            return true
        }
        
        return false
    }
}


