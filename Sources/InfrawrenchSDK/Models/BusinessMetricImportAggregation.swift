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

/// How several points the source returns for one day (and label) become that
/// day's value. A SQL query grouped by day returns one row per day and every
/// choice agrees.
public enum BusinessMetricImportAggregation: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case sum
    case average
    case min
    case max
    case last
    case count
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "sum": self = .sum
        case "average": self = .average
        case "min": self = .min
        case "max": self = .max
        case "last": self = .last
        case "count": self = .count
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .sum: return "sum"
        case .average: return "average"
        case .min: return "min"
        case .max: return "max"
        case .last: return "last"
        case .count: return "count"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [BusinessMetricImportAggregation] = [
        .sum,
        .average,
        .min,
        .max,
        .last,
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
