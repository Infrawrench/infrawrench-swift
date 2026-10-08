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

public struct ExchangeRateLookup: Codable, Hashable, Sendable {
    public enum RateBasis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case daily
        case monthEnd
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "daily": self = .daily
            case "month_end": self = .monthEnd
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .daily: return "daily"
            case .monthEnd: return "month_end"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [RateBasis] = [
            .daily,
            .monthEnd,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Source: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case manual
        case ecb
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "manual": self = .manual
            case "ecb": self = .ecb
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .manual: return "manual"
            case .ecb: return "ecb"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Source] = [
            .manual,
            .ecb,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// ISO 4217 code, upper-case.
    public var fromCurrency: String
    /// ISO 4217 code, upper-case.
    public var toCurrency: String
    public var date: String
    /// Which automatic (feed) rate converts a day's spend. `daily`: the rate
    /// published for that day, carried forward over weekends and holidays.
    /// `month_end`: the rate in force on the last day of that day's month, so a
    /// whole month converts at one rate. Stated rates always apply to the days
    /// their own dates cover, whatever the basis.
    public var rateBasis: RateBasis
    /// Multiply an amount in `fromCurrency` by this. `null`: no rate applies.
    public var rate: Double?
    /// `manual`: a rate your organization stated. `ecb`: the automatic European
    /// Central Bank euro reference rate (crossed through EUR when neither side is
    /// EUR).
    public var source: Source?
    /// The stated rate's effective date, or the ECB publication date used.
    public var rateDate: String?
    public var manualRateId: String?
    public var explanation: String

    public init(
        fromCurrency: String,
        toCurrency: String,
        date: String,
        rateBasis: RateBasis,
        rate: Double? = nil,
        source: Source? = nil,
        rateDate: String? = nil,
        manualRateId: String? = nil,
        explanation: String
    ) {
        self.fromCurrency = fromCurrency
        self.toCurrency = toCurrency
        self.date = date
        self.rateBasis = rateBasis
        self.rate = rate
        self.source = source
        self.rateDate = rateDate
        self.manualRateId = manualRateId
        self.explanation = explanation
    }
}
