//
//  ViewController.swift
//  Sherlock
//
//  Created by Andrii Liakh on 6/16/17.
//  Copyright © 2017 Twopeople Software LLC. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func showPressed(_ sender: Any) {
        _ = bash(command: "defaults", arguments: ["write", "com.apple.finder", "AppleShowAllFiles", "TRUE"])
        _ = bash(command: "killall", arguments: ["Finder"])
    }

    @IBAction func hideTapped(_ sender: Any) {
        _ = bash(command: "defaults", arguments: ["write", "com.apple.finder", "AppleShowAllFiles", "FALSE"])
        _ = bash(command: "killall", arguments: ["Finder"])
    }
    
    
}

