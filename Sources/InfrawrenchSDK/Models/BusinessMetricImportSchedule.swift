/*
 * InfrawrenchSDK v1.68.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.68.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public enum BusinessMetricImportSchedule: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case every6Hours
    case every12Hours
    case daily
    case weekly
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "every_6_hours": self = .every6Hours
        case "every_12_hours": self = .every12Hours
        case "daily": self = .daily
        case "weekly": self = .weekly
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .every6Hours: return "every_6_hours"
        case .every12Hours: return "every_12_hours"
        case .daily: return "daily"
        case .weekly: return "weekly"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [BusinessMetricImportSchedule] = [
        .every6Hours,
        .every12Hours,
        .daily,
        .weekly,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
