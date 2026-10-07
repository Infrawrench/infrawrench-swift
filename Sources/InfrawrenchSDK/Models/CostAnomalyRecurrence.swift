/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// How the suppression repeats. `one_off` covers every day from `startsOn` to
/// `expiresOn`; `weekly` the anchor day's weekday; `monthly` the anchor day's day
/// of the month, give or take a day (an anchor past the end of a shorter month
/// falls on its last day); `seasonal` the anchor day's calendar date, give or
/// take three days, every year.
public enum CostAnomalyRecurrence: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case oneOff
    case weekly
    case monthly
    case seasonal
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "one_off": self = .oneOff
        case "weekly": self = .weekly
        case "monthly": self = .monthly
        case "seasonal": self = .seasonal
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .oneOff: return "one_off"
        case .weekly: return "weekly"
        case .monthly: return "monthly"
        case .seasonal: return "seasonal"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CostAnomalyRecurrence] = [
        .oneOff,
        .weekly,
        .monthly,
        .seasonal,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
