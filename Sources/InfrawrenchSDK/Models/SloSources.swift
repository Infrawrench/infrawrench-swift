/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SloSources: Codable, Hashable, Sendable {
    public struct Probe: Codable, Hashable, Sendable {
        public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case up
            case down
            case unknown
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "up": self = .up
                case "down": self = .down
                case "unknown": self = .unknown
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .up: return "up"
                case .down: return "down"
                case .unknown: return "unknown"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Status] = [
                .up,
                .down,
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

        public var id: String
        public var name: String
        public var url: String
        public var status: Status

        public init(
            id: String,
            name: String,
            url: String,
            status: Status
        ) {
            self.id = id
            self.name = name
            self.url = url
            self.status = status
        }
    }

    public struct MetricResource: Codable, Hashable, Sendable {
        public struct Sery: Codable, Hashable, Sendable {
            public var label: String
            public var unit: String

            public init(
                label: String,
                unit: String
            ) {
                self.label = label
                self.unit = unit
            }
        }

        public var resourceId: String
        public var displayName: String
        public var accountId: String
        public var pluginId: PluginId
        public var resourceTypeId: String
        public var series: [Sery]

        public init(
            resourceId: String,
            displayName: String,
            accountId: String,
            pluginId: PluginId,
            resourceTypeId: String,
            series: [Sery]
        ) {
            self.resourceId = resourceId
            self.displayName = displayName
            self.accountId = accountId
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.series = series
        }
    }

    public var probes: [Probe]
    public var metricResources: [MetricResource]

    public init(
        probes: [Probe],
        metricResources: [MetricResource]
    ) {
        self.probes = probes
        self.metricResources = metricResources
    }
}
