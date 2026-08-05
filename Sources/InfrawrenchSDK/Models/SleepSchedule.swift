/*
 * InfrawrenchSDK v0.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SleepSchedule: Codable, Hashable, Sendable {
    public enum NextTransitionAction: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case stop
        case start
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "stop": self = .stop
            case "start": self = .start
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .stop: return "stop"
            case .start: return "start"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [NextTransitionAction] = [
            .stop,
            .start,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum LastRunAction: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case stop
        case start
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "stop": self = .stop
            case "start": self = .start
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .stop: return "stop"
            case .start: return "start"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [LastRunAction] = [
            .stop,
            .start,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum LastRunStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case ok
        case failed
        case skippedFreeze
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ok": self = .ok
            case "failed": self = .failed
            case "skipped_freeze": self = .skippedFreeze
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ok: return "ok"
            case .failed: return "failed"
            case .skippedFreeze: return "skipped_freeze"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [LastRunStatus] = [
            .ok,
            .failed,
            .skippedFreeze,
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
    /// Infrawrench resource id the schedule powers on and off.
    public var resourceId: String
    public var accountId: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    /// Resource display name at read time.
    public var resourceName: String
    public var accountName: String
    /// ISO weekdays the resource is worked on: 1 = Monday … 7 = Sunday.
    public var daysOfWeek: [Int]
    /// Wall-clock time of day, 24-hour `"HH:MM"`, in the schedule's timezone.
    public var stopTime: String
    /// Wall-clock time of day, 24-hour `"HH:MM"`, in the schedule's timezone.
    public var startTime: String
    /// IANA timezone the wall-clock times are computed in (DST-safe).
    public var timezone: String
    /// Paused schedules keep their timing but never fire.
    public var paused: Bool
    /// Next due transition; null while paused.
    public var nextTransitionAt: String?
    /// A schedule transition: `stop` powers the resource off, `start` powers it
    /// on.
    public var nextTransitionAction: NextTransitionAction?
    public var lastRunAt: String?
    /// A schedule transition: `stop` powers the resource off, `start` powers it
    /// on.
    public var lastRunAction: LastRunAction?
    /// Outcome of the last executed transition: `ok`, `failed` (see
    /// `lastRunError`), or `skipped_freeze` (an org change freeze was in effect,
    /// so the transition was skipped).
    public var lastRunStatus: LastRunStatus?
    /// Failure detail for a failed run.
    public var lastRunError: String?
    /// Projected monthly saving from trailing per-resource spend × the weekly
    /// off-hours fraction; null when billing holds no rows for the resource.
    public var projectedMonthlySaving: Double?
    /// Currency of the projection, when present.
    public var currency: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        resourceId: String,
        accountId: String,
        pluginId: PluginId,
        resourceTypeId: String,
        resourceName: String,
        accountName: String,
        daysOfWeek: [Int],
        stopTime: String,
        startTime: String,
        timezone: String,
        paused: Bool,
        nextTransitionAt: String? = nil,
        nextTransitionAction: NextTransitionAction? = nil,
        lastRunAt: String? = nil,
        lastRunAction: LastRunAction? = nil,
        lastRunStatus: LastRunStatus? = nil,
        lastRunError: String? = nil,
        projectedMonthlySaving: Double? = nil,
        currency: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.resourceId = resourceId
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.resourceName = resourceName
        self.accountName = accountName
        self.daysOfWeek = daysOfWeek
        self.stopTime = stopTime
        self.startTime = startTime
        self.timezone = timezone
        self.paused = paused
        self.nextTransitionAt = nextTransitionAt
        self.nextTransitionAction = nextTransitionAction
        self.lastRunAt = lastRunAt
        self.lastRunAction = lastRunAction
        self.lastRunStatus = lastRunStatus
        self.lastRunError = lastRunError
        self.projectedMonthlySaving = projectedMonthlySaving
        self.currency = currency
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
