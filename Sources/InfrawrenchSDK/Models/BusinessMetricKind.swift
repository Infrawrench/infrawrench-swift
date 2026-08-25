/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What the metric's numbers are. `count` is a unit-less quantity (customers,
/// requests, GB) and supports unit cost only. `currency` is money the business
/// took in, denominated in the metric's own `currency`, and is the only kind
/// margin can be computed against — `(revenue − cost) ÷ revenue` subtracts money
/// from money and is undefined otherwise.
public enum BusinessMetricKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case count
    case currency
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "count": self = .count
        case "currency": self = .currency
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .count: return "count"
        case .currency: return "currency"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [BusinessMetricKind] = [
        .count,
        .currency,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
