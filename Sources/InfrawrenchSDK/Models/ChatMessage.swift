/*
 * InfrawrenchSDK v1.106.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.106.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatMessage: Codable, Hashable, Sendable {
    public enum Role2: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case user
        case assistant
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "user": self = .user
            case "assistant": self = .assistant
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .user: return "user"
            case .assistant: return "assistant"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Role2] = [
            .user,
            .assistant,
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
    public var role: Role2
    public var content: [ChatContentBlock]
    public var inputTokens: Int
    public var outputTokens: Int
    public var cacheReadTokens: Int
    public var cacheWriteTokens: Int
    /// The model's stop reason (`end_turn`, `tool_use`, `max_tokens`, ...); null
    /// on user messages.
    public var stopReason: String?
    public var createdAt: String

    public init(
        id: String,
        conversationId: String,
        role: Role2,
        content: [ChatContentBlock],
        inputTokens: Int,
        outputTokens: Int,
        cacheReadTokens: Int,
        cacheWriteTokens: Int,
        stopReason: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.conversationId = conversationId
        self.role = role
        self.content = content
        self.inputTokens = inputTokens
        self.outputTokens = outputTokens
        self.cacheReadTokens = cacheReadTokens
        self.cacheWriteTokens = cacheWriteTokens
        self.stopReason = stopReason
        self.createdAt = createdAt
    }
}
