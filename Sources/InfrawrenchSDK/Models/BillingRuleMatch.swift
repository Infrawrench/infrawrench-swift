/*
 * InfrawrenchSDK v1.17.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.17.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// All set fields must match (AND); a rule with no fields matches all spend. The
/// same vocabulary allocation rules use, plus chargeType.
public struct BillingRuleMatch: Codable, Hashable, Sendable {
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

    public var tagKey: String?
    /// Only meaningful with tagKey; alone, tagKey matches rows carrying the key.
    public var tagValue: String?
    public var accountId: String?
    public var pluginId: String?
    public var service: String?
    /// Narrow to one kind of charge. A markup that recovers overhead usually
    /// should not apply to credits, refunds or commitment purchases, and this is
    /// how that is expressed.
    public var chargeType: ChargeType?

    public init(
        tagKey: String? = nil,
        tagValue: String? = nil,
        accountId: String? = nil,
        pluginId: String? = nil,
        service: String? = nil,
        chargeType: ChargeType? = nil
    ) {
        self.tagKey = tagKey
        self.tagValue = tagValue
        self.accountId = accountId
        self.pluginId = pluginId
        self.service = service
        self.chargeType = chargeType
    }
}
