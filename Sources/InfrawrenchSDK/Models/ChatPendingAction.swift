/*
 * InfrawrenchSDK v1.99.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.99.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatPendingAction: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case approved
        case rejected
        case executed
        case errored
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "approved": self = .approved
            case "rejected": self = .rejected
            case "executed": self = .executed
            case "errored": self = .errored
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .approved: return "approved"
            case .rejected: return "rejected"
            case .executed: return "executed"
            case .errored: return "errored"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .pending,
            .approved,
            .rejected,
            .executed,
            .errored,
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
    public var toolName: String
    public var toolInput: JSONValue
    public var status: Status
    /// The tool's result once executed, or the rejection reason.
    public var result: String?
    public var isError: Bool
    /// What approving would change, in plain lines, when the tool can say so.
    public var summary: String?
    public var resolvedAt: String?
    public var createdAt: String

    public init(
        id: String,
        conversationId: String,
        messageId: String,
        toolUseId: String,
        toolName: String,
        toolInput: JSONValue,
        status: Status,
        result: String? = nil,
        isError: Bool,
        summary: String? = nil,
        resolvedAt: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.conversationId = conversationId
        self.messageId = messageId
        self.toolUseId = toolUseId
        self.toolName = toolName
        self.toolInput = toolInput
        self.status = status
        self.result = result
        self.isError = isError
        self.summary = summary
        self.resolvedAt = resolvedAt
        self.createdAt = createdAt
    }
}
