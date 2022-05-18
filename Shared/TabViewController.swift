//
//  TabViewController.swift
//  Minecraft Server Status
//
//  Created by Gregory Wainer on 5/16/22.
//

import SwiftUI

struct TabViewController: View {
    var body: some View {
        TabView {
    #if os(iOS)
            PopularView()
                .tabItem {
                    Label("Popular", systemImage: "arrow.up.circle")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.circle")
                }
            UserServers()
                .tabItem {
                    Label("My Servers", systemImage: "server.rack")
                }
            SettingsiOSView()
                .tabItem {
                    Label("Settings", systemImage: "info.circle")
                }
    #elseif os(macOS)
            PopularView()
                .tabItem {
                    Text("Popular")
                }
            FavoritesView()
                .tabItem {
                    Text("Favorites")
                }
            UserServers()
                .tabItem {
                    Text("My Servers")
                }
    #else
            println("OMG, it's that mythical new Apple product!!!")
    #endif
            
        }
    }
}

struct TabViewController_Previews: PreviewProvider {
    static var previews: some View {
        TabViewController()
            .padding(.all, 5.0)
    }
}
