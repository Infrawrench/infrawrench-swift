/*
 * InfrawrenchSDK v1.1.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.1.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DigestSettings: Codable, Hashable, Sendable {
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

    /// Whether the weekly digest is enabled for this organization. Delivery
    /// targets are the Slack channels and Teams webhooks whose weeklyDigest
    /// trigger is on, plus the organization's digest email recipients.
    public var enabled: Bool
    /// Monday (ISO date, in the organization's timezone) of the last week a
    /// digest covered, or null when none has been sent.
    public var lastSentWeekStart: String?
    /// When a digest last actually reached a destination, or null if none ever
    /// has.
    public var lastSentAt: String?
    /// IANA time zone the schedule and the Monday-to-Sunday week boundary are
    /// expressed in. Defaults to UTC.
    public var timezone: String
    /// ISO day of week the digest is sent on: 1 = Monday … 7 = Sunday.
    public var sendDay: Int
    /// Local hour (0–23) in `timezone` the digest is sent at.
    public var sendHour: Int
    /// Whether an AI-written summary paragraph is placed above the deterministic
    /// content. Opt-in, default off. Failures are non-fatal: the digest still
    /// sends without the paragraph.
    public var narrativeEnabled: Bool
    /// Whether this deployment has an LLM API key configured. False means
    /// enabling the narrative has no effect.
    public var narrativeAvailable: Bool
    /// Whether this deployment has a mail provider configured. False means email
    /// recipients are never delivered to.
    public var emailAvailable: Bool
    /// Delivery attempts made for lastSentWeekStart's window, including the
    /// first.
    public var attemptCount: Int
    public var lastAttemptAt: String?
    /// Outcome of the most recent delivery attempt. `partial` (some destinations
    /// took it, some failed) is deliberately never retried automatically — a
    /// retry would post the digest twice where it already landed. `failed`
    /// (nothing landed) is retried a bounded number of times with backoff, then
    /// parked until the next week.
    public var lastStatus: LastStatus?
    /// Why the last attempt was not a clean success, for display in the settings
    /// UI.
    public var lastError: String?
    /// When the next automatic retry is due, or null when none is scheduled.
    public var nextAttemptAt: String?

    public init(
        enabled: Bool,
        lastSentWeekStart: String? = nil,
        lastSentAt: String? = nil,
        timezone: String,
        sendDay: Int,
        sendHour: Int,
        narrativeEnabled: Bool,
        narrativeAvailable: Bool,
        emailAvailable: Bool,
        attemptCount: Int,
        lastAttemptAt: String? = nil,
        lastStatus: LastStatus? = nil,
        lastError: String? = nil,
        nextAttemptAt: String? = nil
    ) {
        self.enabled = enabled
        self.lastSentWeekStart = lastSentWeekStart
        self.lastSentAt = lastSentAt
        self.timezone = timezone
        self.sendDay = sendDay
        self.sendHour = sendHour
        self.narrativeEnabled = narrativeEnabled
        self.narrativeAvailable = narrativeAvailable
        self.emailAvailable = emailAvailable
        self.attemptCount = attemptCount
        self.lastAttemptAt = lastAttemptAt
        self.lastStatus = lastStatus
        self.lastError = lastError
        self.nextAttemptAt = nextAttemptAt
    }
}
