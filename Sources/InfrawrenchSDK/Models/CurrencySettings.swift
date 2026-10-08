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

public struct CurrencySettings: Codable, Hashable, Sendable {
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

    /// The currency converted amounts are expressed in, or `null` for no
    /// conversion at all. `null` is the default and the state of every
    /// organization that has not opted in: cost data is stored per currency and
    /// never merged unless you ask.
    public var displayCurrency: String?
    /// Fill days no stated rate covers from the automatic daily ECB
    /// reference-rate feed. Off by default. A stated rate always wins over the
    /// feed for the days it covers. Currencies the ECB does not publish are
    /// manual-only.
    public var autoRates: Bool
    /// Which automatic (feed) rate converts a day's spend. `daily`: the rate
    /// published for that day, carried forward over weekends and holidays.
    /// `month_end`: the rate in force on the last day of that day's month, so a
    /// whole month converts at one rate. Stated rates always apply to the days
    /// their own dates cover, whatever the basis.
    public var rateBasis: RateBasis

    public init(
        displayCurrency: String? = nil,
        autoRates: Bool,
        rateBasis: RateBasis
    ) {
        self.displayCurrency = displayCurrency
        self.autoRates = autoRates
        self.rateBasis = rateBasis
    }
}
