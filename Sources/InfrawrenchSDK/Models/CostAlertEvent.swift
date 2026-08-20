/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAlertEvent: Codable, Hashable, Sendable {
    public enum Direction: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case increase
        case decrease
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "increase": self = .increase
            case "decrease": self = .decrease
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .increase: return "increase"
            case .decrease: return "decrease"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Direction] = [
            .increase,
            .decrease,
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
    public var alertId: String
    public var alertName: String
    /// The cadence period the firing belongs to — a day, an ISO week (2026-W32)
    /// or a month (2026-08). One period fires at most once per group and
    /// currency.
    public var periodKey: String
    public var windowFrom: String
    public var windowTo: String
    public var previousFrom: String
    public var previousTo: String
    /// The offending group; empty when the alert watches one total.
    public var groupKey: String
    public var currency: String
    public var previousAmountCents: Int
    public var currentAmountCents: Int
    /// Signed percent change. Null when the prior window had no spend at all (new
    /// spend — the change is infinite); -100 when the group vanished.
    public var changePercent: Int?
    public var direction: Direction
    public var firedAt: String
    public var notifiedAt: String?

    public init(
        id: String,
        alertId: String,
        alertName: String,
        periodKey: String,
        windowFrom: String,
        windowTo: String,
        previousFrom: String,
        previousTo: String,
        groupKey: String,
        currency: String,
        previousAmountCents: Int,
        currentAmountCents: Int,
        changePercent: Int? = nil,
        direction: Direction,
        firedAt: String,
        notifiedAt: String? = nil
    ) {
        self.id = id
        self.alertId = alertId
        self.alertName = alertName
        self.periodKey = periodKey
        self.windowFrom = windowFrom
        self.windowTo = windowTo
        self.previousFrom = previousFrom
        self.previousTo = previousTo
        self.groupKey = groupKey
        self.currency = currency
        self.previousAmountCents = previousAmountCents
        self.currentAmountCents = currentAmountCents
        self.changePercent = changePercent
        self.direction = direction
        self.firedAt = firedAt
        self.notifiedAt = notifiedAt
    }
}
