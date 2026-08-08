/*
 * InfrawrenchSDK v1.0.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.0.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// One place a matched alert goes. `push` reaches the organization's phones,
/// still filtered by each member's own mutes — an organization rule decides
/// whether the org is told, a member decides whether their phone rings.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum AlertDestination: Codable, Hashable, Sendable {
    public struct AlertDestinationObject: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case push
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "push": self = .push
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .push: return "push"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .push,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind

        public init(
            kind: Kind
        ) {
            self.kind = kind
        }
    }

    public struct AlertDestinationObject2: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case slack
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "slack": self = .slack
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .slack: return "slack"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .slack,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        /// A slack_channels row id from /slack/status
        public var channelId: String

        public init(
            kind: Kind,
            channelId: String
        ) {
            self.kind = kind
            self.channelId = channelId
        }
    }

    public struct AlertDestinationObject3: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case msteams
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "msteams": self = .msteams
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .msteams: return "msteams"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .msteams,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        /// An msteams webhook id from /msteams/status
        public var webhookId: String

        public init(
            kind: Kind,
            webhookId: String
        ) {
            self.kind = kind
            self.webhookId = webhookId
        }
    }

    case object(AlertDestinationObject)
    case object2(AlertDestinationObject2)
    case object3(AlertDestinationObject3)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(AlertDestinationObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(AlertDestinationObject2.self) {
            self = .object2(value)
            return
        }
        if let value = try? container.decode(AlertDestinationObject3.self) {
            self = .object3(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .object3(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
