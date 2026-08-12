/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentInstanceMember: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case created
        case failed
        case deleted
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "created": self = .created
            case "failed": self = .failed
            case "deleted": self = .deleted
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .created: return "created"
            case .failed: return "failed"
            case .deleted: return "deleted"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .pending,
            .created,
            .failed,
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

    public var id: String
    public var memberKey: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    public var accountId: String
    public var resourceId: String?
    public var externalId: String?
    public var displayName: String
    public var status: Status
    public var error: String?
    /// The lease that auto-deletes this member at the TTL.
    public var leaseId: String?
    public var position: Int

    public init(
        id: String,
        memberKey: String,
        pluginId: PluginId,
        resourceTypeId: String,
        accountId: String,
        resourceId: String? = nil,
        externalId: String? = nil,
        displayName: String,
        status: Status,
        error: String? = nil,
        leaseId: String? = nil,
        position: Int
    ) {
        self.id = id
        self.memberKey = memberKey
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.resourceId = resourceId
        self.externalId = externalId
        self.displayName = displayName
        self.status = status
        self.error = error
        self.leaseId = leaseId
        self.position = position
    }
}
