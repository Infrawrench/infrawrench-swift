/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `unit_cost` is spend ÷ metric value. `margin` is `(revenue − spend) ÷ revenue`
/// as a fraction, with the absolute margin beside it, and needs a `currency`
/// metric. `usage_unit_cost` is spend ÷ the usage quantity providers report in
/// one `usageUnit`, and needs no metric (use `POST
/// /business-metrics/usage-unit-costs`). `raw_metric` plots the metric itself
/// beside spend, where zero and negative values are real points.
public enum UnitCostMode: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case unitCost
    case margin
    case usageUnitCost
    case rawMetric
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "unit_cost": self = .unitCost
        case "margin": self = .margin
        case "usage_unit_cost": self = .usageUnitCost
        case "raw_metric": self = .rawMetric
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .unitCost: return "unit_cost"
        case .margin: return "margin"
        case .usageUnitCost: return "usage_unit_cost"
        case .rawMetric: return "raw_metric"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [UnitCostMode] = [
        .unitCost,
        .margin,
        .usageUnitCost,
        .rawMetric,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
