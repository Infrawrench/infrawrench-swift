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

public struct KubernetesEfficiencyFilter: Codable, Hashable, Sendable {
    public enum Dimension: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case account
        case region
        case tag
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "account": self = .account
            case "region": self = .region
            case "tag": self = .tag
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .account: return "account"
            case .region: return "region"
            case .tag: return "tag"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Dimension] = [
            .account,
            .region,
            .tag,
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

    /// `account` is a Kubernetes cluster (its connected account id). `tag` covers
    /// namespace, workload, workload_kind, node_pool, capacity_type,
    /// instance_type, zone and the `k8s_pod_label:`, `k8s_node_label:` and
    /// `k8s_pvc_label:` labels.
    public var dimension: Dimension
    public var op: Op
    public var values: [String]
    /// Required when `dimension` is `tag`.
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
