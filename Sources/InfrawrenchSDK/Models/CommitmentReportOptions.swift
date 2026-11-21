/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentReportOptions: Codable, Hashable, Sendable {
    public struct Provider: Codable, Hashable, Sendable {
        public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case measured
            case inventoryOnly
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "measured": self = .measured
                case "inventory_only": self = .inventoryOnly
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .measured: return "measured"
                case .inventoryOnly: return "inventory_only"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Status] = [
                .measured,
                .inventoryOnly,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var pluginId: PluginId
        public var displayName: String
        /// `inventory_only`: the provider's holdings are collected but its cost
        /// rows do not distinguish covered usage (GCP today), so it is left out
        /// of every metric rather than read as 0% covered.
        public var status: Status

        public init(
            pluginId: PluginId,
            displayName: String,
            status: Status
        ) {
            self.pluginId = pluginId
            self.displayName = displayName
            self.status = status
        }
    }

    public struct Account2: Codable, Hashable, Sendable {
        public var id: String
        public var name: String
        public var pluginId: PluginId

        public init(
            id: String,
            name: String,
            pluginId: PluginId
        ) {
            self.id = id
            self.name = name
            self.pluginId = pluginId
        }
    }

    public struct Commitment: Codable, Hashable, Sendable {
        public var commitmentId: String
        public var accountId: String
        public var pluginId: PluginId
        public var kind: CommitmentReportKind
        public var description: String
        public var state: String

        public init(
            commitmentId: String,
            accountId: String,
            pluginId: PluginId,
            kind: CommitmentReportKind,
            description: String,
            state: String
        ) {
            self.commitmentId = commitmentId
            self.accountId = accountId
            self.pluginId = pluginId
            self.kind = kind
            self.description = description
            self.state = state
        }
    }

    public var providers: [Provider]
    public var accounts: [Account2]
    public var services: [String]
    public var regions: [String]
    public var commitments: [Commitment]

    public init(
        providers: [Provider],
        accounts: [Account2],
        services: [String],
        regions: [String],
        commitments: [Commitment]
    ) {
        self.providers = providers
        self.accounts = accounts
        self.services = services
        self.regions = regions
        self.commitments = commitments
    }
}
