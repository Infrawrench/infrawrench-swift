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

/// One day of spend for one dimension combination. Clients aggregate file lines
/// to this grain before sending: two rows with the same date, dimensions, tags
/// and currency in one upload replace each other rather than adding.
public struct CustomCostRow: Codable, Hashable, Sendable {
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

    public var date: String
    public var currency: String
    /// Cash amount. Negative for credits.
    public var amount: Double
    public var service: String?
    public var region: String?
    public var resourceId: String?
    /// The file's own account label; splits the account dimension within the
    /// source.
    public var subAccount: String?
    /// At most 32. Keys starting with `infrawrench:` are reserved and rejected.
    public var tags: [String: String]?
    public var usageAmount: Double?
    public var usageUnit: String?
    public var chargeType: ChargeType?
    /// Amortized (effective) cost, e.g. FOCUS EffectiveCost. Omit when unknown.
    public var amortizedAmount: Double?
    public var commitmentId: String?

    public init(
        date: String,
        currency: String,
        amount: Double,
        service: String? = nil,
        region: String? = nil,
        resourceId: String? = nil,
        subAccount: String? = nil,
        tags: [String: String]? = nil,
        usageAmount: Double? = nil,
        usageUnit: String? = nil,
        chargeType: ChargeType? = nil,
        amortizedAmount: Double? = nil,
        commitmentId: String? = nil
    ) {
        self.date = date
        self.currency = currency
        self.amount = amount
        self.service = service
        self.region = region
        self.resourceId = resourceId
        self.subAccount = subAccount
        self.tags = tags
        self.usageAmount = usageAmount
        self.usageUnit = usageUnit
        self.chargeType = chargeType
        self.amortizedAmount = amortizedAmount
        self.commitmentId = commitmentId
    }
}
