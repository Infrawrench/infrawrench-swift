/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A full replace, like a report's own PUT. At least one destination is required
/// — a schedule with nowhere to deliver would only ever record failures.
public struct ReportNotificationInput: Codable, Hashable, Sendable {
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

    /// How often the schedule fires. The report itself decides what window it
    /// charts.
    public var cadence: Cadence
    /// ISO day of week (1 = Monday … 7 = Sunday); read only when cadence is
    /// weekly.
    public var sendDay: Int?
    /// Day of month; read only when cadence is monthly. A day the month doesn't
    /// have clamps to its last day, so 31 means month end everywhere.
    public var sendDayOfMonth: Int?
    /// Local hour in `timezone` the delivery fires at.
    public var hour: Int
    /// IANA zone, e.g. `Europe/Berlin`. Validated server-side.
    public var timezone: String
    /// Stored Slack channel row ids (from the targets endpoint) to post to.
    public var slackChannelIds: [String]
    /// Stored Teams webhook row ids (from the targets endpoint) to post to.
    public var teamsWebhookIds: [String]
    /// Email addresses; normalized (lowercased) server-side. At most 20.
    public var emailRecipients: [String]
    public var enabled: Bool

    public init(
        cadence: Cadence,
        sendDay: Int? = nil,
        sendDayOfMonth: Int? = nil,
        hour: Int,
        timezone: String,
        slackChannelIds: [String],
        teamsWebhookIds: [String],
        emailRecipients: [String],
        enabled: Bool
    ) {
        self.cadence = cadence
        self.sendDay = sendDay
        self.sendDayOfMonth = sendDayOfMonth
        self.hour = hour
        self.timezone = timezone
        self.slackChannelIds = slackChannelIds
        self.teamsWebhookIds = teamsWebhookIds
        self.emailRecipients = emailRecipients
        self.enabled = enabled
    }
}
