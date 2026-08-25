/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowScopeSummary: Codable, Hashable, Sendable {
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

    /// Which billing boundary the traffic crossed. `unknown` means the provider's
    /// record did not determine one — it is priced at zero and labelled rather
    /// than folded into a neighbouring boundary.
    public var scope: Scope
    public var direction: Direction
    public var bytes: Double
    public var estimatedCost: Double
    public var currency: String
    public var crossedZone: Bool
    public var crossedRegion: Bool
    public var leftCloud: Bool
    /// Bytes inside `bytes` whose endpoints could not be tied to a workload. A
    /// subset, not an addition — nothing here has been apportioned across the
    /// attributed rows.
    public var unattributedBytes: Double
    /// Bytes inside `bytes` that fell below the stored top-N pair cap, computed
    /// by subtraction against the provider's exact totals rather than estimated.
    public var truncatedBytes: Double

    public init(
        scope: Scope,
        direction: Direction,
        bytes: Double,
        estimatedCost: Double,
        currency: String,
        crossedZone: Bool,
        crossedRegion: Bool,
        leftCloud: Bool,
        unattributedBytes: Double,
        truncatedBytes: Double
    ) {
        self.scope = scope
        self.direction = direction
        self.bytes = bytes
        self.estimatedCost = estimatedCost
        self.currency = currency
        self.crossedZone = crossedZone
        self.crossedRegion = crossedRegion
        self.leftCloud = leftCloud
        self.unattributedBytes = unattributedBytes
        self.truncatedBytes = truncatedBytes
    }
}
