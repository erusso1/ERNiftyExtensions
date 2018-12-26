//
//  UIViewController+Nifty.swift
//  Pods
//
//  Created by Ephraim Russo on 7/11/17.
//
//

import UIKit

public protocol NibLoadable: NSObjectProtocol {
  
  static var nibName: String { get }
  
  static func nibInstance() -> Self
}

extension NibLoadable where Self : UIViewController {
  
  public static var nibName: String { return classString }
  
  public static func nibInstance() -> Self {
    
    return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as! Self
  }
}

extension NibLoadable where Self : UIView {
  
  public static var nibName: String { return classString }
  
  public static func nibInstance() -> Self {
    
    return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as! Self
  }
}

public protocol Storyboarded: NSObjectProtocol {
  
  static var storyboardIdentifier: String { get }
  
  static var storyboardName: String { get }
  
  static func storyboardInstance() -> Self
}

extension Storyboarded where Self : UIViewController {
  
  static var storyboardIdentifier: String { return classString }

  static func storyboardInstance() -> Self {
    
    return UIStoryboard(name: storyboardName, bundle: .main).instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
  }
}

extension UIViewController {
  
    public func presentSettingsAlertWithTitle(_ title: String, message: String, cancelHandler: ((UIAlertAction) -> Void)? = nil) {
    
    let alertController = UIAlertController( title: title, message: message, preferredStyle: .alert)
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelHandler)
    
    let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
      
      guard let url = URL(string: UIApplication.openSettingsURLString) else {return}
      
      NotificationCenter.default.post(name: .erNiftyOpenSettingsNotification, object: url)
    }
    
    alertController.addAction(cancelAction)
    
    alertController.addAction(openAction)
    
    self.present(alertController, animated: true, completion: nil)
  }
  
  public func presentErrorAlert(title:String="An Error Occurred", message:String="We weren't able to process your request. Please try again.", completion:(()->Void)?=nil) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Ok", style: .default) { _ in completion?() }
    alertController.addAction(okAction)
    self.present(alertController, animated: true, completion: nil)
  }
  
  public func presentCallAlertWith(phone:String) {
    
    let controller = UIAlertController(title: "Call \(phone)", message: nil, preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    let callAction = UIAlertAction(title: "Call", style: .default) { _ in
      guard let url = URL(string: "tel:\(phone)") else {return}
      NotificationCenter.default.post(name: .erNiftyOpenCallNotification, object: url)      
    }
    controller.addAction(cancelAction)
    controller.addAction(callAction)
    self.present(controller, animated: true, completion: nil)
  }
}
