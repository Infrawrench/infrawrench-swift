/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Why the result reads the way it does. Every non-`measured` status carries at
/// least one, and `measured` carries whatever lowered its confidence.
/// `period_native_provider` is the notable one: a provider that dates a whole
/// invoice period to the period's start cannot be read by a day-window comparison
/// at all.
public enum ChangeCostImpactReason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case noCostIdentity
    case periodNativeProvider
    case noCostData
    case noCoverageBefore
    case noCoverageAfter
    case shortWindow
    case windowClamped
    case overlappingChanges
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "no_cost_identity": self = .noCostIdentity
        case "period_native_provider": self = .periodNativeProvider
        case "no_cost_data": self = .noCostData
        case "no_coverage_before": self = .noCoverageBefore
        case "no_coverage_after": self = .noCoverageAfter
        case "short_window": self = .shortWindow
        case "window_clamped": self = .windowClamped
        case "overlapping_changes": self = .overlappingChanges
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .noCostIdentity: return "no_cost_identity"
        case .periodNativeProvider: return "period_native_provider"
        case .noCostData: return "no_cost_data"
        case .noCoverageBefore: return "no_coverage_before"
        case .noCoverageAfter: return "no_coverage_after"
        case .shortWindow: return "short_window"
        case .windowClamped: return "window_clamped"
        case .overlappingChanges: return "overlapping_changes"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [ChangeCostImpactReason] = [
        .noCostIdentity,
        .periodNativeProvider,
        .noCostData,
        .noCoverageBefore,
        .noCoverageAfter,
        .shortWindow,
        .windowClamped,
        .overlappingChanges,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
