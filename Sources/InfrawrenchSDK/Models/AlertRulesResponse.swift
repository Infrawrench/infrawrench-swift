/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AlertRulesResponse: Codable, Hashable, Sendable {
    public struct SlackChannel2: Codable, Hashable, Sendable {
        public var id: String
        public var name: String
        public var isPrivate: Bool

        public init(
            id: String,
            name: String,
            isPrivate: Bool
        ) {
            self.id = id
            self.name = name
            self.isPrivate = isPrivate
        }
    }

    public struct MsTeamsWebhook2: Codable, Hashable, Sendable {
        public var id: String
        public var label: String

        public init(
            id: String,
            label: String
        ) {
            self.id = id
            self.label = label
        }
    }

    public struct Account2: Codable, Hashable, Sendable {
        public var id: String
        public var displayName: String
        public var pluginId: String

        public init(
            id: String,
            displayName: String,
            pluginId: String
        ) {
            self.id = id
            self.displayName = displayName
            self.pluginId = pluginId
        }
    }

    public struct OnCallSchedule2: Codable, Hashable, Sendable {
        public var id: String
        public var name: String

        public init(
            id: String,
            name: String
        ) {
            self.id = id
            self.name = name
        }
    }

    public struct Member: Codable, Hashable, Sendable {
        public var userId: String
        public var name: String?
        public var email: String

        public init(
            userId: String,
            name: String? = nil,
            email: String
        ) {
            self.userId = userId
            self.name = name
            self.email = email
        }
    }

    public struct EmailSettings: Codable, Hashable, Sendable {
        public enum ExternalPolicy: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case memberDomains
            case any
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "member-domains": self = .memberDomains
                case "any": self = .any
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .memberDomains: return "member-domains"
                case .any: return "any"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [ExternalPolicy] = [
                .memberDomains,
                .any,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var externalPolicy: ExternalPolicy
        public var allowedDomains: [String]

        public init(
            externalPolicy: ExternalPolicy,
            allowedDomains: [String]
        ) {
            self.externalPolicy = externalPolicy
            self.allowedDomains = allowedDomains
        }
    }

    public var rules: [AlertRule]
    /// True when the organization has saved no rules and `rules` is the
    /// synthesized default; everything except drift, to every connected channel
    /// and to mobile push.
    public var usingDefaults: Bool
    public var slackChannels: [SlackChannel2]
    public var msTeamsWebhooks: [MsTeamsWebhook2]
    public var accounts: [Account2]
    /// Live on-call rotations, so the editor can offer 'whoever is on call' as a
    /// destination. Disabled rotations are omitted for the same reason a
    /// disconnected Slack install is: offering one would let the editor build a
    /// rule that routes nowhere.
    public var onCallSchedules: [OnCallSchedule2]
    /// Current members, for the email destination picker.
    public var members: [Member]
    /// Whether this deployment has a mail provider configured.
    public var emailAvailable: Bool
    /// The external-address policy an `email-address` destination must pass.
    public var emailSettings: EmailSettings
    /// Domains the organization's members sign in with: the implicit allowlist.
    public var memberDomains: [String]

    public init(
        rules: [AlertRule],
        usingDefaults: Bool,
        slackChannels: [SlackChannel2],
        msTeamsWebhooks: [MsTeamsWebhook2],
        accounts: [Account2],
        onCallSchedules: [OnCallSchedule2],
        members: [Member],
        emailAvailable: Bool,
        emailSettings: EmailSettings,
        memberDomains: [String]
    ) {
        self.rules = rules
        self.usingDefaults = usingDefaults
        self.slackChannels = slackChannels
        self.msTeamsWebhooks = msTeamsWebhooks
        self.accounts = accounts
        self.onCallSchedules = onCallSchedules
        self.members = members
        self.emailAvailable = emailAvailable
        self.emailSettings = emailSettings
        self.memberDomains = memberDomains
    }
}
