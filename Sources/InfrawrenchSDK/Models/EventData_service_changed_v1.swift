/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `service.changed` event, version 1. A service in the catalog was
/// created, edited, deleted, or had resources added or removed.
public struct EventData_service_changed_v1: Codable, Hashable, Sendable {
    public enum Action: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case created
        case updated
        case deleted
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "created": self = .created
            case "updated": self = .updated
            case "deleted": self = .deleted
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .created: return "created"
            case .updated: return "updated"
            case .deleted: return "deleted"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Action] = [
            .created,
            .updated,
            .deleted,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// What happened to the service.
    public var action: Action
    /// Service id.
    public var serviceId: String
    /// The service's slug.
    public var slug: String
    /// Service name.
    public var name: String
    /// Tier 1 (most critical) to 4; null when untiered.
    public var tier: Int?
    /// Free-text owning team.
    public var ownerTeam: String?
    /// Fields the change touched: the edited service fields, or `members` for a
    /// membership change. Empty on create and delete.
    public var changedFields: [String]

    public init(
        action: Action,
        serviceId: String,
        slug: String,
        name: String,
        tier: Int? = nil,
        ownerTeam: String? = nil,
        changedFields: [String]
    ) {
        self.action = action
        self.serviceId = serviceId
        self.slug = slug
        self.name = name
        self.tier = tier
        self.ownerTeam = ownerTeam
        self.changedFields = changedFields
    }
}
