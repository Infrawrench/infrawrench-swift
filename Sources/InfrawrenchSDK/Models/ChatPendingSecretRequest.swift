/*
 * InfrawrenchSDK v1.101.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.101.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatPendingSecretRequest: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case submitting
        case stored
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "submitting": self = .submitting
            case "stored": self = .stored
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .submitting: return "submitting"
            case .stored: return "stored"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .pending,
            .submitting,
            .stored,
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
    public var conversationId: String
    public var messageId: String
    public var toolUseId: String
    public var secretId: String?
    public var name: String
    public var title: String?
    public var description: String?
    public var status: Status
    public var resolvedAt: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        conversationId: String,
        messageId: String,
        toolUseId: String,
        secretId: String? = nil,
        name: String,
        title: String? = nil,
        description: String? = nil,
        status: Status,
        resolvedAt: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.conversationId = conversationId
        self.messageId = messageId
        self.toolUseId = toolUseId
        self.secretId = secretId
        self.name = name
        self.title = title
        self.description = description
        self.status = status
        self.resolvedAt = resolvedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
