/*
 * InfrawrenchSDK v1.67.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.67.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct KubernetesNetworkRow: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case workload
        case namespace
        case node
        case truncated
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "workload": self = .workload
            case "namespace": self = .namespace
            case "node": self = .node
            case "truncated": self = .truncated
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .workload: return "workload"
            case .namespace: return "namespace"
            case .node: return "node"
            case .truncated: return "truncated"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .workload,
            .namespace,
            .node,
            .truncated,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Method: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case flowLog
        case inClusterFlows
        case counterEstimate
        case value4
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "flow_log": self = .flowLog
            case "in_cluster_flows": self = .inClusterFlows
            case "counter_estimate": self = .counterEstimate
            case "": self = .value4
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .flowLog: return "flow_log"
            case .inClusterFlows: return "in_cluster_flows"
            case .counterEstimate: return "counter_estimate"
            case .value4: return ""
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Method] = [
            .flowLog,
            .inClusterFlows,
            .counterEstimate,
            .value4,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var key: String
    public var label: String
    public var namespace: String
    public var kind: Kind
    public var bytes: Double
    /// Bytes × the published rate for each boundary crossed.
    public var estimatedCost: Double
    /// This row's share of the cluster's billed data transfer. Null when no
    /// billed source is configured. The rows never add up to more than was
    /// billed.
    public var allocatedCost: Double?
    /// Bytes by boundary.
    public var byScope: [String: Double]
    /// How the bytes and boundary were established, strongest first: `flow_log`
    /// (the cloud's VPC flow log for the node, split across its pods by their
    /// counters), `in_cluster_flows` (Cilium Hubble named the peers; the boundary
    /// follows from where they run), `counter_estimate` (the kubelet's per-pod
    /// byte counter alone, no destination, boundary unknown). Empty for residual
    /// rows.
    public var method: Method

    public init(
        key: String,
        label: String,
        namespace: String,
        kind: Kind,
        bytes: Double,
        estimatedCost: Double,
        allocatedCost: Double? = nil,
        byScope: [String: Double],
        method: Method
    ) {
        self.key = key
        self.label = label
        self.namespace = namespace
        self.kind = kind
        self.bytes = bytes
        self.estimatedCost = estimatedCost
        self.allocatedCost = allocatedCost
        self.byScope = byScope
        self.method = method
    }
}
