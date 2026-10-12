/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EventDelivery: Codable, Hashable, Sendable {
    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case retrying
        case succeeded
        case dead
        case skipped
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "retrying": self = .retrying
            case "succeeded": self = .succeeded
            case "dead": self = .dead
            case "skipped": self = .skipped
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .retrying: return "retrying"
            case .succeeded: return "succeeded"
            case .dead: return "dead"
            case .skipped: return "skipped"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [State] = [
            .pending,
            .retrying,
            .succeeded,
            .dead,
            .skipped,
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
    public var subscriptionId: String
    public var eventId: String
    public var eventType: String
    public var state: State
    public var attemptCount: Int
    public var nextAttemptAt: String?
    public var lastAttemptAt: String?
    public var deliveredAt: String?
    public var responseStatus: Int?
    public var responseExcerpt: String?
    public var error: String?
    public var test: Bool
    public var redeliveryOf: String?
    public var attempts: [EventDeliveryAttempt]
    public var createdAt: String
    /// The envelope as sent.
    public var payload: [String: JSONValue]

    public init(
        id: String,
        subscriptionId: String,
        eventId: String,
        eventType: String,
        state: State,
        attemptCount: Int,
        nextAttemptAt: String? = nil,
        lastAttemptAt: String? = nil,
        deliveredAt: String? = nil,
        responseStatus: Int? = nil,
        responseExcerpt: String? = nil,
        error: String? = nil,
        test: Bool,
        redeliveryOf: String? = nil,
        attempts: [EventDeliveryAttempt],
        createdAt: String,
        payload: [String: JSONValue]
    ) {
        self.id = id
        self.subscriptionId = subscriptionId
        self.eventId = eventId
        self.eventType = eventType
        self.state = state
        self.attemptCount = attemptCount
        self.nextAttemptAt = nextAttemptAt
        self.lastAttemptAt = lastAttemptAt
        self.deliveredAt = deliveredAt
        self.responseStatus = responseStatus
        self.responseExcerpt = responseExcerpt
        self.error = error
        self.test = test
        self.redeliveryOf = redeliveryOf
        self.attempts = attempts
        self.createdAt = createdAt
        self.payload = payload
    }
}
