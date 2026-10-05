/*
 * InfrawrenchSDK v1.60.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.60.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricSourceAccount: Codable, Hashable, Sendable {
    public struct Source: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case sql
            case metric
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "sql": self = .sql
                case "metric": self = .metric
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .sql: return "sql"
                case .metric: return "metric"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .sql,
                .metric,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum ReadOnly: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case enforced
            case validated
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "enforced": self = .enforced
                case "validated": self = .validated
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .enforced: return "enforced"
                case .validated: return "validated"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [ReadOnly] = [
                .enforced,
                .validated,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var label: String
        public var description: String?
        public var kind: Kind
        public var fields: [BusinessMetricSourceField]
        public var sqlDialect: String?
        public var readOnly: ReadOnly?
        public var supportsDryRun: Bool?

        public init(
            label: String,
            description: String? = nil,
            kind: Kind,
            fields: [BusinessMetricSourceField],
            sqlDialect: String? = nil,
            readOnly: ReadOnly? = nil,
            supportsDryRun: Bool? = nil
        ) {
            self.label = label
            self.description = description
            self.kind = kind
            self.fields = fields
            self.sqlDialect = sqlDialect
            self.readOnly = readOnly
            self.supportsDryRun = supportsDryRun
        }
    }

    public var accountId: String
    public var accountName: String
    public var pluginId: String
    public var pluginName: String
    public var source: Source

    public init(
        accountId: String,
        accountName: String,
        pluginId: String,
        pluginName: String,
        source: Source
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.source = source
    }
}
