/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public enum CostAnomalyFeedbackReason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case plannedLaunch
    case migration
    case seasonal
    case pricingChange
    case dataIssue
    case other
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "planned_launch": self = .plannedLaunch
        case "migration": self = .migration
        case "seasonal": self = .seasonal
        case "pricing_change": self = .pricingChange
        case "data_issue": self = .dataIssue
        case "other": self = .other
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .plannedLaunch: return "planned_launch"
        case .migration: return "migration"
        case .seasonal: return "seasonal"
        case .pricingChange: return "pricing_change"
        case .dataIssue: return "data_issue"
        case .other: return "other"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [CostAnomalyFeedbackReason] = [
        .plannedLaunch,
        .migration,
        .seasonal,
        .pricingChange,
        .dataIssue,
        .other,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
