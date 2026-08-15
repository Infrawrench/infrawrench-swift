/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// How much the delta is worth believing. Derived from the number of comparable
/// days per side (7+ high, 4+ medium, otherwise low) and dropped one tier when
/// other recorded changes touched the same resource inside the window.
public enum ChangeCostImpactConfidence: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case high
    case medium
    case low
    case none
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "high": self = .high
        case "medium": self = .medium
        case "low": self = .low
        case "none": self = .none
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .high: return "high"
        case .medium: return "medium"
        case .low: return "low"
        case .none: return "none"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [ChangeCostImpactConfidence] = [
        .high,
        .medium,
        .low,
        .none,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
