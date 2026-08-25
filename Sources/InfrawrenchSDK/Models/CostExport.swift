/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostExport: Codable, Hashable, Sendable {
    public enum Format: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case csv
        case ndjson
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "csv": self = .csv
            case "ndjson": self = .ndjson
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .csv: return "csv"
            case .ndjson: return "ndjson"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Format] = [
            .csv,
            .ndjson,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

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

    public enum LastStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pending
        case succeeded
        case failed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pending": self = .pending
            case "succeeded": self = .succeeded
            case "failed": self = .failed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pending: return "pending"
            case .succeeded: return "succeeded"
            case .failed: return "failed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [LastStatus] = [
            .pending,
            .succeeded,
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
    public var format: Format
    public var query: CostExportQuery
    public var cadence: Cadence
    public var hour: Int
    public var timezone: String
    public var restatementDays: Int
    public var enabled: Bool
    public var destination: CostExportDestination
    public var hasCredentials: Bool
    /// Redacted marker, e.g. `AKIA…7F2Q`. No route ever returns the credential
    /// itself.
    public var credentialHint: String?
    public var lastRunAt: String?
    public var lastStatus: LastStatus
    /// Why the last run failed, verbatim from the destination where possible.
    public var lastError: String?
    public var lastObjectCount: Int?
    public var lastRowCount: Int?
    public var nextRunAt: String?
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        format: Format,
        query: CostExportQuery,
        cadence: Cadence,
        hour: Int,
        timezone: String,
        restatementDays: Int,
        enabled: Bool,
        destination: CostExportDestination,
        hasCredentials: Bool,
        credentialHint: String? = nil,
        lastRunAt: String? = nil,
        lastStatus: LastStatus,
        lastError: String? = nil,
        lastObjectCount: Int? = nil,
        lastRowCount: Int? = nil,
        nextRunAt: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.format = format
        self.query = query
        self.cadence = cadence
        self.hour = hour
        self.timezone = timezone
        self.restatementDays = restatementDays
        self.enabled = enabled
        self.destination = destination
        self.hasCredentials = hasCredentials
        self.credentialHint = credentialHint
        self.lastRunAt = lastRunAt
        self.lastStatus = lastStatus
        self.lastError = lastError
        self.lastObjectCount = lastObjectCount
        self.lastRowCount = lastRowCount
        self.nextRunAt = nextRunAt
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
