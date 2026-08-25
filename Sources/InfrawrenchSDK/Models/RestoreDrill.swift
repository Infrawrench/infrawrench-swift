/*
 * InfrawrenchSDK v1.39.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.39.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RestoreDrill: Codable, Hashable, Sendable {
    public enum Outcome: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case verified
        case restoredUnverified
        case failed
        case blocked
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "verified": self = .verified
            case "restored-unverified": self = .restoredUnverified
            case "failed": self = .failed
            case "blocked": self = .blocked
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .verified: return "verified"
            case .restoredUnverified: return "restored-unverified"
            case .failed: return "failed"
            case .blocked: return "blocked"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Outcome] = [
            .verified,
            .restoredUnverified,
            .failed,
            .blocked,
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
    public var resourceId: String
    public var resourceName: String?
    public var accountId: String?
    public var accountName: String?
    /// When the drill was performed, which is **not** when it was recorded —
    /// people write these up on Monday for a drill they ran on Saturday, and
    /// every staleness computation uses this.
    public var performedAt: String
    /// How the drill ended. Only `verified` counts as evidence the backup works:
    /// a restore that produced a running system nobody looked inside is exactly
    /// how a team discovers, mid-incident, that the dump had been empty for
    /// months. `restored-unverified` is recorded because doing the restore is
    /// worth recording, but it does not reset the clock.
    public var outcome: Outcome
    /// Measured wall-clock minutes. Null when the drill never got that far; a
    /// blocked drill has no RTO, and an invented one would be the most dangerous
    /// number on the page.
    public var rtoMinutes: Int?
    /// Snapshot id, S3 key, a date — free text.
    public var restoredFrom: String?
    public var notes: String?
    public var performedByUserId: String?
    public var performedByName: String?
    public var createdAt: String

    public init(
        id: String,
        resourceId: String,
        resourceName: String? = nil,
        accountId: String? = nil,
        accountName: String? = nil,
        performedAt: String,
        outcome: Outcome,
        rtoMinutes: Int? = nil,
        restoredFrom: String? = nil,
        notes: String? = nil,
        performedByUserId: String? = nil,
        performedByName: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.resourceId = resourceId
        self.resourceName = resourceName
        self.accountId = accountId
        self.accountName = accountName
        self.performedAt = performedAt
        self.outcome = outcome
        self.rtoMinutes = rtoMinutes
        self.restoredFrom = restoredFrom
        self.notes = notes
        self.performedByUserId = performedByUserId
        self.performedByName = performedByName
        self.createdAt = createdAt
    }
}
