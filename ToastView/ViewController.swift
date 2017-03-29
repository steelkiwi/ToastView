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
        Toast.show(container: view, text: "Toast text")
    }
}
