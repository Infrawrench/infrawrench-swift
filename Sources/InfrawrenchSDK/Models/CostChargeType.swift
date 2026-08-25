/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public enum CostChargeType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
    public static let allKnownCases: [CostChargeType] = [
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
