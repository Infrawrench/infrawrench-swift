/*
 * InfrawrenchSDK v0.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BudgetAlertEvent: Codable, Hashable, Sendable {
    public enum ThresholdType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case actual
        case forecast
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "actual": self = .actual
            case "forecast": self = .forecast
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .actual: return "actual"
            case .forecast: return "forecast"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ThresholdType] = [
            .actual,
            .forecast,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var id: String
    public var month: String
    public var thresholdType: ThresholdType
    public var thresholdPercent: Int
    public var actualAmountCents: Int
    public var forecastAmountCents: Int?
    public var triggeredAt: String

    public init(
        id: String,
        month: String,
        thresholdType: ThresholdType,
        thresholdPercent: Int,
        actualAmountCents: Int,
        forecastAmountCents: Int? = nil,
        triggeredAt: String
    ) {
        self.id = id
        self.month = month
        self.thresholdType = thresholdType
        self.thresholdPercent = thresholdPercent
        self.actualAmountCents = actualAmountCents
        self.forecastAmountCents = forecastAmountCents
        self.triggeredAt = triggeredAt
    }
}
