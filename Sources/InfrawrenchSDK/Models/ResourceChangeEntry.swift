/*
 * InfrawrenchSDK v0.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceChangeEntry: Codable, Hashable, Sendable {
    public enum Origin: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case schedule
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "schedule": self = .schedule
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .schedule: return "schedule"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Origin] = [
            .schedule,
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
    public var resourceId: ResourceId
    public var accountId: String
    public var pluginId: String
    public var resourceTypeId: String
    /// Resource display name at the time of the change — survives deletion.
    public var displayName: String
    public var changeKind: ResourceChangeKind
    /// Changed fields for `updated` events; empty for `created` and `deleted`.
    public var diff: [ResourceFieldChange]
    /// Who caused the change when a non-sync writer knows: `schedule` for
    /// sleep/wake schedule transitions. Absent/null = observed by sync.
    public var origin: Origin?
    public var createdAt: String

    public init(
        id: String,
        resourceId: ResourceId,
        accountId: String,
        pluginId: String,
        resourceTypeId: String,
        displayName: String,
        changeKind: ResourceChangeKind,
        diff: [ResourceFieldChange],
        origin: Origin? = nil,
        createdAt: String
    ) {
        self.id = id
        self.resourceId = resourceId
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.displayName = displayName
        self.changeKind = changeKind
        self.diff = diff
        self.origin = origin
        self.createdAt = createdAt
    }
}
