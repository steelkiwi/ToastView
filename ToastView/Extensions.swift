//
//  Extensions.swift
//  ToastView
//
//  Created by Igor Prysyazhnyuk on 3/29/17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

extension NSObject {
    static var name: String {
        return String(describing: self)
    }
}

extension UIView {
    static func createFromXib<T: UIView>() -> T {
        return UINib(nibName: T.name, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! T
    }
}
