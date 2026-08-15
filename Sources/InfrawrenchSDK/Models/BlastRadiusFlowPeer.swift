/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BlastRadiusFlowPeer: Codable, Hashable, Sendable {
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

    /// The peer's flow ref — a provider resource id, or a class token like
    /// `internet`.
    public var ref: String
    public var label: String
    /// Relative to the resource being deleted, not to the row the provider
    /// captured.
    public var direction: Direction
    /// The boundary the traffic crossed.
    public var scope: String
    public var bytes: Double
    public var estimatedCost: Double
    public var currency: String
    /// Days in the window this peer appeared on — a spike versus a standing flow.
    public var days: Int
    public var resourceId: ResourceId?

    public init(
        ref: String,
        label: String,
        direction: Direction,
        scope: String,
        bytes: Double,
        estimatedCost: Double,
        currency: String,
        days: Int,
        resourceId: ResourceId? = nil
    ) {
        self.ref = ref
        self.label = label
        self.direction = direction
        self.scope = scope
        self.bytes = bytes
        self.estimatedCost = estimatedCost
        self.currency = currency
        self.days = days
        self.resourceId = resourceId
    }
}
