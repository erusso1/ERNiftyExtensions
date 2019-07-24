//
//  UIColor+Nifty.swift
//  Pods
//
//  Created by Ephraim Russo on 7/11/17.
//
//

import UIKit

public enum UIColorGradientStyle: Int {
  
  case leftToRight, radial, topToBottom, diagonal
}

extension UIColor {
  
  public class func withHex(_ hex: String, alpha: CGFloat) -> UIColor {
    
    //-----------------------------------------
    // Convert hex string to an integer
    //-----------------------------------------
    var hexInt:UInt32 = 0;
    
    // Create scanner
    let scanner = Scanner(string: hex)
    
    // Tell scanner to skip the # character
    scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
    scanner.scanHexInt32(&hexInt)
    
    //-----------------------------------------
    // Create color object, specifying alpha
    //-----------------------------------------
    let color = UIColor(red: CGFloat((hexInt & 0xFF0000) >> 16)/255, green: CGFloat((hexInt & 0xFF00) >> 8)/255, blue: CGFloat(hexInt & 0xFF)/255, alpha: alpha)
    
    return color;
  }
  
  public convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1) {
    self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
  }
  
  public class func gradient(style: UIColorGradientStyle, frame: CGRect, colors: [UIColor]) -> UIColor {
    
    guard !colors.isEmpty else { return .white }
    
    let backgroundGradientLayer = CAGradientLayer()
    backgroundGradientLayer.frame = frame
    
    let cgColors = colors.map { $0.cgColor }
    
    switch style {

    case .leftToRight:

      backgroundGradientLayer.colors = cgColors
      backgroundGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
      backgroundGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
      
      UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size, false, UIScreen.main.scale)
      backgroundGradientLayer.render(in: UIGraphicsGetCurrentContext()!)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      
      return UIColor(patternImage: image!)
      
    case .radial:
      
      UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)
      
      var locations: [CGFloat] = {
        
        var tmp: [CGFloat] = []
        
        for i in 0..<colors.count {
          
          switch i {
            
          case 0: tmp.append(0.0)
          case colors.count-1: tmp.append(1.0)
          default:
            let step = min(1.0, CGFloat(i+1)/CGFloat(colors.count))
            tmp.append(step)
          }
        }

        return tmp

      }()
      
      let colorSpace = CGColorSpaceCreateDeviceRGB()
      let gradient = CGGradient(colorsSpace: colorSpace, colors: cgColors as CFArray, locations: locations)
      
      let center = CGPoint(x: 0.5 * frame.width, y: 0.5 * frame.height)

      let radius = min(frame.width, frame.height) * 0.5
      
      UIGraphicsGetCurrentContext()?.drawRadialGradient(gradient!, startCenter: center, startRadius: 0, endCenter: center, endRadius: radius, options: .drawsAfterEndLocation)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      
      return UIColor(patternImage: image!)

    case .diagonal:
      
      backgroundGradientLayer.colors = cgColors
      backgroundGradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
      backgroundGradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
      
      UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size, false, UIScreen.main.scale)
      backgroundGradientLayer.render(in: UIGraphicsGetCurrentContext()!)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()

      return UIColor(patternImage: image!)
      
    case .topToBottom:
      
      backgroundGradientLayer.colors = cgColors
      
      UIGraphicsBeginImageContextWithOptions(backgroundGradientLayer.bounds.size, false, UIScreen.main.scale)
      backgroundGradientLayer.render(in: UIGraphicsGetCurrentContext()!)
      let image = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      
      return UIColor(patternImage: image!)
    }
  }
}

