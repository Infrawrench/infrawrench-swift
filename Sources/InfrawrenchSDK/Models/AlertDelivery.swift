/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AlertDelivery: Codable, Hashable, Sendable {
    public enum State: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case held
        case awaitingAck
        case sent
        case acknowledged
        case escalated
        case expired
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "held": self = .held
            case "awaiting_ack": self = .awaitingAck
            case "sent": self = .sent
            case "acknowledged": self = .acknowledged
            case "escalated": self = .escalated
            case "expired": self = .expired
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .held: return "held"
            case .awaitingAck: return "awaiting_ack"
            case .sent: return "sent"
            case .acknowledged: return "acknowledged"
            case .escalated: return "escalated"
            case .expired: return "expired"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [State] = [
            .held,
            .awaitingAck,
            .sent,
            .acknowledged,
            .escalated,
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
    public var trigger: AlertTrigger
    public var severity: AlertSeverity
    public var title: String
    public var body: String
    public var ruleName: String?
    public var state: State
    public var createdAt: String
    /// When a quiet-hours hold is released.
    public var deliverAfter: String?
    /// When an unacknowledged alert escalates.
    public var escalateAt: String?
    public var acknowledgedAt: String?
    public var acknowledgedByUserId: String?

    public init(
        id: String,
        trigger: AlertTrigger,
        severity: AlertSeverity,
        title: String,
        body: String,
        ruleName: String? = nil,
        state: State,
        createdAt: String,
        deliverAfter: String? = nil,
        escalateAt: String? = nil,
        acknowledgedAt: String? = nil,
        acknowledgedByUserId: String? = nil
    ) {
        self.id = id
        self.trigger = trigger
        self.severity = severity
        self.title = title
        self.body = body
        self.ruleName = ruleName
        self.state = state
        self.createdAt = createdAt
        self.deliverAfter = deliverAfter
        self.escalateAt = escalateAt
        self.acknowledgedAt = acknowledgedAt
        self.acknowledgedByUserId = acknowledgedByUserId
    }
}
