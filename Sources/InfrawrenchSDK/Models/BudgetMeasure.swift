/*
 * InfrawrenchSDK v1.60.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.60.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// What the budget counts. `cost` (the default) is money in `currency`, against
/// `amountCents`. `usage` sums the cost rows' usage quantity in `usageUnit`
/// against `usageAmount` (tokens, GB, instance-hours, requests: whatever the
/// providers report; list them with GET /costs/dimensions?dimension=usage-units).
/// Units are matched exactly and never converted. A usage budget takes no
/// scenario model and no billing rules.
public enum BudgetMeasure: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case cost
    case usage
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "cost": self = .cost
        case "usage": self = .usage
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .cost: return "cost"
        case .usage: return "usage"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [BudgetMeasure] = [
        .cost,
        .usage,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
