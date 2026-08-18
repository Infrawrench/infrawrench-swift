/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostScenarioAdjustment: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case oneOff
        case recurring
        case rateChange
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "one_off": self = .oneOff
            case "recurring": self = .recurring
            case "rate_change": self = .rateChange
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .oneOff: return "one_off"
            case .recurring: return "recurring"
            case .rateChange: return "rate_change"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .oneOff,
            .recurring,
            .rateChange,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Period: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case daily
        case monthly
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "daily": self = .daily
            case "monthly": self = .monthly
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .daily: return "daily"
            case .monthly: return "monthly"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Period] = [
            .daily,
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

    /// Stable within the model; also the key of its per-adjustment total.
    public var id: String
    /// What this adjustment is. Named on the chart whenever the scenario moves a
    /// number.
    public var label: String
    /// `one_off` is a single amount on a single day; `recurring` is an amount
    /// every period from a date; `rate_change` is ±X% of the trend from a date.
    /// The split between an amount and a percentage of the trend is what fixes
    /// the composition order — see the `scenario` field on the cost query
    /// response.
    public var kind: Kind
    public var startDate: String
    /// Inclusive last day, or null for indefinitely. Refused for `one_off`, which
    /// is one day.
    public var endDate: String?
    /// Minor units of the model's currency, for the amount kinds; null for
    /// `rate_change`. May be negative — turning off an old cluster is as real a
    /// known future cost as buying a new one.
    public var amountCents: Int?
    /// Always the model's own currency; a model that held two would sum two kinds
    /// of money.
    public var currency: String?
    /// How often a `recurring` amount charges. A monthly amount is spread evenly
    /// across each calendar month it covers rather than landing as a spike on the
    /// 1st, so a month the scenario only partly covers costs proportionally less.
    public var period: Period?
    /// Percent change to the trend, for `rate_change`. -20 is a fifth cheaper.
    public var percent: Double?
    /// Which spend this adjustment describes; empty is the whole organization.
    /// For a rate change the scope is what the percentage is *of*. For an amount
    /// it decides whether the adjustment applies to a given chart at all — a GCP
    /// commitment does not belong on a chart filtered to AWS, and one that is
    /// excluded is named in `scenario.outOfScope`.
    public var scope: [CostScenarioScopeTerm]

    public init(
        id: String,
        label: String,
        kind: Kind,
        startDate: String,
        endDate: String? = nil,
        amountCents: Int? = nil,
        currency: String? = nil,
        period: Period? = nil,
        percent: Double? = nil,
        scope: [CostScenarioScopeTerm]
    ) {
        self.id = id
        self.label = label
        self.kind = kind
        self.startDate = startDate
        self.endDate = endDate
        self.amountCents = amountCents
        self.currency = currency
        self.period = period
        self.percent = percent
        self.scope = scope
    }
}
