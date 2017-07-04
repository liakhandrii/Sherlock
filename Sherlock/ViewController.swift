//
//  ViewController.swift
//  Sherlock
//
//  Created by Andrii Liakh on 6/16/17.
//  Copyright © 2017 Twopeople Software LLC. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var comboBox: NSComboBox!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        comboBox.selectItem(at: 0)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func showPressed(_ sender: Any) {
        if comboBox.indexOfSelectedItem == 0 {
            showHiddenFiles(true)
        } else {
            showDesktopIcons(true)
        }
    }

    @IBAction func hideTapped(_ sender: Any) {
        if comboBox.indexOfSelectedItem == 0 {
            showHiddenFiles(false)
        } else {
            showDesktopIcons(false)
        }
    }
    
    func showHiddenFiles(_ show: Bool) {
        _ = bash(command: "defaults", arguments: ["write", "com.apple.finder", "AppleShowAllFiles", "\(show)"])
        _ = bash(command: "killall", arguments: ["Finder"])
    }

    func showDesktopIcons(_ show: Bool) {
        _ = bash(command: "defaults", arguments: ["write", "com.apple.finder", "CreateDesktop", "\(show)"])
        _ = bash(command: "killall", arguments: ["Finder"])
    }
}

