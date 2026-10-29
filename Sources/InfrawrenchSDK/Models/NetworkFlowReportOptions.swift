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

public struct NetworkFlowReportOptions: Codable, Hashable, Sendable {
    public struct Account2: Codable, Hashable, Sendable {
        public var id: String
        public var name: String
        public var pluginId: String
        /// True for a Kubernetes cluster, whose traffic is only read when named.
        public var recut: Bool

        public init(
            id: String,
            name: String,
            pluginId: String,
            recut: Bool
        ) {
            self.id = id
            self.name = name
            self.pluginId = pluginId
            self.recut = recut
        }
    }

    public struct Endpoint: Codable, Hashable, Sendable {
        public enum Side: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case source
            case destination
            case both
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "source": self = .source
                case "destination": self = .destination
                case "both": self = .both
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .source: return "source"
                case .destination: return "destination"
                case .both: return "both"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Side] = [
                .source,
                .destination,
                .both,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var ref: String
        public var label: String
        public var resourceTypeId: String
        public var side: Side

        public init(
            ref: String,
            label: String,
            resourceTypeId: String,
            side: Side
        ) {
            self.ref = ref
            self.label = label
            self.resourceTypeId = resourceTypeId
            self.side = side
        }
    }

    public var accounts: [Account2]
    public var networks: [String]
    public var regions: [String]
    public var zones: [String]
    public var services: [String]
    public var resourceTypes: [String]
    public var endpoints: [Endpoint]
    public var trafficClasses: [NetworkFlowTrafficClass]

    public init(
        accounts: [Account2],
        networks: [String],
        regions: [String],
        zones: [String],
        services: [String],
        resourceTypes: [String],
        endpoints: [Endpoint],
        trafficClasses: [NetworkFlowTrafficClass]
    ) {
        self.accounts = accounts
        self.networks = networks
        self.regions = regions
        self.zones = zones
        self.services = services
        self.resourceTypes = resourceTypes
        self.endpoints = endpoints
        self.trafficClasses = trafficClasses
    }
}
