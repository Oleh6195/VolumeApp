//
//  AppDelegate.swift
//  MicVolume
//
//  Created by Олег on 7/1/19.
//  Copyright © 2019 OlehTyzhai. All rights reserved.
//

import Cocoa
import Foundation


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var start: NSMenuItem!
    @IBOutlet weak var stop: NSMenuItem!
    var timer = Timer()
    let source = """
set volume input volume 100
"""
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    @IBOutlet weak var statusMenu: NSMenu!
    @IBAction func quitClicked(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    @IBAction func startClicked(_ sender: Any) {
        statusItem.button?.image = NSImage(named: "mic_active")
        statusItem.button?.image = NSImage(named: "mic_active")
        start.state = NSControl.StateValue.on
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(f), userInfo: nil, repeats: true)


    }
    
    @IBAction func stopClicked(_ sender: Any) {
        start.state = NSControl.StateValue.off;      timer.invalidate()
        statusItem.button?.image = NSImage(named: "mc")
        statusItem.button?.image = NSImage(named: "mc")
    }
    

    @objc func f(){
        let script = NSAppleScript(source: source)!
        var possibleError: NSDictionary? = NSDictionary()
        script.executeAndReturnError(&possibleError)
        if let error = possibleError {
            print("ERROR: \(error)")
        }
    }


    func applicationDidFinishLaunching(_ aNotification: Notification) {

        statusItem.button?.image = NSImage(named: "mc")
        statusItem.button?.image = NSImage(named: "mc")
        statusItem.menu = statusMenu
    

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

