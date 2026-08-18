/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostFilter: Codable, Hashable, Sendable {
    public enum Op: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case `in`
        case notIn
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "in": self = .`in`
            case "not_in": self = .notIn
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .`in`: return "in"
            case .notIn: return "not_in"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Op] = [
            .`in`,
            .notIn,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var dimension: CostDimension
    public var op: Op
    public var values: [String]
    public var tagKey: String?

    public init(
        dimension: CostDimension,
        op: Op,
        values: [String],
        tagKey: String? = nil
    ) {
        self.dimension = dimension
        self.op = op
        self.values = values
        self.tagKey = tagKey
    }
}
