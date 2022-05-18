//
//  JavaPing.swift
//  Minecraft Server Status
//
//  Created by Gregory Wainer on 5/17/22.
//

import Foundation

public protocol Java {
    var server_address: String { get set }
    var timeout: Timer? { get set }
}

public struct Pingable: Java {
    public var server_address: String
    public var timeout: Timer?
    
    typealias Response = JavaResponse
}

public struct JavaResponse {
    public var version: VersionRaw
    public var players: PlayersRaw
    public var description: Chat
    public var favicon: String?
}

public struct Version {
    public var name: String
    public var ServerProtocol: Int64
}

public struct Player {
    public var name: String
    public var id: String
}

public struct Players {
    public var max: Int64
    public var online: Int64
    public var sample: [Player]? = [Player]()
}

public protocol Chat {
    var text: String { get set }
    var String: String { get set }
}

public struct StringChat: Chat {
    public var text: String
    public var String: String
    
    public func toText() -> String {
        return text + " " + String
    }
}
