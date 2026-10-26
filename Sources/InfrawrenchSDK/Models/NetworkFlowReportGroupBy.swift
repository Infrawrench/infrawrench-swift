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

/// Pair-shaped groupings (`pair`, `zone_pair`, `region_pair`) key on source then
/// destination, joined by U+001F. `service` is the peer's provider service (the
/// destination of egress, the source of ingress); `network` is the local side's
/// VPC. Under `pair`, `source` and `destination` the per-day remainder below the
/// stored pair cap is its own group, keyed `infrawrench:truncated`.
public enum NetworkFlowReportGroupBy: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case none
    case pair
    case source
    case destination
    case trafficClass
    case service
    case zonePair
    case regionPair
    case account
    case network
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "none": self = .none
        case "pair": self = .pair
        case "source": self = .source
        case "destination": self = .destination
        case "traffic_class": self = .trafficClass
        case "service": self = .service
        case "zone_pair": self = .zonePair
        case "region_pair": self = .regionPair
        case "account": self = .account
        case "network": self = .network
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .none: return "none"
        case .pair: return "pair"
        case .source: return "source"
        case .destination: return "destination"
        case .trafficClass: return "traffic_class"
        case .service: return "service"
        case .zonePair: return "zone_pair"
        case .regionPair: return "region_pair"
        case .account: return "account"
        case .network: return "network"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [NetworkFlowReportGroupBy] = [
        .none,
        .pair,
        .source,
        .destination,
        .trafficClass,
        .service,
        .zonePair,
        .regionPair,
        .account,
        .network,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
