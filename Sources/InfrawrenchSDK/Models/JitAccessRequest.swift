/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JitAccessRequest: Codable, Hashable, Sendable {
    public enum PrincipalKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case user
        case group
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "user": self = .user
            case "group": self = .group
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .user: return "user"
            case .group: return "group"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [PrincipalKind] = [
            .user,
            .group,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum EndReason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case expired
        case revoked
        case grantFailed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "expired": self = .expired
            case "revoked": self = .revoked
            case "grant_failed": self = .grantFailed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .expired: return "expired"
            case .revoked: return "revoked"
            case .grantFailed: return "grant_failed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [EndReason] = [
            .expired,
            .revoked,
            .grantFailed,
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
    public var policyId: String?
    public var policyName: String?
    public var accountId: String
    public var accountName: String?
    public var pluginId: String
    public var scopeId: String
    public var scopeName: String
    public var roleId: String
    public var roleName: String
    public var userId: String
    public var userName: String?
    public var principalId: String
    public var principalName: String
    public var principalKind: PrincipalKind
    /// True when the principal was resolved from the requester's own email.
    public var principalMatched: Bool
    public var reason: String
    public var ticket: String?
    public var durationMinutes: Int
    public var status: JitRequestStatus
    public var requestExpiresAt: String
    public var decidedAt: String?
    public var decidedByUserId: String?
    public var decidedByName: String?
    public var decisionNote: String?
    public var selfApproved: Bool
    public var incidentId: String?
    public var grantedAt: String?
    public var grantExpiresAt: String?
    /// The principal already held the role; nothing was created and nothing is
    /// removed.
    public var preexisting: Bool
    public var extendedMinutes: Int
    public var endedAt: String?
    public var endedByName: String?
    public var endReason: EndReason?
    public var lastError: String?
    public var revokeAttempts: Int
    public var createdAt: String
    public var canDecide: Bool
    public var canCancel: Bool
    public var canExtend: Bool
    public var canRevoke: Bool

    public init(
        id: String,
        policyId: String? = nil,
        policyName: String? = nil,
        accountId: String,
        accountName: String? = nil,
        pluginId: String,
        scopeId: String,
        scopeName: String,
        roleId: String,
        roleName: String,
        userId: String,
        userName: String? = nil,
        principalId: String,
        principalName: String,
        principalKind: PrincipalKind,
        principalMatched: Bool,
        reason: String,
        ticket: String? = nil,
        durationMinutes: Int,
        status: JitRequestStatus,
        requestExpiresAt: String,
        decidedAt: String? = nil,
        decidedByUserId: String? = nil,
        decidedByName: String? = nil,
        decisionNote: String? = nil,
        selfApproved: Bool,
        incidentId: String? = nil,
        grantedAt: String? = nil,
        grantExpiresAt: String? = nil,
        preexisting: Bool,
        extendedMinutes: Int,
        endedAt: String? = nil,
        endedByName: String? = nil,
        endReason: EndReason? = nil,
        lastError: String? = nil,
        revokeAttempts: Int,
        createdAt: String,
        canDecide: Bool,
        canCancel: Bool,
        canExtend: Bool,
        canRevoke: Bool
    ) {
        self.id = id
        self.policyId = policyId
        self.policyName = policyName
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.scopeId = scopeId
        self.scopeName = scopeName
        self.roleId = roleId
        self.roleName = roleName
        self.userId = userId
        self.userName = userName
        self.principalId = principalId
        self.principalName = principalName
        self.principalKind = principalKind
        self.principalMatched = principalMatched
        self.reason = reason
        self.ticket = ticket
        self.durationMinutes = durationMinutes
        self.status = status
        self.requestExpiresAt = requestExpiresAt
        self.decidedAt = decidedAt
        self.decidedByUserId = decidedByUserId
        self.decidedByName = decidedByName
        self.decisionNote = decisionNote
        self.selfApproved = selfApproved
        self.incidentId = incidentId
        self.grantedAt = grantedAt
        self.grantExpiresAt = grantExpiresAt
        self.preexisting = preexisting
        self.extendedMinutes = extendedMinutes
        self.endedAt = endedAt
        self.endedByName = endedByName
        self.endReason = endReason
        self.lastError = lastError
        self.revokeAttempts = revokeAttempts
        self.createdAt = createdAt
        self.canDecide = canDecide
        self.canCancel = canCancel
        self.canExtend = canExtend
        self.canRevoke = canRevoke
    }
}
