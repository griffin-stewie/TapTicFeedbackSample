//
//  ViewController.swift
//  TapTicFeedbackSample
//
//  Created by griffin-stewie on 2016/09/16.
//  Copyright © 2016年 cyan-stivy.net. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    let log = OSLog(subsystem: "net.cyan-stivy.TapTicFeedbackSample", category: "UI")
    let generator = UINotificationFeedbackGenerator()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func notificationFeedbackAction(_ sender: UIButton) {
        guard let type = UINotificationFeedbackType(rawValue: sender.tag) else {
            fatalError("Can not convert tag to UINotificationFeedbackType")
        }

        os_log("UINotificationFeedbackType: %lu", log: log, type: .debug, type.rawValue)

        generator.notificationOccurred(type)
    }

    @IBAction func impactFeedbackAction(_ sender: UIButton) {
        guard let style = UIImpactFeedbackStyle(rawValue: sender.tag) else {
            fatalError("Can not convert tag to UIImpactFeedbackStyle")
        }

        os_log("UIImpactFeedbackStyle: %lu", log: log, type: .debug, style.rawValue)

        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

