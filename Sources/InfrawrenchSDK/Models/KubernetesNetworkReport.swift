/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct KubernetesNetworkReport: Codable, Hashable, Sendable {
    public struct Range: Codable, Hashable, Sendable {
        public var from: String
        public var to: String

        public init(
            from: String,
            to: String
        ) {
            self.from = from
            self.to = to
        }
    }

    public struct Totals: Codable, Hashable, Sendable {
        public var bytes: Double
        public var estimatedCost: Double
        public var allocatedCost: Double?
        /// Billed money no observed traffic accounted for. Never spread across
        /// rows.
        public var unallocatedCost: Double?

        public init(
            bytes: Double,
            estimatedCost: Double,
            allocatedCost: Double? = nil,
            unallocatedCost: Double? = nil
        ) {
            self.bytes = bytes
            self.estimatedCost = estimatedCost
            self.allocatedCost = allocatedCost
            self.unallocatedCost = unallocatedCost
        }
    }

    public struct Billed: Codable, Hashable, Sendable {
        public enum Basis: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case cost
            case bytes
            case none
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "cost": self = .cost
                case "bytes": self = .bytes
                case "none": self = .none
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .cost: return "cost"
                case .bytes: return "bytes"
                case .none: return "none"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Basis] = [
                .cost,
                .bytes,
                .none,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var query: String?
        public var error: String?
        public var billedCost: Double?
        /// `cost`: apportioned by list-priced traffic. `bytes`: nothing in the
        /// range could be priced, so apportioned by bytes alone (weakest).
        /// `none`: nothing apportioned.
        public var basis: Basis
        public var scaledDays: Int
        public var daysWithoutBilled: Int

        public init(
            query: String? = nil,
            error: String? = nil,
            billedCost: Double? = nil,
            basis: Basis,
            scaledDays: Int,
            daysWithoutBilled: Int
        ) {
            self.query = query
            self.error = error
            self.billedCost = billedCost
            self.basis = basis
            self.scaledDays = scaledDays
            self.daysWithoutBilled = daysWithoutBilled
        }
    }

    public struct Scope: Codable, Hashable, Sendable {
        public enum Scope2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case intraZone
            case crossZone
            case crossRegion
            case internetEgress
            case internetIngress
            case providerService
            case natGateway
            case privateInterconnect
            case unknown
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "intra_zone": self = .intraZone
                case "cross_zone": self = .crossZone
                case "cross_region": self = .crossRegion
                case "internet_egress": self = .internetEgress
                case "internet_ingress": self = .internetIngress
                case "provider_service": self = .providerService
                case "nat_gateway": self = .natGateway
                case "private_interconnect": self = .privateInterconnect
                case "unknown": self = .unknown
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .intraZone: return "intra_zone"
                case .crossZone: return "cross_zone"
                case .crossRegion: return "cross_region"
                case .internetEgress: return "internet_egress"
                case .internetIngress: return "internet_ingress"
                case .providerService: return "provider_service"
                case .natGateway: return "nat_gateway"
                case .privateInterconnect: return "private_interconnect"
                case .unknown: return "unknown"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Scope2] = [
                .intraZone,
                .crossZone,
                .crossRegion,
                .internetEgress,
                .internetIngress,
                .providerService,
                .natGateway,
                .privateInterconnect,
                .unknown,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        /// Which billing boundary the traffic crossed. `unknown` means the
        /// provider's record did not determine one; it is priced at zero and
        /// labelled rather than folded into a neighbouring boundary.
        public var scope: Scope2
        public var bytes: Double
        public var estimatedCost: Double
        public var allocatedCost: Double?

        public init(
            scope: Scope2,
            bytes: Double,
            estimatedCost: Double,
            allocatedCost: Double? = nil
        ) {
            self.scope = scope
            self.bytes = bytes
            self.estimatedCost = estimatedCost
            self.allocatedCost = allocatedCost
        }
    }

    public struct Method: Codable, Hashable, Sendable {
        public enum Method2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case flowLog
            case inClusterFlows
            case counterEstimate
            case value4
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
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
            public static let allKnownCases: [Method2] = [
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

        /// How the bytes and boundary were established, strongest first:
        /// `flow_log` (the cloud's VPC flow log for the node, split across its
        /// pods by their counters), `in_cluster_flows` (Cilium Hubble named the
        /// peers; the boundary follows from where they run), `counter_estimate`
        /// (the kubelet's per-pod byte counter alone, no destination, boundary
        /// unknown). Empty for residual rows.
        public var method: Method2
        public var bytes: Double

        public init(
            method: Method2,
            bytes: Double
        ) {
            self.method = method
            self.bytes = bytes
        }
    }

    public var accountId: String
    public var displayName: String
    public var range: Range
    public var estimated: Bool
    public var currency: String
    public var totals: Totals
    public var billed: Billed
    public var scopes: [Scope]
    public var methods: [Method]
    public var namespaces: [KubernetesNetworkRow]
    public var workloads: [KubernetesNetworkRow]
    public var topTalkers: [NetworkFlowPair]
    public var collection: NetworkFlowAccountStatus?

    public init(
        accountId: String,
        displayName: String,
        range: Range,
        estimated: Bool,
        currency: String,
        totals: Totals,
        billed: Billed,
        scopes: [Scope],
        methods: [Method],
        namespaces: [KubernetesNetworkRow],
        workloads: [KubernetesNetworkRow],
        topTalkers: [NetworkFlowPair],
        collection: NetworkFlowAccountStatus? = nil
    ) {
        self.accountId = accountId
        self.displayName = displayName
        self.range = range
        self.estimated = estimated
        self.currency = currency
        self.totals = totals
        self.billed = billed
        self.scopes = scopes
        self.methods = methods
        self.namespaces = namespaces
        self.workloads = workloads
        self.topTalkers = topTalkers
        self.collection = collection
    }
}
