/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CalendarEvent: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case changeFreeze
        case sleepSchedule
        case expiry
        case commitmentExpiry
        case workflowSchedule
        case incident
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "change-freeze": self = .changeFreeze
            case "sleep-schedule": self = .sleepSchedule
            case "expiry": self = .expiry
            case "commitment-expiry": self = .commitmentExpiry
            case "workflow-schedule": self = .workflowSchedule
            case "incident": self = .incident
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .changeFreeze: return "change-freeze"
            case .sleepSchedule: return "sleep-schedule"
            case .expiry: return "expiry"
            case .commitmentExpiry: return "commitment-expiry"
            case .workflowSchedule: return "workflow-schedule"
            case .incident: return "incident"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .changeFreeze,
            .sleepSchedule,
            .expiry,
            .commitmentExpiry,
            .workflowSchedule,
            .incident,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Severity: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case critical
        case warning
        case info
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "critical": self = .critical
            case "warning": self = .warning
            case "info": self = .info
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .critical: return "critical"
            case .warning: return "warning"
            case .info: return "info"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Severity] = [
            .critical,
            .warning,
            .info,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// Stable across renders for the same underlying thing, because it becomes
    /// the iCalendar UID. Recurring sources (sleep windows, cron runs) key it by
    /// occurrence.
    public var id: String
    /// Which of the organization's own records the event was projected from. The
    /// kinds are sources rather than a severity taxonomy: a reader scanning a
    /// month wants to know that one bar is a freeze and another is a certificate.
    public var kind: Kind
    public var title: String
    public var detail: String?
    /// Clamped to the requested window's lower bound when the underlying span
    /// began earlier; `openEnded` says so.
    public var startsAt: String
    /// Null means a point in time — a deadline, a scheduled run — or a span whose
    /// end is not known. `openEnded` distinguishes the two.
    public var endsAt: String?
    /// The span continues past an edge of the window, or has no declared end at
    /// all (a freeze held until further notice, an unresolved incident).
    public var openEnded: Bool
    /// The event is meaningful only to the day — a deadline read off a date
    /// field. Rendering such a thing at the provider's stored midnight would be
    /// false precision.
    public var allDay: Bool
    public var severity: Severity
    public var link: CalendarEventLink?

    public init(
        id: String,
        kind: Kind,
        title: String,
        detail: String? = nil,
        startsAt: String,
        endsAt: String? = nil,
        openEnded: Bool,
        allDay: Bool,
        severity: Severity,
        link: CalendarEventLink? = nil
    ) {
        self.id = id
        self.kind = kind
        self.title = title
        self.detail = detail
        self.startsAt = startsAt
        self.endsAt = endsAt
        self.openEnded = openEnded
        self.allDay = allDay
        self.severity = severity
        self.link = link
    }
}
