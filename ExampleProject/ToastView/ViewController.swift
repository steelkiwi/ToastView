//
//  ViewController.swift
//  ToastView
//
//  Created by Igor Prysyazhnyuk on 3/29/17.
//  Copyright © 2017 Steelkiwi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.present(toast: Toast("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tristique maximus volutpat. Morbi vel dolor nec risus gravida malesuada non et lacus."), animated: true)
    }
    
    @IBAction private func onShowToast() {
        self.present(toast: Toast("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tristique maximus volutpat. Morbi vel dolor nec risus gravida malesuada non et lacus."), topOffset: 100.0, timeInterval: 3, animated: true, completion: nil)
    }
}
