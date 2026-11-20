/*
 * InfrawrenchSDK v1.122.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.122.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Heartbeat: Codable, Hashable, Sendable {
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

    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case new
        case up
        case down
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "new": self = .new
            case "up": self = .up
            case "down": self = .down
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .new: return "new"
            case .up: return "up"
            case .down: return "down"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .new,
            .up,
            .down,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum DownReason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case missed
        case failed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "missed": self = .missed
            case "failed": self = .failed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .missed: return "missed"
            case .failed: return "failed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [DownReason] = [
            .missed,
            .failed,
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
    public var name: String
    /// A cron expression read in `timezone`, or a fixed interval in minutes.
    public var scheduleKind: ScheduleKind
    public var cronExpression: String?
    public var timezone: String
    public var intervalMinutes: Int?
    public var graceMinutes: Int
    /// False while paused.
    public var enabled: Bool
    /// `new` until the first ping (a heartbeat never alerts before its job has
    /// reported once), `up` after a success, `down` after a missed deadline or a
    /// `/fail` ping.
    public var status: Status
    public var downReason: DownReason?
    /// The secret URL the job pings; append `/start` before a run and `/fail` on
    /// failure. Absolute when the server knows its public address, otherwise a
    /// path.
    public var pingUrl: String
    public var lastPingAt: String?
    public var lastStartAt: String?
    public var lastFailAt: String?
    /// The last run's duration, from its `/start` ping to the ping that closed
    /// it.
    public var lastDurationMs: Int?
    public var nextExpectedAt: String?
    /// `nextExpectedAt` plus the grace period; null while new, paused or down.
    public var deadlineAt: String?
    public var lastStateChangeAt: String?
    public var accountId: String?
    /// The scheduled resource this heartbeat watches; advisory, not a foreign
    /// key.
    public var resourceId: String?
    public var pluginId: PluginId?
    public var resourceTypeId: String?
    /// The resource field the schedule was read from.
    public var fieldKey: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        scheduleKind: ScheduleKind,
        cronExpression: String? = nil,
        timezone: String,
        intervalMinutes: Int? = nil,
        graceMinutes: Int,
        enabled: Bool,
        status: Status,
        downReason: DownReason? = nil,
        pingUrl: String,
        lastPingAt: String? = nil,
        lastStartAt: String? = nil,
        lastFailAt: String? = nil,
        lastDurationMs: Int? = nil,
        nextExpectedAt: String? = nil,
        deadlineAt: String? = nil,
        lastStateChangeAt: String? = nil,
        accountId: String? = nil,
        resourceId: String? = nil,
        pluginId: PluginId? = nil,
        resourceTypeId: String? = nil,
        fieldKey: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.scheduleKind = scheduleKind
        self.cronExpression = cronExpression
        self.timezone = timezone
        self.intervalMinutes = intervalMinutes
        self.graceMinutes = graceMinutes
        self.enabled = enabled
        self.status = status
        self.downReason = downReason
        self.pingUrl = pingUrl
        self.lastPingAt = lastPingAt
        self.lastStartAt = lastStartAt
        self.lastFailAt = lastFailAt
        self.lastDurationMs = lastDurationMs
        self.nextExpectedAt = nextExpectedAt
        self.deadlineAt = deadlineAt
        self.lastStateChangeAt = lastStateChangeAt
        self.accountId = accountId
        self.resourceId = resourceId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.fieldKey = fieldKey
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
