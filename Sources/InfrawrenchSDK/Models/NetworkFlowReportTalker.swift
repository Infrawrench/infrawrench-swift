/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowReportTalker: Codable, Hashable, Sendable {
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

    public var source: NetworkFlowReportEndpoint
    public var destination: NetworkFlowReportEndpoint
    public var scope: NetworkFlowTrafficClass
    public var direction: Direction
    public var attribution: Attribution
    public var bytes: Double
    public var packets: Double
    public var estimatedCost: Double
    public var currency: String
    public var accountId: String
    public var accountName: String
    public var pluginId: String
    /// Days in the window the pair appeared on.
    public var days: Int
    /// True when the pair's bytes came from a sampled flow source.
    public var sampled: Bool

    public init(
        source: NetworkFlowReportEndpoint,
        destination: NetworkFlowReportEndpoint,
        scope: NetworkFlowTrafficClass,
        direction: Direction,
        attribution: Attribution,
        bytes: Double,
        packets: Double,
        estimatedCost: Double,
        currency: String,
        accountId: String,
        accountName: String,
        pluginId: String,
        days: Int,
        sampled: Bool
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
        self.accountName = accountName
        self.pluginId = pluginId
        self.days = days
        self.sampled = sampled
    }
}
