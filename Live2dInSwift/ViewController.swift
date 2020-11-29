//
//  ViewController.swift
//  Live2dInSwift
//
//  Created by 高杉君 on 2020/11/28.
//  Copyright © 2020 高杉君. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let live2d = Live2dMethod()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.live2d.initLive2d(self.view)
        
        let pinchGestureRecognizer: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.live2d.onPitch(_:)))
        self.view.addGestureRecognizer(pinchGestureRecognizer)
    }

}

