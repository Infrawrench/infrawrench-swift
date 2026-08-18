/*
 * InfrawrenchSDK v1.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SharedConsole: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case active
        case revoked
        case ended
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "active": self = .active
            case "revoked": self = .revoked
            case "ended": self = .ended
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .active: return "active"
            case .revoked: return "revoked"
            case .ended: return "ended"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .active,
            .revoked,
            .ended,
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
    /// Load-balancer affinity hint. A guest's WebSocket must carry it as `?sid=`
    /// so the upgrade lands on the replica holding the pty. Not a secret and not
    /// authorisation.
    public var routingKey: String
    public var ownerUserId: String?
    public var ownerName: String?
    public var accountId: String?
    public var resourceId: String?
    /// Final hop, as the proxy dialled it — never as a client asserted it.
    public var host: String
    public var port: Int
    public var username: String
    /// False makes the share strictly read-only: nobody but the sharer can ever
    /// type. This is the one hard safety property the feature offers, as opposed
    /// to inferring intent from command text.
    public var allowHandover: Bool
    /// `revoked` — somebody ended the share; `ended` — the underlying SSH session
    /// closed. Either way the fan-out stops and attached guests are disconnected.
    public var status: Status
    public var inviteTokenPrefix: String?
    public var inviteExpiresAt: String?
    /// Set once an invite admitted somebody new. The link stops working for
    /// anyone else at that moment; the sharer mints a replacement for the next
    /// guest.
    public var inviteConsumedAt: String?
    /// The session recording this console is being taped into, when the org
    /// records. Participants are attributed in that recording's own metadata and
    /// as asciicast markers on its timeline.
    public var recordingId: String?
    public var ptyCols: Int
    /// The pty's geometry, which is the **driver's** geometry. One pty has one
    /// size, so everyone else letterboxes rather than reflowing.
    public var ptyRows: Int
    public var createdAt: String

    public init(
        id: String,
        routingKey: String,
        ownerUserId: String? = nil,
        ownerName: String? = nil,
        accountId: String? = nil,
        resourceId: String? = nil,
        host: String,
        port: Int,
        username: String,
        allowHandover: Bool,
        status: Status,
        inviteTokenPrefix: String? = nil,
        inviteExpiresAt: String? = nil,
        inviteConsumedAt: String? = nil,
        recordingId: String? = nil,
        ptyCols: Int,
        ptyRows: Int,
        createdAt: String
    ) {
        self.id = id
        self.routingKey = routingKey
        self.ownerUserId = ownerUserId
        self.ownerName = ownerName
        self.accountId = accountId
        self.resourceId = resourceId
        self.host = host
        self.port = port
        self.username = username
        self.allowHandover = allowHandover
        self.status = status
        self.inviteTokenPrefix = inviteTokenPrefix
        self.inviteExpiresAt = inviteExpiresAt
        self.inviteConsumedAt = inviteConsumedAt
        self.recordingId = recordingId
        self.ptyCols = ptyCols
        self.ptyRows = ptyRows
        self.createdAt = createdAt
    }
}
