/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccessRequest: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case approved
        case denied
        case expired
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "approved": self = .approved
            case "denied": self = .denied
            case "expired": self = .expired
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .approved: return "approved"
            case .denied: return "denied"
            case .expired: return "expired"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .pending,
            .approved,
            .denied,
            .expired,
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
    public var userId: String
    public var userName: String?
    /// The permission strings being asked for.
    public var permissions: [String]
    public var reason: String
    /// How long the elevation lasts once granted.
    public var durationMinutes: Int
    /// `pending` (awaiting a decision), `approved`, `denied`, or `expired`
    /// (nobody decided in time, or the requester withdrew it). An approved row is
    /// only *granting* permissions while `active` is true.
    public var status: Status
    /// When an undecided request stops being decidable.
    public var expiresAt: String
    public var decidedAt: String?
    public var decidedByUserId: String?
    public var decidedByName: String?
    public var decisionNote: String?
    public var grantedAt: String?
    /// When the elevation lapses.
    public var grantExpiresAt: String?
    public var revokedAt: String?
    public var revokedByName: String?
    /// True when this row is granting permissions right now. Evaluated, never
    /// swept — a grant stops applying the instant it lapses.
    public var active: Bool
    public var createdAt: String

    public init(
        id: String,
        userId: String,
        userName: String? = nil,
        permissions: [String],
        reason: String,
        durationMinutes: Int,
        status: Status,
        expiresAt: String,
        decidedAt: String? = nil,
        decidedByUserId: String? = nil,
        decidedByName: String? = nil,
        decisionNote: String? = nil,
        grantedAt: String? = nil,
        grantExpiresAt: String? = nil,
        revokedAt: String? = nil,
        revokedByName: String? = nil,
        active: Bool,
        createdAt: String
    ) {
        self.id = id
        self.userId = userId
        self.userName = userName
        self.permissions = permissions
        self.reason = reason
        self.durationMinutes = durationMinutes
        self.status = status
        self.expiresAt = expiresAt
        self.decidedAt = decidedAt
        self.decidedByUserId = decidedByUserId
        self.decidedByName = decidedByName
        self.decisionNote = decisionNote
        self.grantedAt = grantedAt
        self.grantExpiresAt = grantExpiresAt
        self.revokedAt = revokedAt
        self.revokedByName = revokedByName
        self.active = active
        self.createdAt = createdAt
    }
}
