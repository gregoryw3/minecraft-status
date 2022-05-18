//
//  identicon.swift
//  Minecraft Server Status
//
//  Created by Gregory Wainer on 5/17/22.
//

import Foundation
import SwiftUI

public struct IdenticonInput: Hashable {
    public var protocol_type: ProtocolType = ProtocolType.auto
    public var address: String = ""
    
    func make_string() -> String {
        return ("{ \(self.protocol_type):?}{\(self.address)}")
    }
}


public func make_base64_identicon(input: IdenticonInput) -> String? {
    let identicon: Identicon = new Identicon(input.make_string()) new(input.make_string(): input_value)
}
