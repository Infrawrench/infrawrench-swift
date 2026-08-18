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

public struct NetworkFlowPair: Codable, Hashable, Sendable {
    public enum Scope: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case intraZone
        case crossZone
        case crossRegion
        case internetEgress
        case internetIngress
        case providerService
        case natGateway
        case privateInterconnect
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
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
        public static let allKnownCases: [Scope] = [
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

    public enum Direction: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case egress
        case ingress
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "egress": self = .egress
            case "ingress": self = .ingress
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .egress: return "egress"
            case .ingress: return "ingress"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Direction] = [
            .egress,
            .ingress,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Attribution: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case resolved
        case unattributed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "resolved": self = .resolved
            case "unattributed": self = .unattributed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .resolved: return "resolved"
            case .unattributed: return "unattributed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Attribution] = [
            .resolved,
            .unattributed,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var source: NetworkFlowEndpoint
    public var destination: NetworkFlowEndpoint
    /// Which billing boundary the traffic crossed. `unknown` means the provider's
    /// record did not determine one — it is priced at zero and labelled rather
    /// than folded into a neighbouring boundary.
    public var scope: Scope
    public var direction: Direction
    public var attribution: Attribution
    public var bytes: Double
    public var packets: Double
    public var estimatedCost: Double
    public var currency: String
    public var accountId: String
    public var pluginId: String
    /// Days in the range this pair appeared on.
    public var days: Int

    public init(
        source: NetworkFlowEndpoint,
        destination: NetworkFlowEndpoint,
        scope: Scope,
        direction: Direction,
        attribution: Attribution,
        bytes: Double,
        packets: Double,
        estimatedCost: Double,
        currency: String,
        accountId: String,
        pluginId: String,
        days: Int
    ) {
        self.source = source
        self.destination = destination
        self.scope = scope
        self.direction = direction
        self.attribution = attribution
        self.bytes = bytes
        self.packets = packets
        self.estimatedCost = estimatedCost
        self.currency = currency
        self.accountId = accountId
        self.pluginId = pluginId
        self.days = days
    }
}
