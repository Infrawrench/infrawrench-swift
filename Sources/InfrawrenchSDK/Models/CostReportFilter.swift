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

public struct CostReportFilter: Codable, Hashable, Sendable {
    public enum Dimension: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case provider
        case account
        case service
        case region
        case resource
        case tag
        case chargeType
        case commitment
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "provider": self = .provider
            case "account": self = .account
            case "service": self = .service
            case "region": self = .region
            case "resource": self = .resource
            case "tag": self = .tag
            case "charge_type": self = .chargeType
            case "commitment": self = .commitment
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .provider: return "provider"
            case .account: return "account"
            case .service: return "service"
            case .region: return "region"
            case .resource: return "resource"
            case .tag: return "tag"
            case .chargeType: return "charge_type"
            case .commitment: return "commitment"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Dimension] = [
            .provider,
            .account,
            .service,
            .region,
            .resource,
            .tag,
            .chargeType,
            .commitment,
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

    public var dimension: Dimension
    public var op: Op
    public var values: [String]
    public var tagKey: String?

    public init(
        dimension: Dimension,
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
