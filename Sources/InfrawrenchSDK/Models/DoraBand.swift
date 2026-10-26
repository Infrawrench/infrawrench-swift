/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The standard DORA performance band: deploys at least daily / weekly / monthly;
/// lead time under a day / week / month; change failure rate at most 5% / 10% /
/// 15%; time to restore under an hour / day / week. Null when there was nothing
/// to measure.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public enum DoraBand: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case elite
    case high
    case medium
    case low
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "elite": self = .elite
        case "high": self = .high
        case "medium": self = .medium
        case "low": self = .low
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .elite: return "elite"
        case .high: return "high"
        case .medium: return "medium"
        case .low: return "low"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [DoraBand] = [
        .elite,
        .high,
        .medium,
        .low,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
