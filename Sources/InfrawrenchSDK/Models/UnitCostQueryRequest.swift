/*
 * InfrawrenchSDK v1.101.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.101.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct UnitCostQueryRequest: Codable, Hashable, Sendable {
    public enum Binning: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case hourly
        case daily
        case weekly
        case monthly
        case quarterly
        case cumulative
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "hourly": self = .hourly
            case "daily": self = .daily
            case "weekly": self = .weekly
            case "monthly": self = .monthly
            case "quarterly": self = .quarterly
            case "cumulative": self = .cumulative
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .hourly: return "hourly"
            case .daily: return "daily"
            case .weekly: return "weekly"
            case .monthly: return "monthly"
            case .quarterly: return "quarterly"
            case .cumulative: return "cumulative"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Binning] = [
            .hourly,
            .daily,
            .weekly,
            .monthly,
            .quarterly,
            .cumulative,
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

    /// Inclusive, YYYY-MM-DD.
    public var from: String
    public var to: String
    public var binning: Binning
    public var mode: UnitCostMode?
    public var scale: UnitCostScale?
    /// Keep only values carrying these labels. In a ratio mode each label must be
    /// mapped, and the spend is narrowed to the same values on the mapped
    /// dimension.
    public var labelFilters: [UnitCostLabelFilter]?
    /// One series per value of this label (the 25 largest by metric total; the
    /// rest fold into `Other`). In a ratio mode the label must be mapped.
    public var groupByLabel: String?
    /// `usage_unit_cost` only, and required there: the provider usage unit to
    /// divide by. See `GET /business-metrics/usage-units`.
    public var usageUnit: String?
    /// Narrowing on top of the metric's own `costScope`: AND-composed, never a
    /// replacement.
    public var filters: [BusinessMetricScopeTerm]?
    /// The same narrowing as cost-query-language text.
    public var query: String?
    public var savedFilterId: String?
    public var costBasis: CostBasis2?
    public var chargeTypes: [ChargeType]?
    /// Fold spend currencies the organization holds a rate for into this one
    /// before dividing. Ignored for `margin`, which always converts to the
    /// metric's own currency.
    public var displayCurrency: String?

    public init(
        from: String,
        to: String,
        binning: Binning,
        mode: UnitCostMode? = nil,
        scale: UnitCostScale? = nil,
        labelFilters: [UnitCostLabelFilter]? = nil,
        groupByLabel: String? = nil,
        usageUnit: String? = nil,
        filters: [BusinessMetricScopeTerm]? = nil,
        query: String? = nil,
        savedFilterId: String? = nil,
        costBasis: CostBasis2? = nil,
        chargeTypes: [ChargeType]? = nil,
        displayCurrency: String? = nil
    ) {
        self.from = from
        self.to = to
        self.binning = binning
        self.mode = mode
        self.scale = scale
        self.labelFilters = labelFilters
        self.groupByLabel = groupByLabel
        self.usageUnit = usageUnit
        self.filters = filters
        self.query = query
        self.savedFilterId = savedFilterId
        self.costBasis = costBasis
        self.chargeTypes = chargeTypes
        self.displayCurrency = displayCurrency
    }
}
