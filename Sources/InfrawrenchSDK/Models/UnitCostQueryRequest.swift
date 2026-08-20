/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
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
        case daily
        case weekly
        case monthly
        case cumulative
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "daily": self = .daily
            case "weekly": self = .weekly
            case "monthly": self = .monthly
            case "cumulative": self = .cumulative
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .daily: return "daily"
            case .weekly: return "weekly"
            case .monthly: return "monthly"
            case .cumulative: return "cumulative"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Binning] = [
            .daily,
            .weekly,
            .monthly,
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

    public enum Mode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case unitCost
        case margin
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "unit_cost": self = .unitCost
            case "margin": self = .margin
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .unitCost: return "unit_cost"
            case .margin: return "margin"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Mode] = [
            .unitCost,
            .margin,
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

    /// Inclusive, YYYY-MM-DD.
    public var from: String
    public var to: String
    public var binning: Binning
    /// Absent is `unit_cost` (spend ÷ metric value). `margin` is `(revenue −
    /// spend) ÷ revenue` as a fraction, and is a 400 for a metric whose `kind` is
    /// not `currency`.
    public var mode: Mode?
    /// Narrowing on top of the metric's own `costScope` — AND-composed, never a
    /// replacement.
    public var filters: [BusinessMetricScopeTerm]?
    /// The same narrowing as cost-query-language text.
    public var query: String?
    public var savedFilterId: String?
    public var costBasis: CostBasis2?
    public var chargeTypes: [String]?
    /// Fold spend currencies the organization holds a rate for into this one
    /// before dividing. Ignored for `margin`, which always converts to the
    /// metric's own currency.
    public var displayCurrency: String?

    public init(
        from: String,
        to: String,
        binning: Binning,
        mode: Mode? = nil,
        filters: [BusinessMetricScopeTerm]? = nil,
        query: String? = nil,
        savedFilterId: String? = nil,
        costBasis: CostBasis2? = nil,
        chargeTypes: [String]? = nil,
        displayCurrency: String? = nil
    ) {
        self.from = from
        self.to = to
        self.binning = binning
        self.mode = mode
        self.filters = filters
        self.query = query
        self.savedFilterId = savedFilterId
        self.costBasis = costBasis
        self.chargeTypes = chargeTypes
        self.displayCurrency = displayCurrency
    }
}
