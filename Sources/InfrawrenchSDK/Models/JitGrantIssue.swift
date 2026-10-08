/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct JitGrantIssue: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case revokeFailed
        case overdue
        case stillPresent
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "revoke_failed": self = .revokeFailed
            case "overdue": self = .overdue
            case "still_present": self = .stillPresent
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .revokeFailed: return "revoke_failed"
            case .overdue: return "overdue"
            case .stillPresent: return "still_present"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .revokeFailed,
            .overdue,
            .stillPresent,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var requestId: String
    public var kind: Kind
    public var accountId: String
    public var accountName: String?
    public var pluginId: String
    public var scopeName: String
    public var roleName: String
    public var principalName: String
    public var userName: String?
    public var grantExpiresAt: String?
    public var lastError: String?
    public var revokeAttempts: Int

    public init(
        requestId: String,
        kind: Kind,
        accountId: String,
        accountName: String? = nil,
        pluginId: String,
        scopeName: String,
        roleName: String,
        principalName: String,
        userName: String? = nil,
        grantExpiresAt: String? = nil,
        lastError: String? = nil,
        revokeAttempts: Int
    ) {
        self.requestId = requestId
        self.kind = kind
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.scopeName = scopeName
        self.roleName = roleName
        self.principalName = principalName
        self.userName = userName
        self.grantExpiresAt = grantExpiresAt
        self.lastError = lastError
        self.revokeAttempts = revokeAttempts
    }
}
