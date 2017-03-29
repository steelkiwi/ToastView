//
//  Toast.swift
//  Khabar
//
//  Created by Igor Prysyazhnyuk on 1/27/17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

class Toast: UIView {
    @IBOutlet weak var label: UILabel!
    var text: String? {
        get { return label.text }
        set { label.text = newValue }
    }
    
    private let animationDuration = 0.5
    private var hideToastTimer: Timer?
    private var completion: (() -> ())?
    private var timeInterval: Double = 2
    private var verticalOffset = UIScreen.main.bounds.height / 3
    
    static func show(container: UIView,
                     text: String,
                     timeInterval: Double = 2,
                     verticalOffset: CGFloat? = nil,
                     completion: (() -> ())? = nil) {
        let toast: Toast = UIView.createFromXib()
        toast.setData(text: text, timeInterval: timeInterval, verticalOffset: verticalOffset, completion: completion)
        toast.addConstraints(container: container)
        toast.show()
    }
    
    private func setData(text: String,
                         timeInterval: Double,
                         verticalOffset: CGFloat? = nil,
                         completion: (() -> ())? = nil) {
        self.text = text
        self.timeInterval = timeInterval
        if let verticalOffset = verticalOffset { self.verticalOffset = verticalOffset }
        self.completion = completion
    }
    
    private func show() {
        alpha = 0
        UIView.animate(withDuration: animationDuration, animations: {
            self.alpha = 1
        })
        hideToastTimer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(hideTimerAction), userInfo: nil, repeats: false)
    }
    
    @objc private func hideTimerAction() {
        UIView.animate(withDuration: animationDuration, animations: {
            self.alpha = 0
        }, completion: { completed in
            self.removeFromSuperview()
            self.completion?()
        })
    }
    
    private func addConstraints(container: UIView) {
        container.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = NSLayoutConstraint(item: self,
                                                      attribute: NSLayoutAttribute.centerX,
                                                      relatedBy: NSLayoutRelation.equal,
                                                      toItem: container,
                                                      attribute: NSLayoutAttribute.centerX,
                                                      multiplier: 1,
                                                      constant: 0)
        container.addConstraint(horizontalConstraint)
        
        let horizontalMargin: CGFloat = 8
        let leadingConstraint = NSLayoutConstraint(item: self,
                                                   attribute: NSLayoutAttribute.leading,
                                                   relatedBy: NSLayoutRelation.greaterThanOrEqual,
                                                   toItem: container,
                                                   attribute: NSLayoutAttribute.leading,
                                                   multiplier: 1,
                                                   constant: horizontalMargin)
        container.addConstraint(leadingConstraint)
        
        let trailingConstraint = NSLayoutConstraint(item: self,
                                                    attribute: NSLayoutAttribute.trailing,
                                                    relatedBy: NSLayoutRelation.lessThanOrEqual,
                                                    toItem: container,
                                                    attribute: NSLayoutAttribute.trailing,
                                                    multiplier: 1,
                                                    constant: horizontalMargin)
        container.addConstraint(trailingConstraint)
        
        let verticalConstraint = NSLayoutConstraint(item: self,
                                                    attribute: NSLayoutAttribute.bottom,
                                                    relatedBy: NSLayoutRelation.equal,
                                                    toItem: container,
                                                    attribute: NSLayoutAttribute.bottom,
                                                    multiplier: 1,
                                                    constant: -verticalOffset)
        container.addConstraint(verticalConstraint)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        round()
    }
    
    private func round() {
        layer.cornerRadius = frame.height / 2
    }
}
