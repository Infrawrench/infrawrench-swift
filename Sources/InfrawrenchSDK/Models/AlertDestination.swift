/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
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
/// still filtered by each member's own mutes; an organization rule decides
/// whether the org is told, a member decides whether their phone rings.
///
/// `on-call` resolves to one person at delivery time, so a rule reading "database
/// alerts → whoever is on call" needs no edit at handover. A rotation that
/// resolves to nobody (disabled, empty, not yet started) contributes nobody and
/// the rule's **other** destinations still deliver: an alert lost to a
/// misconfigured rotation would be the worst outcome the feature could have.
///
/// `github-issues` files the alert's finding as a GitHub issue in the repository
/// the organization's GitHub issue settings route it to (`/github-issues`),
/// commenting on the open issue instead when one already exists for that finding.
/// Only alerts that carry a finding (savings findings, cost anomalies, idle
/// commitments) can be filed; for other triggers this destination is skipped.
///
/// `email-member` and `email-address` send an HTML and plain-text email with a
/// link back into the app and a one-click unsubscribe link. Email carries no
/// acknowledge button, so a rule routed only to email always escalates.
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

    public struct AlertDestinationObject4: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case onCall
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "on-call": self = .onCall
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .onCall: return "on-call"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .onCall,
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
        /// An on-call rotation id from /on-call/schedules
        public var scheduleId: String

        public init(
            kind: Kind,
            scheduleId: String
        ) {
            self.kind = kind
            self.scheduleId = scheduleId
        }
    }

    public struct AlertDestinationObject5: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case githubIssues
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "github-issues": self = .githubIssues
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .githubIssues: return "github-issues"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .githubIssues,
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

    public struct AlertDestinationObject6: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case emailMember
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "email-member": self = .emailMember
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .emailMember: return "email-member"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .emailMember,
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
        /// An organization member's user id (from `members` in this response, or
        /// GET /alert-email). Their current login address is read at send time.
        public var userId: String

        public init(
            kind: Kind,
            userId: String
        ) {
            self.kind = kind
            self.userId = userId
        }
    }

    public struct AlertDestinationObject7: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case emailAddress
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "email-address": self = .emailAddress
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .emailAddress: return "email-address"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .emailAddress,
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
        /// An extra address. Must pass the organization's external-address policy
        /// (GET /alert-email/settings).
        public var address: String

        public init(
            kind: Kind,
            address: String
        ) {
            self.kind = kind
            self.address = address
        }
    }

    case object(AlertDestinationObject)
    case object2(AlertDestinationObject2)
    case object3(AlertDestinationObject3)
    case object4(AlertDestinationObject4)
    case object5(AlertDestinationObject5)
    case object6(AlertDestinationObject6)
    case object7(AlertDestinationObject7)
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
        if let value = try? container.decode(AlertDestinationObject4.self) {
            self = .object4(value)
            return
        }
        if let value = try? container.decode(AlertDestinationObject5.self) {
            self = .object5(value)
            return
        }
        if let value = try? container.decode(AlertDestinationObject6.self) {
            self = .object6(value)
            return
        }
        if let value = try? container.decode(AlertDestinationObject7.self) {
            self = .object7(value)
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
        case .object4(let value): try container.encode(value)
        case .object5(let value): try container.encode(value)
        case .object6(let value): try container.encode(value)
        case .object7(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
