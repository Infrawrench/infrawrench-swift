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

public struct ResourceLease: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case active
        case deleted
        case failed
        case canceled
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "active": self = .active
            case "deleted": self = .deleted
            case "failed": self = .failed
            case "canceled": self = .canceled
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .active: return "active"
            case .deleted: return "deleted"
            case .failed: return "failed"
            case .canceled: return "canceled"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .active,
            .deleted,
            .failed,
            .canceled,
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
    /// Infrawrench resource id the lease is attached to.
    public var resourceId: String
    public var accountId: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    /// Resource display name (denormalized at lease time, so it survives
    /// deletion).
    public var resourceName: String
    public var accountName: String
    /// The lease deadline.
    public var expiresAt: String
    /// Whether the resource is deleted at expiry. Auto-delete is announced twice
    /// before it fires and deferred while an org change freeze is in effect.
    public var autoDelete: Bool
    /// Why/who-for; shown on the expiry radar.
    public var note: String?
    /// Lease lifecycle: `active` (counting down), `deleted` (auto-delete
    /// completed), `failed` (auto-delete was retried and given up on — see
    /// `lastError`), or `canceled` (called off; the resource stays).
    public var status: Status
    /// When the first auto-delete announcement went out; null until sent.
    public var firstWarningAt: String?
    /// When the final auto-delete announcement went out; null until sent.
    public var finalWarningAt: String?
    public var deleteAttempts: Int
    /// Last auto-delete failure or freeze-deferral detail; never silent.
    public var lastError: String?
    /// When the lease reached a terminal status.
    public var completedAt: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        resourceId: String,
        accountId: String,
        pluginId: PluginId,
        resourceTypeId: String,
        resourceName: String,
        accountName: String,
        expiresAt: String,
        autoDelete: Bool,
        note: String? = nil,
        status: Status,
        firstWarningAt: String? = nil,
        finalWarningAt: String? = nil,
        deleteAttempts: Int,
        lastError: String? = nil,
        completedAt: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.resourceId = resourceId
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.resourceName = resourceName
        self.accountName = accountName
        self.expiresAt = expiresAt
        self.autoDelete = autoDelete
        self.note = note
        self.status = status
        self.firstWarningAt = firstWarningAt
        self.finalWarningAt = finalWarningAt
        self.deleteAttempts = deleteAttempts
        self.lastError = lastError
        self.completedAt = completedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
