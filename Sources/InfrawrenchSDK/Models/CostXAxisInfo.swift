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

/// Set when the request put a dimension on the X axis. Every series point (and
/// every comparison point) is then keyed by dimension value rather than date, and
/// the comparison is folded onto the current period's values so each value is
/// compared with itself.
public struct CostXAxisInfo: Codable, Hashable, Sendable {
    public enum Segment: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case none
        case dimension
        case date
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "none": self = .none
            case "dimension": self = .dimension
            case "date": self = .date
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .none: return "none"
            case .dimension: return "dimension"
            case .date: return "date"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Segment] = [
            .none,
            .dimension,
            .date,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Value: Codable, Hashable, Sendable {
        public var key: String
        public var label: String

        public init(
            key: String,
            label: String
        ) {
            self.key = key
            self.label = label
        }
    }

    public var dimension: CostDimension
    public var tagKey: String?
    /// What each series is: one per `groupBy` value (`dimension`), one per date
    /// bin (`date`; the series key is the bin start), or one unsegmented series
    /// per currency (`none`).
    public var segment: Segment
    /// The axis values in drawing order: ranked by spend, then `__other__`.
    public var values: [Value]

    public init(
        dimension: CostDimension,
        tagKey: String? = nil,
        segment: Segment,
        values: [Value]
    ) {
        self.dimension = dimension
        self.tagKey = tagKey
        self.segment = segment
        self.values = values
    }
}
