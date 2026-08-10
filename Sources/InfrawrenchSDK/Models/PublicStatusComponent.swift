/*
 * InfrawrenchSDK v1.4.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.4.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PublicStatusComponent: Codable, Hashable, Sendable {
    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case operational
        case degraded
        case down
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "operational": self = .operational
            case "degraded": self = .degraded
            case "down": self = .down
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .operational: return "operational"
            case .degraded: return "degraded"
            case .down: return "down"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [State] = [
            .operational,
            .degraded,
            .down,
            .unknown,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Stable per page. Deliberately not the probe id.
    public var id: String
    public var name: String
    public var groupName: String?
    /// A component's public state. A paused probe reads `unknown` regardless of
    /// its last result — the page is a claim about what is being checked now.
    public var state: State
    public var uptime24h: Double?
    /// Oldest first; empty when history is hidden.
    public var history: [StatusHistoryDay]

    public init(
        id: String,
        name: String,
        groupName: String? = nil,
        state: State,
        uptime24h: Double? = nil,
        history: [StatusHistoryDay]
    ) {
        self.id = id
        self.name = name
        self.groupName = groupName
        self.state = state
        self.uptime24h = uptime24h
        self.history = history
    }
}
