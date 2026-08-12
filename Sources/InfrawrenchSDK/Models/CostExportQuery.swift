/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The rows a run selects. Reuses the same `CostFilter` and dimension vocabulary
/// the dashboards, budgets and cost reports store, so a filter means the same
/// thing everywhere.
public struct CostExportQuery: Codable, Hashable, Sendable {
    public enum Dimension: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case provider
        case account
        case service
        case region
        case resource
        case tag
        case chargeType
        case commitment
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "provider": self = .provider
            case "account": self = .account
            case "service": self = .service
            case "region": self = .region
            case "resource": self = .resource
            case "tag": self = .tag
            case "charge_type": self = .chargeType
            case "commitment": self = .commitment
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .provider: return "provider"
            case .account: return "account"
            case .service: return "service"
            case .region: return "region"
            case .resource: return "resource"
            case .tag: return "tag"
            case .chargeType: return "charge_type"
            case .commitment: return "commitment"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Dimension] = [
            .provider,
            .account,
            .service,
            .region,
            .resource,
            .tag,
            .chargeType,
            .commitment,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum ChargeType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case usage
        case commitmentCoveredUsage
        case commitmentFee
        case commitmentDiscount
        case credit
        case tax
        case refund
        case adjustment
        case support
        case other
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "usage": self = .usage
            case "commitment_covered_usage": self = .commitmentCoveredUsage
            case "commitment_fee": self = .commitmentFee
            case "commitment_discount": self = .commitmentDiscount
            case "credit": self = .credit
            case "tax": self = .tax
            case "refund": self = .refund
            case "adjustment": self = .adjustment
            case "support": self = .support
            case "other": self = .other
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .usage: return "usage"
            case .commitmentCoveredUsage: return "commitment_covered_usage"
            case .commitmentFee: return "commitment_fee"
            case .commitmentDiscount: return "commitment_discount"
            case .credit: return "credit"
            case .tax: return "tax"
            case .refund: return "refund"
            case .adjustment: return "adjustment"
            case .support: return "support"
            case .other: return "other"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ChargeType] = [
            .usage,
            .commitmentCoveredUsage,
            .commitmentFee,
            .commitmentDiscount,
            .credit,
            .tax,
            .refund,
            .adjustment,
            .support,
            .other,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum CostBasis2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case cash
        case amortized
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cash": self = .cash
            case "amortized": self = .amortized
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .cash: return "cash"
            case .amortized: return "amortized"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [CostBasis2] = [
            .cash,
            .amortized,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var version: Double
    /// Row-identity columns kept in the output. Dropping one aggregates over it —
    /// an export grouped to provider + service is orders of magnitude smaller
    /// than a per-resource one.
    public var dimensions: [Dimension]
    /// Tag keys emitted as their own `tag_<key>` columns.
    public var tagKeys: [String]
    public var filters: [CostExportFilter]
    public var chargeTypes: [ChargeType]?
    public var costBasis: CostBasis2?

    public init(
        version: Double,
        dimensions: [Dimension],
        tagKeys: [String],
        filters: [CostExportFilter],
        chargeTypes: [ChargeType]? = nil,
        costBasis: CostBasis2? = nil
    ) {
        self.version = version
        self.dimensions = dimensions
        self.tagKeys = tagKeys
        self.filters = filters
        self.chargeTypes = chargeTypes
        self.costBasis = costBasis
    }
}
