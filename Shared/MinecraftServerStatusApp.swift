//
//  Minecraft_Server_StatusApp.swift
//  Shared
//
//  Created by Gregory Wainer on 5/16/22.
//

import SwiftUI

@main
struct MinecraftServerStatusApp: App {
    var body: some Scene {
        WindowGroup {
            TabViewController();
        }
        #if os(macOS)
        Settings {
            SettingsMacView()
        }
        #endif
    }
}
