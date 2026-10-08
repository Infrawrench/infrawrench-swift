/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PagingDestinationAccount: Codable, Hashable, Sendable {
    public struct Target: Codable, Hashable, Sendable {
        public var id: String
        public var name: String
        public var description: String?

        public init(
            id: String,
            name: String,
            description: String? = nil
        ) {
            self.id = id
            self.name = name
            self.description = description
        }
    }

    public struct OnCallSource: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case schedule
            case escalationPolicy
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "schedule": self = .schedule
                case "escalation-policy": self = .escalationPolicy
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .schedule: return "schedule"
                case .escalationPolicy: return "escalation-policy"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .schedule,
                .escalationPolicy,
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
        public var name: String
        public var kind: Kind

        public init(
            id: String,
            name: String,
            kind: Kind
        ) {
            self.id = id
            self.name = name
            self.kind = kind
        }
    }

    public var accountId: String
    public var displayName: String
    public var pluginId: String
    public var targetLabel: String
    public var onCallSourceLabel: String?
    public var targets: [Target]
    public var onCallSources: [OnCallSource]
    /// Why this account's lists could not be loaded; the other accounts still
    /// load.
    public var error: String?

    public init(
        accountId: String,
        displayName: String,
        pluginId: String,
        targetLabel: String,
        onCallSourceLabel: String? = nil,
        targets: [Target],
        onCallSources: [OnCallSource],
        error: String? = nil
    ) {
        self.accountId = accountId
        self.displayName = displayName
        self.pluginId = pluginId
        self.targetLabel = targetLabel
        self.onCallSourceLabel = onCallSourceLabel
        self.targets = targets
        self.onCallSources = onCallSources
        self.error = error
    }
}
