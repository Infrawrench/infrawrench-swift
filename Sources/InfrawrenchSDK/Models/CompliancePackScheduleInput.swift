/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CompliancePackScheduleInput: Codable, Hashable, Sendable {
    public enum Cadence: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case monthly
        case quarterly
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "monthly": self = .monthly
            case "quarterly": self = .quarterly
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .monthly: return "monthly"
            case .quarterly: return "quarterly"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Cadence] = [
            .monthly,
            .quarterly,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Framework registry id: `soc2` or `iso27001`.
    public var frameworkId: String
    /// `monthly` delivers the previous calendar month on `sendDayOfMonth`;
    /// `quarterly` delivers the previous calendar quarter in January, April, July
    /// and October.
    public var cadence: Cadence
    public var sendDayOfMonth: Int?
    public var hour: Int
    public var timezone: String
    public var emailRecipients: [String]
    public var slackChannelIds: [String]?
    public var teamsWebhookIds: [String]?
    public var enabled: Bool

    public init(
        frameworkId: String,
        cadence: Cadence,
        sendDayOfMonth: Int? = nil,
        hour: Int,
        timezone: String,
        emailRecipients: [String],
        slackChannelIds: [String]? = nil,
        teamsWebhookIds: [String]? = nil,
        enabled: Bool
    ) {
        self.frameworkId = frameworkId
        self.cadence = cadence
        self.sendDayOfMonth = sendDayOfMonth
        self.hour = hour
        self.timezone = timezone
        self.emailRecipients = emailRecipients
        self.slackChannelIds = slackChannelIds
        self.teamsWebhookIds = teamsWebhookIds
        self.enabled = enabled
    }
}
