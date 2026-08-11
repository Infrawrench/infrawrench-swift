/*
 * InfrawrenchSDK v1.13.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.13.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ReportNotification: Codable, Hashable, Sendable {
    public enum Cadence: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case daily
        case weekly
        case monthly
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "daily": self = .daily
            case "weekly": self = .weekly
            case "monthly": self = .monthly
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .daily: return "daily"
            case .weekly: return "weekly"
            case .monthly: return "monthly"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Cadence] = [
            .daily,
            .weekly,
            .monthly,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum LastStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case succeeded
        case partial
        case failed
        case noTargets
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "succeeded": self = .succeeded
            case "partial": self = .partial
            case "failed": self = .failed
            case "no_targets": self = .noTargets
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .succeeded: return "succeeded"
            case .partial: return "partial"
            case .failed: return "failed"
            case .noTargets: return "no_targets"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [LastStatus] = [
            .pending,
            .succeeded,
            .partial,
            .failed,
            .noTargets,
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
    public var costReportId: String
    /// How often the schedule fires. The report itself decides what window it
    /// charts.
    public var cadence: Cadence
    public var sendDay: Int
    public var sendDayOfMonth: Int
    public var hour: Int
    public var timezone: String
    public var slackChannelIds: [String]
    public var teamsWebhookIds: [String]
    public var emailRecipients: [String]
    public var enabled: Bool
    /// When the next scheduled send is due; null while disabled.
    public var nextSendAt: String?
    /// When a delivery last actually reached at least one destination.
    public var lastSentAt: String?
    /// What the last attempt did. `partial` means some destinations took it and
    /// some failed — never retried automatically, because a retry would
    /// double-post where it landed.
    public var lastStatus: LastStatus?
    public var lastError: String?
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        costReportId: String,
        cadence: Cadence,
        sendDay: Int,
        sendDayOfMonth: Int,
        hour: Int,
        timezone: String,
        slackChannelIds: [String],
        teamsWebhookIds: [String],
        emailRecipients: [String],
        enabled: Bool,
        nextSendAt: String? = nil,
        lastSentAt: String? = nil,
        lastStatus: LastStatus? = nil,
        lastError: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.costReportId = costReportId
        self.cadence = cadence
        self.sendDay = sendDay
        self.sendDayOfMonth = sendDayOfMonth
        self.hour = hour
        self.timezone = timezone
        self.slackChannelIds = slackChannelIds
        self.teamsWebhookIds = teamsWebhookIds
        self.emailRecipients = emailRecipients
        self.enabled = enabled
        self.nextSendAt = nextSendAt
        self.lastSentAt = lastSentAt
        self.lastStatus = lastStatus
        self.lastError = lastError
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
