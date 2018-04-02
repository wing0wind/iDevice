//
//  ViewController.swift
//  iDevice
//
//  Created by wing0wind@gmail.com on 04/02/2018.
//  Copyright (c) 2018 wing0wind@gmail.com. All rights reserved.
//

import UIKit
import iDevice

class ViewController: UIViewController {
    
    
    @IBOutlet weak var deviceInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deviceInfoLabel.text = iDevice.deviceType().name()
    }

}

