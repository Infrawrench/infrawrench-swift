/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DiscoveredTagKey: Codable, Hashable, Sendable {
    public enum Source: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case costs
        case resources
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "costs": self = .costs
            case "resources": self = .resources
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .costs: return "costs"
            case .resources: return "resources"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Source] = [
            .costs,
            .resources,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var key: String
    /// Plugin ids whose cost rows or resources carry the key.
    public var providers: [String]
    public var sources: [Source]
    /// Cost rows in the lookback window carrying the key.
    public var costRowCount: Int
    /// Distinct billed resource ids among those rows.
    public var costResourceCount: Int
    /// Synced resources whose tags or labels carry the key (newest 2,000
    /// scanned).
    public var inventoryCount: Int
    /// Most recent cost day carrying the key; null when only in the inventory.
    public var lastSeen: String?
    public var hidden: Bool
    /// The hidden entry (exact key or prefix pattern) that matched.
    public var hiddenBy: String?
    public var preferred: Bool

    public init(
        key: String,
        providers: [String],
        sources: [Source],
        costRowCount: Int,
        costResourceCount: Int,
        inventoryCount: Int,
        lastSeen: String? = nil,
        hidden: Bool,
        hiddenBy: String? = nil,
        preferred: Bool
    ) {
        self.key = key
        self.providers = providers
        self.sources = sources
        self.costRowCount = costRowCount
        self.costResourceCount = costResourceCount
        self.inventoryCount = inventoryCount
        self.lastSeen = lastSeen
        self.hidden = hidden
        self.hiddenBy = hiddenBy
        self.preferred = preferred
    }
}
