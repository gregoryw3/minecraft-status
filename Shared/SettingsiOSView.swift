//
//  SettingsiOSView.swift
//  Minecraft Server Status (iOS)
//
//  Created by Gregory Wainer on 5/16/22.
//

// UI design inspired by https://github.com/AnderGoig/github-contributions-ios
import SwiftUI

struct SettingsiOSView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(headerRows) { item in
                        Button(action: { item.action.performAction() }) {
                            SettingsRow(item: item)
                        }
                    }
                }

                Section(footer: footer) {
                    ForEach(footerRows) { item in
                        Button(action: { item.action.performAction() }) {
                            SettingsRow(item: item)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Minecraft Status", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    var footer: some View {
        let appVersionString: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        return Text(appVersionString)
    }
}

struct SettingsRow: View {
    let item: SettingsRowItem

    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            item.imageName.imageForName()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 17.0, height: 17.0)
                .padding(6.0)
                .background(item.color)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 6.0, style: .continuous))

            VStack(alignment: .leading, spacing: 3.0) {
                Text(item.title)
                    .font(.body)
                    .foregroundColor(.primary)
                    .lineLimit(1)

                Text(item.subtitle)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 5.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsiOSView()
    }
}

enum SettingsRowItemAction {
    case openUrl(URL)
    case shareUrl(URL)

    func performAction() {
        switch self {
        case let .openUrl(url):
            UIApplication.shared.open(url)
        case let .shareUrl(url):
            shareButton(shareURL: url)
        }
    }
}

enum ImageName {
    case system(String)
    case asset(String)

    func imageForName() -> Image {
        switch self {
        case let .system(name):
            return Image(systemName: name)
        case let .asset(name):
            return Image(name)
        }
    }
}

func shareButton(shareURL: URL) {
    ShareSheetView(activityItems: [shareURL])
}

func widgetHelpURL() -> URL {
    switch UIDevice.current.userInterfaceIdiom {
    case .pad:
        // Link to iPad widget help article
        return URL(string: "https://support.apple.com/en-us/HT211328")!
    default:
        // Link to iPhone widget help article
        return URL(string: "https://support.apple.com/en-us/HT207122")!
    }
}

/// The data for a settings row item.
struct SettingsRowItem: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var imageName: ImageName
    var color: Color
    var action: SettingsRowItemAction
}

let headerRows = [
    SettingsRowItem(title: "Widget Setup", subtitle: "Learn how to use widgets", imageName: .system("questionmark"), color: .blue, action: .openUrl(widgetHelpURL())),
]

let footerRows = [
    SettingsRowItem(title: "(Coming Soon) Rate the App", subtitle: "Reviews are greatly appreciated!", imageName: .system("star.fill"), color: Color(#colorLiteral(red: 0.9882352941, green: 0.7607843137, blue: 0, alpha: 1)), action: .openUrl(URL(string: // "itms-apps://apps.apple.com/app/id1549596839?action=write-review"
        "https://www.gregoryw3.com")!)),
    SettingsRowItem(title: "(Coming Soon) Share", subtitle: "Tell your friends!", imageName: .system("square.and.arrow.up"), color: .green, action: .shareUrl(URL(string: "https://www.gregoryw3.com")!)),
    SettingsRowItem(title: "Open Source (Github)", subtitle: "Contribute and file issues", imageName: .system("swift"), color: .orange, action: .openUrl(URL(string: "https://github.com/gregoryw3/minecraft-status")!)),
    SettingsRowItem(title: "(Coming Soon) @placeholder", subtitle: "Follow me on Twitter for updates", imageName: .asset("twitterLogoWhite"), color: Color("twitterBlue"), action: .openUrl(URL(string: "https://www.gregoryw3.com")!)),
    SettingsRowItem(title: "Contributers", subtitle: "Click to View", imageName: .system("plus.circle"), color: .purple, action: .openUrl(URL(string: "https://github.com/gregoryw3/minecraft-status")!)),
    SettingsRowItem(title: "Tip Jar", subtitle: "Click to View", imageName: .system("heart.fill"), color: .red, action: .openUrl(URL(string: "https://github.com/gregoryw3/minecraft-status")!)),
]
