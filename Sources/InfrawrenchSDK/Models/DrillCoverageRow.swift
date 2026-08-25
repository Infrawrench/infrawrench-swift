/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DrillCoverageRow: Codable, Hashable, Sendable {
    public enum Standing: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case verified
        case stale
        case failed
        case never
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "verified": self = .verified
            case "stale": self = .stale
            case "failed": self = .failed
            case "never": self = .never
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .verified: return "verified"
            case .stale: return "stale"
            case .failed: return "failed"
            case .never: return "never"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Standing] = [
            .verified,
            .stale,
            .failed,
            .never,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum LastOutcome: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
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
        public static let allKnownCases: [LastOutcome] = [
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

    public var resourceId: String
    public var resourceName: String?
    public var accountId: String?
    public var accountName: String?
    public var resourceTypeId: String?
    /// `never` and `stale` are kept apart because they call for different
    /// conversations: one is 'nobody has ever tried', the other is 'it worked in
    /// March'.
    public var standing: Standing
    public var lastDrillAt: String?
    /// How the drill ended. Only `verified` counts as evidence the backup works:
    /// a restore that produced a running system nobody looked inside is exactly
    /// how a team discovers, mid-incident, that the dump had been empty for
    /// months. `restored-unverified` is recorded because doing the restore is
    /// worth recording, but it does not reset the clock.
    public var lastOutcome: LastOutcome?
    public var lastVerifiedAt: String?
    public var verifiedRtoMinutes: Int?
    public var daysUntilStale: Int?

    public init(
        resourceId: String,
        resourceName: String? = nil,
        accountId: String? = nil,
        accountName: String? = nil,
        resourceTypeId: String? = nil,
        standing: Standing,
        lastDrillAt: String? = nil,
        lastOutcome: LastOutcome? = nil,
        lastVerifiedAt: String? = nil,
        verifiedRtoMinutes: Int? = nil,
        daysUntilStale: Int? = nil
    ) {
        self.resourceId = resourceId
        self.resourceName = resourceName
        self.accountId = accountId
        self.accountName = accountName
        self.resourceTypeId = resourceTypeId
        self.standing = standing
        self.lastDrillAt = lastDrillAt
        self.lastOutcome = lastOutcome
        self.lastVerifiedAt = lastVerifiedAt
        self.verifiedRtoMinutes = verifiedRtoMinutes
        self.daysUntilStale = daysUntilStale
    }
}
