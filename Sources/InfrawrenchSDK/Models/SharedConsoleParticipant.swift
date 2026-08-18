/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SharedConsoleParticipant: Codable, Hashable, Sendable {
    public enum Role2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case observer
        case driver
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "observer": self = .observer
            case "driver": self = .driver
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .observer: return "observer"
            case .driver: return "driver"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Role2] = [
            .observer,
            .driver,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case joined
        case left
        case removed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "joined": self = .joined
            case "left": self = .left
            case "removed": self = .removed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .joined: return "joined"
            case .left: return "left"
            case .removed: return "removed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .joined,
            .left,
            .removed,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var id: String
    public var userId: String
    /// Display-name snapshot taken when they joined.
    public var userName: String?
    /// `driver` holds the keyboard; `observer` sees the terminal and cannot type
    /// into it. Exactly one participant per console is a driver at any moment,
    /// enforced by a partial unique index rather than by the application — two
    /// simultaneous handovers cannot both win.
    public var role: Role2
    /// `left` walked away and may resume on the same row without a new invite;
    /// `removed` was ejected or lost the permission mid-session and needs a fresh
    /// one.
    public var status: Status
    /// Set when this participant has asked for the keyboard and nobody has
    /// answered yet. Asking grants nothing — only the current driver or the
    /// sharer can move it.
    public var driverRequestedAt: String?
    public var joinedAt: String

    public init(
        id: String,
        userId: String,
        userName: String? = nil,
        role: Role2,
        status: Status,
        driverRequestedAt: String? = nil,
        joinedAt: String
    ) {
        self.id = id
        self.userId = userId
        self.userName = userName
        self.role = role
        self.status = status
        self.driverRequestedAt = driverRequestedAt
        self.joinedAt = joinedAt
    }
}
