//
//  Toast.swift
//  ToastView
//
//  Created by Viktor Olesenko on 4/03/17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

class Toast: UITextView {
    
    convenience init(_ toastText: String) {
        self.init()
        
        self.text                = toastText
        self.textAlignment       = .center
        self.isEditable          = false
        self.layer.masksToBounds = true
        self.layer.cornerRadius  = 10
        self.textColor           = UIColor.white
        self.font                = UIFont.systemFont(ofSize: 14)
        self.backgroundColor     = UIColor.darkGray
    }
    
    func show() { self.alpha = 1 }
    func hide() { self.alpha = 0 }
}

private let kDefaultAnimationSpeed: Double = 0.35

extension UIViewController {
    
    /// Present popup toast with text and hid it after defined time
    ///
    /// - Parameters:
    ///   - toast: The Toast object (subclass of UITextView) with text & display properties to display over the current view content
    ///   - topOffset: offset from screen top to toast top. Default position is center of view
    ///   - timeInterval: time, after whicn toast will be hidden
    ///   - animated: Pass YES to animate the presentation; otherwise, pass NO.
    ///   - completion: The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
    func present(toast: Toast, topOffset: CGFloat? = nil, timeInterval: Double = 2, animated: Bool, completion: (() -> Void)? = nil) {
        
        let sideOffset: CGFloat = 20
        toast.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width - sideOffset, height: self.view.bounds.height - sideOffset) // Define max size with side offsets
        toast.sizeToFit() // Compress toast
        
        // Calculate toast position
        toast.center = self.view.center
        if let topOffset = topOffset {
            var currentFrame = toast.frame
            currentFrame.origin.y = topOffset
            toast.frame = currentFrame
        }
        
        self.view.addSubview(toast)
        
        let animationSpeed: Double = animated ? kDefaultAnimationSpeed : 0
        
        toast.hide()
        UIView.animate(withDuration: animationSpeed, animations: {
            toast.show()
        }, completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval, execute: {
                UIView.animate(withDuration: animationSpeed, animations: {
                    toast.hide()
                }, completion: { _ in
                    toast.removeFromSuperview()
                    completion?()
                })
            })
        })
    }
}
