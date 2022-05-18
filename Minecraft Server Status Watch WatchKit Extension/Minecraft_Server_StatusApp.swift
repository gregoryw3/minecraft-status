//
//  Minecraft_Server_StatusApp.swift
//  Minecraft Server Status Watch WatchKit Extension
//
//  Created by Gregory Wainer on 5/16/22.
//

import SwiftUI

@main
struct Minecraft_Server_StatusApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
