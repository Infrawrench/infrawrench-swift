/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Org-wide notification tuning. Cooldown claims (`lastNotifiedAt`,
/// `lastSentWeekStart`) are deliberately absent: they are poller state, and
/// resetting one from an apply would re-open a quiet period and page people
/// twice.
public struct OrgConfigAlertSettings: Codable, Hashable, Sendable {
    public struct CostAnomaly2: Codable, Hashable, Sendable {
        public enum SmsAlerts: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case off
            case newSource
            case all
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "off": self = .off
                case "new_source": self = .newSource
                case "all": self = .all
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .off: return "off"
                case .newSource: return "new_source"
                case .all: return "all"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [SmsAlerts] = [
                .off,
                .newSource,
                .all,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var sigmas: Double
        public var minDeltaCents: Int
        public var newSourceMinCents: Int
        public var smsAlerts: SmsAlerts

        public init(
            sigmas: Double,
            minDeltaCents: Int,
            newSourceMinCents: Int,
            smsAlerts: SmsAlerts
        ) {
            self.sigmas = sigmas
            self.minDeltaCents = minDeltaCents
            self.newSourceMinCents = newSourceMinCents
            self.smsAlerts = smsAlerts
        }
    }

    public struct Drift: Codable, Hashable, Sendable {
        public var notifyCreated: Bool
        public var notifyUpdated: Bool
        public var notifyDeleted: Bool
        public var cooldownMinutes: Int
        public var minChanges: Int
        /// Account display names; empty means every account.
        public var accounts: [String]

        public init(
            notifyCreated: Bool,
            notifyUpdated: Bool,
            notifyDeleted: Bool,
            cooldownMinutes: Int,
            minChanges: Int,
            accounts: [String]
        ) {
            self.notifyCreated = notifyCreated
            self.notifyUpdated = notifyUpdated
            self.notifyDeleted = notifyDeleted
            self.cooldownMinutes = cooldownMinutes
            self.minChanges = minChanges
            self.accounts = accounts
        }
    }

    public struct Expiry: Codable, Hashable, Sendable {
        public var enabled: Bool
        public var leadDays: Int

        public init(
            enabled: Bool,
            leadDays: Int
        ) {
            self.enabled = enabled
            self.leadDays = leadDays
        }
    }

    public struct Posture: Codable, Hashable, Sendable {
        public var enabled: Bool

        public init(
            enabled: Bool
        ) {
            self.enabled = enabled
        }
    }

    public struct Digest: Codable, Hashable, Sendable {
        public var enabled: Bool
        public var timezone: String
        public var sendDay: Int
        public var sendHour: Int
        public var narrativeEnabled: Bool
        public var recipients: [String]

        public init(
            enabled: Bool,
            timezone: String,
            sendDay: Int,
            sendHour: Int,
            narrativeEnabled: Bool,
            recipients: [String]
        ) {
            self.enabled = enabled
            self.timezone = timezone
            self.sendDay = sendDay
            self.sendHour = sendHour
            self.narrativeEnabled = narrativeEnabled
            self.recipients = recipients
        }
    }

    public var costAnomaly: CostAnomaly2?
    public var drift: Drift?
    public var expiry: Expiry?
    public var posture: Posture?
    public var digest: Digest?

    public init(
        costAnomaly: CostAnomaly2? = nil,
        drift: Drift? = nil,
        expiry: Expiry? = nil,
        posture: Posture? = nil,
        digest: Digest? = nil
    ) {
        self.costAnomaly = costAnomaly
        self.drift = drift
        self.expiry = expiry
        self.posture = posture
        self.digest = digest
    }
}
