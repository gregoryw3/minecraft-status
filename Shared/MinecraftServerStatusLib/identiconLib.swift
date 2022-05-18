//
//  identiconLib.swift
//  Minecraft Server Status
//
//  Created by Gregory Wainer on 5/17/22.
//

import Foundation

public struct Identicon {
    var hash: Hasher;
    var border: 50;
    var size: 5;
    var scale: 500;
    var background_color: (240, 240, 240);
}

public struct Identicon(input: String) {
    String
    var newHash = hash
    var newBorder: border
    var newSize: size
    var newScale: scale
    var newBackground_color: background_color
}
