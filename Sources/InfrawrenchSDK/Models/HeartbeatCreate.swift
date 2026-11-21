/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct HeartbeatCreate: Codable, Hashable, Sendable {
    public enum ScheduleKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case cron
        case interval
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "cron": self = .cron
            case "interval": self = .interval
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .cron: return "cron"
            case .interval: return "interval"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ScheduleKind] = [
            .cron,
            .interval,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Up to 120 characters.
    public var name: String
    /// A cron expression read in `timezone`, or a fixed interval in minutes.
    public var scheduleKind: ScheduleKind
    /// Five-field cron (minute hour day-of-month month day-of-week).
    public var cronExpression: String?
    /// IANA time zone the cron expression is read in. Defaults to UTC.
    public var timezone: String?
    /// Minutes between expected pings. Clamped server-side to 1-44640 (31 days).
    public var intervalMinutes: Int?
    /// How late a ping may be before the heartbeat goes down. Clamped server-side
    /// to 1-10080.
    public var graceMinutes: Int?
    public var enabled: Bool?
    /// Link to the scheduled resource being watched.
    public var resourceId: String?
    public var fieldKey: String?

    public init(
        name: String,
        scheduleKind: ScheduleKind,
        cronExpression: String? = nil,
        timezone: String? = nil,
        intervalMinutes: Int? = nil,
        graceMinutes: Int? = nil,
        enabled: Bool? = nil,
        resourceId: String? = nil,
        fieldKey: String? = nil
    ) {
        self.name = name
        self.scheduleKind = scheduleKind
        self.cronExpression = cronExpression
        self.timezone = timezone
        self.intervalMinutes = intervalMinutes
        self.graceMinutes = graceMinutes
        self.enabled = enabled
        self.resourceId = resourceId
        self.fieldKey = fieldKey
    }
}
