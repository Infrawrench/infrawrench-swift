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

public struct PriceCatalogPrice: Codable, Hashable, Sendable {
    public enum Unit: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case hour
        case month
        case gbMonth
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "hour": self = .hour
            case "month": self = .month
            case "gb-month": self = .gbMonth
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .hour: return "hour"
            case .month: return "month"
            case .gbMonth: return "gb-month"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Unit] = [
            .hour,
            .month,
            .gbMonth,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var region: String
    public var rateType: PriceRateType
    public var unit: Unit
    /// Price per `unit` in `currency`, the provider's list price.
    public var amount: Double
    public var currency: String
    /// Commitment term for reserved / savings plan: `1yr`, `3yr`.
    public var term: String?
    public var paymentOption: String?
    /// When the provider says the rate took effect. Absent when the source does
    /// not say.
    public var effectiveDate: String?

    public init(
        region: String,
        rateType: PriceRateType,
        unit: Unit,
        amount: Double,
        currency: String,
        term: String? = nil,
        paymentOption: String? = nil,
        effectiveDate: String? = nil
    ) {
        self.region = region
        self.rateType = rateType
        self.unit = unit
        self.amount = amount
        self.currency = currency
        self.term = term
        self.paymentOption = paymentOption
        self.effectiveDate = effectiveDate
    }
}
