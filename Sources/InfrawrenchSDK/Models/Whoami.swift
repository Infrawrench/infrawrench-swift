/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Whoami: Codable, Hashable, Sendable {
    public enum Principal: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case user
        case apiKey
        case agent
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "user": self = .user
            case "api_key": self = .apiKey
            case "agent": self = .agent
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .user: return "user"
            case .apiKey: return "api_key"
            case .agent: return "agent"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Principal] = [
            .user,
            .apiKey,
            .agent,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// The user the credential acts as. For an agent this is the agent's own
    /// user, not the person who claimed it.
    public var userId: String
    /// The organization the credential is pinned to.
    public var organizationId: String
    /// `user` for a person's WorkOS access token, `api_key` for an `iwk_` key,
    /// `agent` for an agent credential or agent token.
    public var principal: Principal

    public init(
        userId: String,
        organizationId: String,
        principal: Principal
    ) {
        self.userId = userId
        self.organizationId = organizationId
        self.principal = principal
    }
}
