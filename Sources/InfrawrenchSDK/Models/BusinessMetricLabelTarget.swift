/*
 * InfrawrenchSDK v1.74.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Where a label's values live on the cost side. A `dimension` target matches
/// label values to dimension values exactly; `cost_centre` matches a centre by id
/// or, case-insensitively, by name.
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum BusinessMetricLabelTarget: Codable, Hashable, Sendable {
    public struct BusinessMetricLabelTargetObject: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case dimension
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "dimension": self = .dimension
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .dimension: return "dimension"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .dimension,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public enum Dimension: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case provider
            case account
            case service
            case region
            case resource
            case tag
            case chargeType
            case commitment
            case virtualTag
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
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
                case "virtual_tag": self = .virtualTag
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
                case .virtualTag: return "virtual_tag"
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

        public var kind: Kind
        public var dimension: Dimension
        /// Required for keyed dimensions (tags).
        public var tagKey: String?

        public init(
            kind: Kind,
            dimension: Dimension,
            tagKey: String? = nil
        ) {
            self.kind = kind
            self.dimension = dimension
            self.tagKey = tagKey
        }
    }

    public struct BusinessMetricLabelTargetObject2: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case costCentre
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "cost_centre": self = .costCentre
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .costCentre: return "cost_centre"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .costCentre,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind

        public init(
            kind: Kind
        ) {
            self.kind = kind
        }
    }

    case object(BusinessMetricLabelTargetObject)
    case object2(BusinessMetricLabelTargetObject2)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(BusinessMetricLabelTargetObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(BusinessMetricLabelTargetObject2.self) {
            self = .object2(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
