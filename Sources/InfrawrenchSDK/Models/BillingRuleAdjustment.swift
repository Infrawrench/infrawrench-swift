/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BillingRuleAdjustment: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case percentage
        case fixed
        case reallocation
        case tiered
        case expression
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "percentage": self = .percentage
            case "fixed": self = .fixed
            case "reallocation": self = .reallocation
            case "tiered": self = .tiered
            case "expression": self = .expression
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .percentage: return "percentage"
            case .fixed: return "fixed"
            case .reallocation: return "reallocation"
            case .tiered: return "tiered"
            case .expression: return "expression"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .percentage,
            .fixed,
            .reallocation,
            .tiered,
            .expression,
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

    public enum TargetKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case costCentre
        case account
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cost_centre": self = .costCentre
            case "account": self = .account
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .costCentre: return "cost_centre"
            case .account: return "account"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [TargetKind] = [
            .costCentre,
            .account,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum TierMode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case marginal
        case volume
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "marginal": self = .marginal
            case "volume": self = .volume
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .marginal: return "marginal"
            case .volume: return "volume"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [TierMode] = [
            .marginal,
            .volume,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum TierScope: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case overall
        case perService
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "overall": self = .overall
            case "per_service": self = .perService
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .overall: return "overall"
            case .perService: return "per_service"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [TierScope] = [
            .overall,
            .perService,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// `percentage` multiplies matched spend (every matching percentage rule
    /// applies, so two 10% markups compound to 21%). `fixed` adds a flat amount
    /// per period, pro-rated across the queried range, and is never multiplied by
    /// anything. `reallocation` moves matched spend onto another cost centre or
    /// account; the first matching reallocation rule wins, so a row moves exactly
    /// once and the organisation's total is unchanged.
    ///
    /// `tiered` and `expression` apply **only when a managed account's invoice is
    /// priced**: `tiered` marks a customer's matched monthly spend up or down by
    /// rate tiers on its volume, and `expression` computes each matched line's
    /// new cost with a sandboxed pricing expression. Neither ever changes the
    /// organisation's own graphs, budgets or showback.
    public var kind: Kind
    /// `percentage` only. Signed: +15 marks up by 15%, -10 discounts by 10%.
    /// Bounded below at -100 because a discount larger than the cost would turn
    /// spend into income.
    public var percent: Double?
    /// `fixed` only, in the major unit of `currency`, per `period`.
    public var amount: Double?
    public var currency: String?
    /// `fixed` only. A monthly amount is pro-rated across partial months: a range
    /// covering ten days of a 31-day month contributes 10/31 of it.
    public var period: Period?
    /// Required on `reallocation`, optional on `fixed` (where the flat charge is
    /// booked), never set on `percentage`.
    public var targetKind: TargetKind?
    public var targetId: String?
    /// `tiered` only. Ascending, with strictly increasing `upTo`; only the last
    /// tier is open-ended. Thresholds are in `currency`, which a tiered rule
    /// requires.
    public var tiers: [BillingRuleTier]?
    /// `tiered` only. `marginal` charges each slice of the month's spend at its
    /// own tier's rate; `volume` charges the whole month at the rate of the tier
    /// the total falls in.
    public var tierMode: TierMode?
    /// `tiered` only. Whether volume is the customer's matched spend overall or
    /// per service.
    public var tierScope: TierScope?
    /// `expression` only. A pricing expression giving the line's new cost, e.g.
    /// `if service == "AmazonEC2" and tag.env == "prod" then cost * 1.1`. Parsed
    /// and type-checked on save; a syntax or type error is a 400 naming the
    /// character it was found at. It is evaluated by a small interpreter over a
    /// closed set of fields and functions, never handed to a database or a script
    /// engine.
    public var expression: String?

    public init(
        kind: Kind,
        percent: Double? = nil,
        amount: Double? = nil,
        currency: String? = nil,
        period: Period? = nil,
        targetKind: TargetKind? = nil,
        targetId: String? = nil,
        tiers: [BillingRuleTier]? = nil,
        tierMode: TierMode? = nil,
        tierScope: TierScope? = nil,
        expression: String? = nil
    ) {
        self.kind = kind
        self.percent = percent
        self.amount = amount
        self.currency = currency
        self.period = period
        self.targetKind = targetKind
        self.targetId = targetId
        self.tiers = tiers
        self.tierMode = tierMode
        self.tierScope = tierScope
        self.expression = expression
    }
}
