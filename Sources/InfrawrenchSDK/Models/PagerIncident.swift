/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PagerIncident: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case triggered
        case acknowledged
        case resolved
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "triggered": self = .triggered
            case "acknowledged": self = .acknowledged
            case "resolved": self = .resolved
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .triggered: return "triggered"
            case .acknowledged: return "acknowledged"
            case .resolved: return "resolved"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .triggered,
            .acknowledged,
            .resolved,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Assignee: Codable, Hashable, Sendable {
        public var name: String?
        public var email: String?

        public init(
            name: String? = nil,
            email: String? = nil
        ) {
            self.name = name
            self.email = email
        }
    }

    /// Infrawrench's id for the mirrored incident.
    public var id: String
    public var accountId: String
    public var accountName: String
    public var pluginId: String
    public var externalId: String
    public var reference: String?
    public var title: String
    public var status: Status
    public var statusLabel: String?
    public var urgency: String?
    public var url: String?
    public var serviceName: String?
    public var assignees: [Assignee]
    public var createdAt: String
    public var updatedAt: String?
    public var resolvedAt: String?
    /// True when an Infrawrench alert opened this incident.
    public var fromInfrawrench: Bool
    public var canAcknowledge: Bool
    public var canResolve: Bool

    public init(
        id: String,
        accountId: String,
        accountName: String,
        pluginId: String,
        externalId: String,
        reference: String? = nil,
        title: String,
        status: Status,
        statusLabel: String? = nil,
        urgency: String? = nil,
        url: String? = nil,
        serviceName: String? = nil,
        assignees: [Assignee],
        createdAt: String,
        updatedAt: String? = nil,
        resolvedAt: String? = nil,
        fromInfrawrench: Bool,
        canAcknowledge: Bool,
        canResolve: Bool
    ) {
        self.id = id
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.externalId = externalId
        self.reference = reference
        self.title = title
        self.status = status
        self.statusLabel = statusLabel
        self.urgency = urgency
        self.url = url
        self.serviceName = serviceName
        self.assignees = assignees
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.resolvedAt = resolvedAt
        self.fromInfrawrench = fromInfrawrench
        self.canAcknowledge = canAcknowledge
        self.canResolve = canResolve
    }
}
