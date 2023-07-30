//
//  ColorExtencion.swift
//  Navigation
//
//  Created by ln on 26.06.2023.
//

import UIKit

struct Palette {
    
    static var viewBackgroundColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return UIColor.black
                } else {
                    return UIColor.white
                }
            })
        } else {
            return UIColor.white
        }
    }()
    
    static var tintBackgroundColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return UIColor.purple
                } else {
                    return UIColor.black
                }
            })
        } else {
            return UIColor.black
        }
    }()
        
        static var subTintBackgroundColor: UIColor = {
            if #available(iOS 13.0, *) {
                return UIColor(dynamicProvider: { (traitCollection: UITraitCollection) -> UIColor in
                    if traitCollection.userInterfaceStyle == .dark {
                        return UIColor.purple
                    } else {
                        return UIColor.gray
                    }
                })
            } else {
                return UIColor.gray
            }
    }()
    
    static var buttonBackgroundColor: UIColor = {
        if #available(iOS 13.0, *) {
            return UIColor(dynamicProvider: { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return UIColor.purple
                } else {
                    return UIColor.systemBlue
                }
            })
        } else {
            return UIColor.systemBlue
        }
    }()
    
}
