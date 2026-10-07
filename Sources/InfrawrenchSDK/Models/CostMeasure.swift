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

/// What the Y axis sums. `cost` (the default) is money per currency. `usage` sums
/// the usage quantity providers report beside the money and requires `usageUnit`,
/// because quantities in different units cannot be added. `count` is how many
/// distinct values of the `groupBy` dimension had nonzero cost in each bin (how
/// many services were billed each day) and requires a `groupBy`; its range total
/// is a distinct count, not a sum of the bins. `usage` and `count` cannot carry a
/// forecast, a scenario or billing rules (a 400), `count` cannot be cumulative,
/// and a display currency is ignored for both.
public enum CostMeasure: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case cost
    case usage
    case count
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "cost": self = .cost
        case "usage": self = .usage
        case "count": self = .count
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .cost: return "cost"
        case .usage: return "usage"
        case .count: return "count"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CostMeasure] = [
        .cost,
        .usage,
        .count,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
