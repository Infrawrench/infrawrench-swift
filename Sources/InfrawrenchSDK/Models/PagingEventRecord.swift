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

public struct PagingEventRecord: Codable, Hashable, Sendable {
    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
        public static let allKnownCases: [State] = [
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

    public enum PendingAction: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case trigger
        case acknowledge
        case resolve
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "trigger": self = .trigger
            case "acknowledge": self = .acknowledge
            case "resolve": self = .resolve
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .trigger: return "trigger"
            case .acknowledge: return "acknowledge"
            case .resolve: return "resolve"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [PendingAction] = [
            .trigger,
            .acknowledge,
            .resolve,
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
    public var accountId: String
    public var targetId: String
    public var dedupKey: String
    public var trigger: String
    public var title: String
    public var state: State
    public var pendingAction: PendingAction?
    public var attempts: Int
    public var lastError: String?
    public var createdAt: String
    public var updatedAt: String
    public var sentAt: String?

    public init(
        id: String,
        accountId: String,
        targetId: String,
        dedupKey: String,
        trigger: String,
        title: String,
        state: State,
        pendingAction: PendingAction? = nil,
        attempts: Int,
        lastError: String? = nil,
        createdAt: String,
        updatedAt: String,
        sentAt: String? = nil
    ) {
        self.id = id
        self.accountId = accountId
        self.targetId = targetId
        self.dedupKey = dedupKey
        self.trigger = trigger
        self.title = title
        self.state = state
        self.pendingAction = pendingAction
        self.attempts = attempts
        self.lastError = lastError
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.sentAt = sentAt
    }
}
