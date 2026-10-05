/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BudgetAlertNoteResult: Codable, Hashable, Sendable {
    public enum ThresholdType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case actual
        case forecast
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "actual": self = .actual
            case "forecast": self = .forecast
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .actual: return "actual"
            case .forecast: return "forecast"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ThresholdType] = [
            .actual,
            .forecast,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct FollowUp: Codable, Hashable, Sendable {
        /// Slack threads the note was posted in as a reply.
        public var slack: Int
        /// Teams webhooks the note was sent to (incoming webhooks cannot thread).
        public var msTeams: Int

        public init(
            slack: Int,
            msTeams: Int
        ) {
            self.slack = slack
            self.msTeams = msTeams
        }
    }

    public var id: String
    public var month: String
    public var thresholdType: ThresholdType
    public var thresholdPercent: Int
    public var actualAmountCents: Int
    public var forecastAmountCents: Int?
    public var triggeredAt: String
    /// First day of the period the crossing was observed in; null on events from
    /// before budget periods were configurable (those are calendar months: see
    /// `month`).
    public var periodStart: String?
    public var periodEnd: String?
    /// A usage budget's period-to-date usage at the crossing (the cents fields
    /// are 0).
    public var actualUsage: Double?
    public var forecastUsage: Double?
    public var note: BudgetAlertNote?
    public var followUp: FollowUp

    public init(
        id: String,
        month: String,
        thresholdType: ThresholdType,
        thresholdPercent: Int,
        actualAmountCents: Int,
        forecastAmountCents: Int? = nil,
        triggeredAt: String,
        periodStart: String? = nil,
        periodEnd: String? = nil,
        actualUsage: Double? = nil,
        forecastUsage: Double? = nil,
        note: BudgetAlertNote? = nil,
        followUp: FollowUp
    ) {
        self.id = id
        self.month = month
        self.thresholdType = thresholdType
        self.thresholdPercent = thresholdPercent
        self.actualAmountCents = actualAmountCents
        self.forecastAmountCents = forecastAmountCents
        self.triggeredAt = triggeredAt
        self.periodStart = periodStart
        self.periodEnd = periodEnd
        self.actualUsage = actualUsage
        self.forecastUsage = forecastUsage
        self.note = note
        self.followUp = followUp
    }
}
