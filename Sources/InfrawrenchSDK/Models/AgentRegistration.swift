/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentRegistration: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case anonymous
        case serviceAuth
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "anonymous": self = .anonymous
            case "service_auth": self = .serviceAuth
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .anonymous: return "anonymous"
            case .serviceAuth: return "service_auth"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .anonymous,
            .serviceAuth,
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
    public var label: String?
    public var kind: Kind
    /// First 8 characters of the credential.
    public var `prefix`: String?
    public var claimedAt: String?
    public var claimedByUserId: String?
    public var claimedByEmail: String?
    public var lastSeenAt: String?
    public var revokedAt: String?
    public var createdAt: String

    public init(
        id: String,
        label: String? = nil,
        kind: Kind,
        `prefix`: String? = nil,
        claimedAt: String? = nil,
        claimedByUserId: String? = nil,
        claimedByEmail: String? = nil,
        lastSeenAt: String? = nil,
        revokedAt: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.label = label
        self.kind = kind
        self.`prefix` = `prefix`
        self.claimedAt = claimedAt
        self.claimedByUserId = claimedByUserId
        self.claimedByEmail = claimedByEmail
        self.lastSeenAt = lastSeenAt
        self.revokedAt = revokedAt
        self.createdAt = createdAt
    }
}
