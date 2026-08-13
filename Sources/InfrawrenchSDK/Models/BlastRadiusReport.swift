/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BlastRadiusReport: Codable, Hashable, Sendable {
    public struct FlowTotals: Codable, Hashable, Sendable {
        public var bytes: Double
        public var estimatedCost: Double
        public var currency: String

        public init(
            bytes: Double,
            estimatedCost: Double,
            currency: String
        ) {
            self.bytes = bytes
            self.estimatedCost = estimatedCost
            self.currency = currency
        }
    }

    public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case none
        case low
        case medium
        case high
        case unknown
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "none": self = .none
            case "low": self = .low
            case "medium": self = .medium
            case "high": self = .high
            case "unknown": self = .unknown
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .none: return "none"
            case .low: return "low"
            case .medium: return "medium"
            case .high: return "high"
            case .unknown: return "unknown"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Severity] = [
            .none,
            .low,
            .medium,
            .high,
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

    public var resourceId: ResourceId
    public var resource: BlastRadiusNode?
    /// Affected resources, direct first then by depth.
    public var dependants: [BlastRadiusDependant]
    public var directCount: Int
    public var transitiveCount: Int
    /// Objects naming the resource without depending on it, user-facing ones
    /// first.
    public var references: [BlastRadiusReference]
    /// Measured network peers over the last 14 days, heaviest first. Empty when
    /// flow collection is off — see `unchecked`.
    public var flowPeers: [BlastRadiusFlowPeer]
    /// Totals over `flowPeers`, or null when traffic could not be measured at
    /// all. Zeroed totals mean collection is on and the resource is quiet; null
    /// means nobody looked.
    public var flowTotals: FlowTotals?
    /// What the report could not look at. An empty `dependants` list with a
    /// non-empty `unchecked` list is not a clean bill of health, and surfaces
    /// must not render it as one.
    public var unchecked: [BlastRadiusGap]
    /// `high` for anything user-facing or five or more direct dependants;
    /// `unknown` when nothing was found but something could not be checked.
    public var severity: Severity
    /// One sentence, ready to render.
    public var headline: String

    public init(
        resourceId: ResourceId,
        resource: BlastRadiusNode? = nil,
        dependants: [BlastRadiusDependant],
        directCount: Int,
        transitiveCount: Int,
        references: [BlastRadiusReference],
        flowPeers: [BlastRadiusFlowPeer],
        flowTotals: FlowTotals? = nil,
        unchecked: [BlastRadiusGap],
        severity: Severity,
        headline: String
    ) {
        self.resourceId = resourceId
        self.resource = resource
        self.dependants = dependants
        self.directCount = directCount
        self.transitiveCount = transitiveCount
        self.references = references
        self.flowPeers = flowPeers
        self.flowTotals = flowTotals
        self.unchecked = unchecked
        self.severity = severity
        self.headline = headline
    }
}
