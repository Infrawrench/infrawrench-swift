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

/// The billing boundary a flow crossed. Intra-region VPC peering is billed, and
/// classified, as `cross_zone`; transit gateway, VPN and interconnect traffic is
/// `private_interconnect`.
public enum NetworkFlowTrafficClass: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case intraZone
    case crossZone
    case crossRegion
    case internetEgress
    case internetIngress
    case natGateway
    case privateInterconnect
    case providerService
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
        case "nat_gateway": self = .natGateway
        case "private_interconnect": self = .privateInterconnect
        case "provider_service": self = .providerService
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
        case .natGateway: return "nat_gateway"
        case .privateInterconnect: return "private_interconnect"
        case .providerService: return "provider_service"
        case .unknown: return "unknown"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [NetworkFlowTrafficClass] = [
        .intraZone,
        .crossZone,
        .crossRegion,
        .internetEgress,
        .internetIngress,
        .natGateway,
        .privateInterconnect,
        .providerService,
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
