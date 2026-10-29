/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum AgentLinkPoll: Codable, Hashable, Sendable {
    public struct AgentLinkPollObject: Codable, Hashable, Sendable {
        public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case pending
            case denied
            case expired
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "pending": self = .pending
                case "denied": self = .denied
                case "expired": self = .expired
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .pending: return "pending"
                case .denied: return "denied"
                case .expired: return "expired"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Status] = [
                .pending,
                .denied,
                .expired,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var status: Status

        public init(
            status: Status
        ) {
            self.status = status
        }
    }

    public struct AgentLinkPollObject2: Codable, Hashable, Sendable {
        public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case approved
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "approved": self = .approved
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .approved: return "approved"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Status] = [
                .approved,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var status: Status
        /// `iwl_` link credential. Returned exactly once; later polls read
        /// `expired`.
        public var credential: String
        public var link: AgentLinkInfo

        public init(
            status: Status,
            credential: String,
            link: AgentLinkInfo
        ) {
            self.status = status
            self.credential = credential
            self.link = link
        }
    }

    case object(AgentLinkPollObject)
    case object2(AgentLinkPollObject2)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(AgentLinkPollObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(AgentLinkPollObject2.self) {
            self = .object2(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
