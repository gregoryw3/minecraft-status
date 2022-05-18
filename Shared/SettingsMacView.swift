//
//  SettingsMacView.swift
//  Minecraft Server Status (macOS)
//
//  Created by Gregory Wainer on 5/16/22.
//

import SwiftUI

struct SettingsMacView: View {
    private enum Tabs: Hashable {
        case general, info
    }
    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .tag(Tabs.general)
            InfoSettingsView()
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
                .tag(Tabs.info)
        }
        .padding(20)
        .frame(width: 375, height: 500)
    }
}

struct GeneralSettingsView: View {
    @AppStorage("showPreview") private var showPreview = true
    @AppStorage("fontSize") private var fontSize = 12.0

    var body: some View {
        Form {
            Toggle("Show Previews", isOn: $showPreview)
            Slider(value: $fontSize, in: 9...96) {
                Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
            }
        }
        .padding(20)
        .frame(width: 350, height: 100)
    }
}

struct InfoSettingsView: View {
    var body: some View {
        VStack {
            //imageName "questionmark"
            Link("MacOS Widget Help",
                 destination: URL(string: "https://support.apple.com/en-us/HT211789")!).navigationSubtitle("Learn how to use widgets")
            //"star.fill" .yellow
            Link("(Coming Soon) Rate the App",
                  destination: URL(string: // "itms-apps://apps.apple.com/app/id1549596839?action=write-review"
                                   "https://www.gregoryw3.com")!).navigationSubtitle("Reviews are greatly appreciated!")
            //"square.and.arrow.up" .green
            Link("(Coming Soon) Share",
                 destination: URL(string: "https://www.gregoryw3.com")!).navigationSubtitle("Tell your friends")
            //"swift" .orange
            Link("Open Source (Github)",
                 destination: URL(string: "https://github.com/gregoryw3/minecraft-status")!).navigationSubtitle("Contribute and file issues")
            //"twitterLogoWhite" "twitterBlue"
            Link("(Coming Soon) @placeholder",
                 destination: URL(string: "https://www.gregoryw3.com")!).navigationSubtitle("Follow me on Twitter for updates")
            //"plus.circle" .purple
            Link("Contributers",
                 destination: URL(string: "https://github.com/gregoryw3/minecraft-status")!).navigationSubtitle("Click to View")
            //"heart.fill" .red
            Link("Tip Jar",
                 destination: URL(string: "https://github.com/gregoryw3/minecraft-status")!).navigationSubtitle("Tip Today!")
        }
        .padding(20)
        .frame(width: 350, height: 350)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsMacView()
        }
    }
}
