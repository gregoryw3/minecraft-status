//
//  ServerHeader.swift
//  Minecraft Server Status
//
//  Created by Gregory Wainer on 5/17/22.
//

import Foundation

/**
 * The various protocol types that can be used for a ping.
 */
public enum ProtocolType : Int {
    /**
     * Ping using the Java protocol only.
     */
    case java = 0
    /**
     * Ping using the Bedrock protocol only.
     */
    case bedrock = 1
    /**
     * Ping using all protocols, returning the first successful ping result.
     */
    case auto = 2
}

/**
 * Information about the server's version
 */
public struct VersionRaw {
    /**
     * The name of the version the server is running
     *
     * In practice this comes in a large variety of different formats.
     */
    public var name : String
    /**
     * See https://wiki.vg/Protocol_version_numbers
     */
    public var MCServerProtocol : Int64
}

struct PlayerRaw {
    /**
     * The player's name
     */
    var name: String
    /**
     * The player's UUID
     */
    var id: String
}

public struct PlayersRaw {
    var max: Int64
    var online: Int64
    /**
     * A preview of which players are online
     *
     * In practice servers often don't send this or use it for more advertising.
     * This will be a null pointer if not present.
     */
    var sample: PlayerRaw?
    var sample_len: UInt
}

/**
 * The server's favicon image.
 */
enum FaviconRaw_Tag : Int {
    /**
     * The server provided a favicon.
     */
    case ServerProvided
    /**
     * We generated a favicon because the server didn't provide one.
     */
    case Generated
    /**
     * There is no favicon image.
     */
    case NoFavicon
}

struct FaviconRaw {
    var tag: FaviconRaw_Tag?
    enum favicon {
        struct provided_server {
            var server_provided : String?
        }
        struct generated_server {
            var server_generated : String?
        }
    }
}

/**
 * The server status response
 */
struct McInfoRaw {
    /**
     * The protocol type of the successful ping.
     */
    var protocol_type: ProtocolType
    /**
     * Latency to the server
     */
    var latency: UInt64
    var version: VersionRaw
    /**
     * Information about online players
     */
    var players: PlayersRaw
    /**
     * The server's description text
     */
    var description: String
    /**
     * The server's favicon.
     */
    var favicon: FaviconRaw
}

/**
 * Stats representing some range of time.
 */
struct RangeStats {
    /**
     * The average number of players online during this period.
     */
    var average_online: Int64
    /**
     * The peak number of online players during this period.
     */
    var peak_online: Int64
    /**
     * The peak max allowed online players during this period.
     */
    var peak_max: Int64
}

struct WeekStats {
    /**
     * Stats for the last eight days.
     */
    var daily_stats: [RangeStats] = Array(repeating: RangeStats(average_online: 0, peak_online: 0, peak_max: 0), count: 8)
    /**
     * The peak number of online players during this period.
     */
    var peak_online: Int64
    /**
     * The peak max allowed online players during this period.
     */
    var peak_max: Int64
}

struct OnlineResponse {
    /**
     * The data obtained from the server's ping response.
     */
    var mcinfo: McInfoRaw
    /**
     * Statistics about the server over the past week or so.
     */
    var week_stats: WeekStats
}

struct OfflineResponse {
    /**
     * The server's favicon (a cached copy or generated favicon).
     */
    var favicon: FaviconRaw
    /**
     * Statistics about the server over the past week or so.
     */
    var week_stats: WeekStats
}

struct UnreachableResponse {
    /**
     * An error string describing why the server wasn't reachable.
     */
    var error_string: String?
}

/**
 * The overall status response.
 */
enum ServerStatus_Tag {
    /**
     * The server was online and we got a valid ping response.
     */
    case Online
    /**
     * The server was offline and couldn't be reached, but we've been able to
     * get a valid response from it before.
     *
     * This struct contains cached data.
     */
    case Offline
    /**
     * The server was offline and couldn't be reached, and we've never gotten
     * a response from it previously.
     *
     * This struct contains an error message string and also ends up being a
     * bit of a catch-all for any errors that can occur. In the future it could
     * be nice to break this up into finer-grained variants (one for a legit
     * error and one for the common case of an invalid server address).
     */
    case Unreachable
}

struct ServerStatus {
    var tag: ServerStatus_Tag
    enum Status {
        struct Online {
            var online: OnlineResponse
        }
        struct Offline {
            var offline: OfflineResponse
        }
        struct Unreachable {
            var unreachable: UnreachableResponse
        }
    }
}

/**
 * Ping a Minecraft server at the given `address`, working with data stored in
 * the given `app_group_container`.
 *
 * # Safety
 *
 * The provided pointers must point to valid cstrings.
 */
func get_server_status(
    _ address: String?,
    _ protocol_type: ProtocolType,
    _ always_use_identicon: Bool,
    _ app_group_container: String?
) -> ServerStatus {
    if () {
        return ServerStatus(tag: .Online)
    }
}
