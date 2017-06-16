//
//  Bash.swift
//  Sherlock
//
//  Created by Andrii Liakh on 6/16/17.
//  Copyright © 2017 Twopeople Software LLC. All rights reserved.
//

import Foundation

func shell(launchPath: String, arguments: [String]) -> String
{
    let task = Process()
    task.launchPath = launchPath
    task.arguments = arguments
    
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: String.Encoding.utf8)!
    if output.characters.count > 0 {
        //remove newline character.
        let lastIndex = output.index(before: output.endIndex)
        return output[output.startIndex ..< lastIndex]
    }
    return output
}

func bash(command: String, arguments: [String]) -> String {
    let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
    return shell(launchPath: whichPathForCommand, arguments: arguments)
}
