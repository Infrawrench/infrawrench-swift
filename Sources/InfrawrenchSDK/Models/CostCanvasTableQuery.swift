/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostCanvasTableQuery: Codable, Hashable, Sendable {
    public enum Binning: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case none
        case daily
        case weekly
        case monthly
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "none": self = .none
            case "daily": self = .daily
            case "weekly": self = .weekly
            case "monthly": self = .monthly
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .none: return "none"
            case .daily: return "daily"
            case .weekly: return "weekly"
            case .monthly: return "monthly"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Binning] = [
            .none,
            .daily,
            .weekly,
            .monthly,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum GroupBy: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
        public static let allKnownCases: [GroupBy] = [
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

    public enum CostBasis2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case cash
        case amortized
        case blended
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cash": self = .cash
            case "amortized": self = .amortized
            case "blended": self = .blended
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .cash: return "cash"
            case .amortized: return "amortized"
            case .blended: return "blended"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [CostBasis2] = [
            .cash,
            .amortized,
            .blended,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var dateRange: CostDateRange
    public var binning: Binning
    public var groupBy: GroupBy
    public var groupByTagKey: String?
    public var filters: [CostReportFilter]?
    public var savedFilterId: String?
    public var costBasis: CostBasis2?
    public var adjusted: Bool?
    public var topN: Int?

    public init(
        dateRange: CostDateRange,
        binning: Binning,
        groupBy: GroupBy,
        groupByTagKey: String? = nil,
        filters: [CostReportFilter]? = nil,
        savedFilterId: String? = nil,
        costBasis: CostBasis2? = nil,
        adjusted: Bool? = nil,
        topN: Int? = nil
    ) {
        self.dateRange = dateRange
        self.binning = binning
        self.groupBy = groupBy
        self.groupByTagKey = groupByTagKey
        self.filters = filters
        self.savedFilterId = savedFilterId
        self.costBasis = costBasis
        self.adjusted = adjusted
        self.topN = topN
    }
}
