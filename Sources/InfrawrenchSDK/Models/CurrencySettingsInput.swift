/*
 * InfrawrenchSDK v1.74.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CurrencySettingsInput: Codable, Hashable, Sendable {
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
    /// Omitted keeps the stored value.
    public var autoRates: Bool?
    /// Omitted keeps the stored value.
    public var rateBasis: RateBasis?

    public init(
        displayCurrency: String? = nil,
        autoRates: Bool? = nil,
        rateBasis: RateBasis? = nil
    ) {
        self.displayCurrency = displayCurrency
        self.autoRates = autoRates
        self.rateBasis = rateBasis
    }
}
