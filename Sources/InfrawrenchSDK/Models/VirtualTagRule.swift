/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct VirtualTagRule: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case value
        case tag
        case split
        case metricSplit
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "value": self = .value
            case "tag": self = .tag
            case "split": self = .split
            case "metric_split": self = .metricSplit
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .value: return "value"
            case .tag: return "tag"
            case .split: return "split"
            case .metricSplit: return "metric_split"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .value,
            .tag,
            .split,
            .metricSplit,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum ValueTransform: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case none
        case lower
        case upper
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "none": self = .none
            case "lower": self = .lower
            case "upper": self = .upper
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .none: return "none"
            case .lower: return "lower"
            case .upper: return "upper"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ValueTransform] = [
            .none,
            .lower,
            .upper,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Cost-query-language filter a row must match, e.g. `provider = 'aws' AND
    /// service = 'AmazonRDS'`. Empty matches every row. May not reference another
    /// virtual tag.
    public var query: String?
    public var description: String?
    /// Inclusive UTC day the rule starts applying; null for no start.
    public var startsOn: String?
    /// Inclusive UTC day the rule stops applying; null for no end.
    public var endsOn: String?
    /// `value`: a fixed value. `tag`: copy the value from the first present
    /// provider tag key in `sources` (key collapsing). `split`: divide the row
    /// across `allocations` by percentage. `metric_split`: divide it in
    /// proportion to business metrics, day by day.
    public var kind: Kind
    /// `value` only.
    public var value: String?
    /// `tag` only.
    public var sources: [VirtualTagSource]?
    /// `tag` only. Case fold applied to the copied value before the prefix.
    public var valueTransform: ValueTransform?
    /// `split` and `metric_split` only; at least two.
    public var allocations: [VirtualTagAllocation]?

    public init(
        query: String? = nil,
        description: String? = nil,
        startsOn: String? = nil,
        endsOn: String? = nil,
        kind: Kind,
        value: String? = nil,
        sources: [VirtualTagSource]? = nil,
        valueTransform: ValueTransform? = nil,
        allocations: [VirtualTagAllocation]? = nil
    ) {
        self.query = query
        self.description = description
        self.startsOn = startsOn
        self.endsOn = endsOn
        self.kind = kind
        self.value = value
        self.sources = sources
        self.valueTransform = valueTransform
        self.allocations = allocations
    }
}
