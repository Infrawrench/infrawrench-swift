/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceReportTagFilter: Codable, Hashable, Sendable {
    public enum Source: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case tag
        case virtualTag
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "tag": self = .tag
            case "virtual_tag": self = .virtualTag
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .tag: return "tag"
            case .virtualTag: return "virtual_tag"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Source] = [
            .tag,
            .virtualTag,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case `in`
        case notIn
        case exists
        case missing
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "in": self = .`in`
            case "not_in": self = .notIn
            case "exists": self = .exists
            case "missing": self = .missing
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .`in`: return "in"
            case .notIn: return "not_in"
            case .exists: return "exists"
            case .missing: return "missing"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Op] = [
            .`in`,
            .notIn,
            .exists,
            .missing,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Provider tags (from the resource) or virtual tags (from its cost rows).
    public var source: Source
    public var key: String
    /// `exists` and `missing` take no values; `in` and `not_in` need at least
    /// one.
    public var op: Op
    public var values: [String]

    public init(
        source: Source,
        key: String,
        op: Op,
        values: [String]
    ) {
        self.source = source
        self.key = key
        self.op = op
        self.values = values
    }
}
