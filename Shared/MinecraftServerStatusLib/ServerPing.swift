//
//  ServerPing.swift
//  Minecraft Server Status
//
//  Created by Gregory Wainer on 5/17/22.
//

import Foundation
import SwiftSocket

protocol Handshake {
    var protocol_type: ProtocolType { get set }
    var Protocol_Version: Int64 { get set }
    var Server_Address: String { get set }
    var Server_Port: UInt16 { get set }
    var Next_State: Int { get set }
}

protocol Response {
    var version: VersionRaw { get set }
    // TODO: turn this into a rich text type
    var motd: String { get set }
    /// The server icon (a Base64-encoded PNG image).
    var favicon: String? { get set }
}

protocol Ping {
    var Payload: Int64 { get set }
}

public struct GetResponse{
    public var protocol_type: ProtocolType
    public var latency: UInt64
    public var version: VersionRaw
    public var motd: String
    public var favicon: String?
}

public struct ServerPing {
    let client = TCPClient(address: "www.apple.com", port: 80)
    switch client.connect(timeout: 1) {
      case .success:
        switch client.send(string: "GET / HTTP/1.0\n\n" ) {
          case .success:
            guard let data = client.read(1024*10) else { return }

            if let response = String(bytes: data, encoding: .utf8) {
              print(response)
            }
          case .failure(let error):
            print(error)
        }
      case .failure(let error):
        print(error)
    }
}
