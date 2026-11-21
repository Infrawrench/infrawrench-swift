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

public struct MigrationEstimateResult: Codable, Hashable, Sendable {
    public struct Source: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case service
            case resources
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "service": self = .service
                case "resources": self = .resources
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .service: return "service"
                case .resources: return "resources"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .service,
                .resources,
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
        public var label: String
        public var resourceCount: Int

        public init(
            kind: Kind,
            label: String,
            resourceCount: Int
        ) {
            self.kind = kind
            self.label = label
            self.resourceCount = resourceCount
        }
    }

    public struct Target: Codable, Hashable, Sendable {
        public var pluginId: PluginId
        public var pluginName: String

        public init(
            pluginId: PluginId,
            pluginName: String
        ) {
            self.pluginId = pluginId
            self.pluginName = pluginName
        }
    }

    public var estimateId: String?
    public var name: String
    public var source: Source
    public var target: Target
    public var region: MigrationRegionNote
    public var rows: [MigrationRow]
    public var unmatched: [MigrationUnmatchedRow]
    public var totals: MigrationTotals
    public var displayCurrency: String?
    /// The target plugin can write Terraform for at least one matched row.
    public var terraform: Bool
    public var truncated: Bool
    public var generatedAt: String

    public init(
        estimateId: String? = nil,
        name: String,
        source: Source,
        target: Target,
        region: MigrationRegionNote,
        rows: [MigrationRow],
        unmatched: [MigrationUnmatchedRow],
        totals: MigrationTotals,
        displayCurrency: String? = nil,
        terraform: Bool,
        truncated: Bool,
        generatedAt: String
    ) {
        self.estimateId = estimateId
        self.name = name
        self.source = source
        self.target = target
        self.region = region
        self.rows = rows
        self.unmatched = unmatched
        self.totals = totals
        self.displayCurrency = displayCurrency
        self.terraform = terraform
        self.truncated = truncated
        self.generatedAt = generatedAt
    }
}
