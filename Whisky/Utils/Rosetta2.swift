//
//  Rosetta2.swift
//  Whisky
//
//  This file is part of Whisky.
//
//  Whisky is free software: you can redistribute it and/or modify it under the terms
//  of the GNU General Public License as published by the Free Software Foundation,
//  either version 3 of the License, or (at your option) any later version.
//
//  Whisky is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
//  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
//  See the GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License along with Whisky.
//  If not, see https://www.gnu.org/licenses/.
//

import Foundation

class Rosetta2 {
    static let rosetta2RuntimeBin = "/Library/Apple/usr/libexec/oah/libRosettaRuntime"

    static let isRosettaInstalled: Bool = {
        return FileManager.default.fileExists(atPath: rosetta2RuntimeBin)
    }()

    static func launchRosettaInstaller() {
        let task = Process()
        task.launchPath = "/usr/sbin/softwareupdate"
        task.arguments = ["--install-rosetta"]
        do {
            try task.run()
        } catch {
            NSLog("Failed to install Rosetta 2: \(error)")
        }
    }
}
