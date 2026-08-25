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

public struct CostExportInput: Codable, Hashable, Sendable {
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

    public var name: String
    public var format: Format
    public var query: CostExportQuery
    /// How often a run happens and — because a run writes one object per period —
    /// what a period is: a calendar day, an ISO week (Monday-start), or a
    /// calendar month.
    public var cadence: Cadence
    /// Local hour in `timezone` a run fires at.
    public var hour: Int
    /// IANA zone, e.g. `Europe/Berlin`. Validated against `Intl`.
    public var timezone: String
    /// Trailing days of already-written periods each run re-exports. Providers
    /// restate spend for days after the fact, so the object written for yesterday
    /// is not final; every period overlapping this window is rebuilt in full at
    /// its existing key, which overwrites rather than duplicates. 0 disables it
    /// and is only correct for an org whose providers never revise.
    public var restatementDays: Int
    public var enabled: Bool
    public var destination: CostExportDestination
    /// S3 only. Write-only; omit on update to keep the stored credential.
    public var accessKeyId: String?
    /// S3 only. Write-only, never returned.
    public var secretAccessKey: String?
    /// HTTPS destinations only. Write-only, never returned — a signed URL carries
    /// its own signature, so it is treated as a bearer credential.
    public var url: String?

    public init(
        name: String,
        format: Format,
        query: CostExportQuery,
        cadence: Cadence,
        hour: Int,
        timezone: String,
        restatementDays: Int,
        enabled: Bool,
        destination: CostExportDestination,
        accessKeyId: String? = nil,
        secretAccessKey: String? = nil,
        url: String? = nil
    ) {
        self.name = name
        self.format = format
        self.query = query
        self.cadence = cadence
        self.hour = hour
        self.timezone = timezone
        self.restatementDays = restatementDays
        self.enabled = enabled
        self.destination = destination
        self.accessKeyId = accessKeyId
        self.secretAccessKey = secretAccessKey
        self.url = url
    }
}
