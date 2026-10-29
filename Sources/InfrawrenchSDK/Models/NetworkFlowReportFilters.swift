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

/// Lists AND-compose; values within a list OR. An absent or empty list does not
/// filter. Without `accountIds`, Kubernetes cluster traffic is left out (it
/// re-cuts bytes a cloud flow log already counts); naming a cluster's account
/// includes it.
public struct NetworkFlowReportFilters: Codable, Hashable, Sendable {
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

    public var accountIds: [String]?
    /// VPC / network ids, matched at either end.
    public var networks: [String]?
    /// Provider regions, matched at either end.
    public var regions: [String]?
    /// Availability zone ids, matched at either end.
    public var zones: [String]?
    /// Source endpoint refs, as `report-options` lists them.
    public var sourceRefs: [String]?
    /// Destination endpoint refs, as `report-options` lists them.
    public var destinationRefs: [String]?
    /// The peer's provider service (`s3`, `dynamodb`).
    public var services: [String]?
    /// The peer's resource type id.
    public var resourceTypes: [String]?
    public var trafficClasses: [NetworkFlowTrafficClass]?
    public var directions: [Direction]?

    public init(
        accountIds: [String]? = nil,
        networks: [String]? = nil,
        regions: [String]? = nil,
        zones: [String]? = nil,
        sourceRefs: [String]? = nil,
        destinationRefs: [String]? = nil,
        services: [String]? = nil,
        resourceTypes: [String]? = nil,
        trafficClasses: [NetworkFlowTrafficClass]? = nil,
        directions: [Direction]? = nil
    ) {
        self.accountIds = accountIds
        self.networks = networks
        self.regions = regions
        self.zones = zones
        self.sourceRefs = sourceRefs
        self.destinationRefs = destinationRefs
        self.services = services
        self.resourceTypes = resourceTypes
        self.trafficClasses = trafficClasses
        self.directions = directions
    }
}
