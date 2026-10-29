/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostExportJob: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case queued
        case running
        case succeeded
        case failed
        case cancelled
        case expired
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "queued": self = .queued
            case "running": self = .running
            case "succeeded": self = .succeeded
            case "failed": self = .failed
            case "cancelled": self = .cancelled
            case "expired": self = .expired
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .queued: return "queued"
            case .running: return "running"
            case .succeeded: return "succeeded"
            case .failed: return "failed"
            case .cancelled: return "cancelled"
            case .expired: return "expired"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .queued,
            .running,
            .succeeded,
            .failed,
            .cancelled,
            .expired,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum Format: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case csv
        case ndjson
        case focus
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "csv": self = .csv
            case "ndjson": self = .ndjson
            case "focus": self = .focus
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .csv: return "csv"
            case .ndjson: return "ndjson"
            case .focus: return "focus"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Format] = [
            .csv,
            .ndjson,
            .focus,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum FocusVersion: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case 14
        case 13
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "1.4": self = .14
            case "1.3": self = .13
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .14: return "1.4"
            case .13: return "1.3"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [FocusVersion] = [
            .14,
            .13,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Source: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case report
            case query
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "report": self = .report
                case "query": self = .query
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .report: return "report"
                case .query: return "query"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .report,
                .query,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var reportId: String?
        public var reportName: String?
        /// The metric (or usage unit) whose per-day unit-cost columns the file
        /// carries.
        public var unitCostMetric: String?

        public init(
            kind: Kind,
            reportId: String? = nil,
            reportName: String? = nil,
            unitCostMetric: String? = nil
        ) {
            self.kind = kind
            self.reportId = reportId
            self.reportName = reportName
            self.unitCostMetric = unitCostMetric
        }
    }

    public var id: String
    /// `queued` until a gateway process claims it, `running` while the file is
    /// written, then `succeeded` (download it), `failed` (see `error`),
    /// `cancelled`, or `expired` once the file has been deleted, 24 hours after
    /// it finished.
    public var status: Status
    /// `csv` / `ndjson`: Infrawrench's own columns (`day`, the group-by dimension
    /// or tag columns, `currency`, `amount`, `usage_amount`, `usage_unit`,
    /// `exported_at`, `collection_watermark`), plus per-day unit-cost columns
    /// (`unit_cost_metric`, `unit_cost_mode`, `unit_cost_scope_cost`,
    /// `unit_cost_metric_value`, `unit_cost_value`, `unit_cost_gap`) when the
    /// exported report draws a unit cost. `focus`: the FOCUS layout at full row
    /// grain, as CSV.
    public var format: Format
    public var focusVersion: FocusVersion?
    public var from: String
    public var to: String
    public var source: Source
    /// 0 to 1: the share of the range written so far.
    public var progress: Double
    public var rowCount: Int
    /// Uncompressed bytes written so far.
    public var byteCount: Double
    public var error: String?
    public var fileName: String
    public var contentType: String
    public var createdAt: String
    public var startedAt: String?
    public var finishedAt: String?
    /// When the file is deleted: 24 hours after it finished.
    public var expiresAt: String?
    /// Path of `GET /costs/exports/jobs/{jobId}/download` once `succeeded`, else
    /// null. Authenticated like every other route.
    public var downloadUrl: String?

    public init(
        id: String,
        status: Status,
        format: Format,
        focusVersion: FocusVersion? = nil,
        from: String,
        to: String,
        source: Source,
        progress: Double,
        rowCount: Int,
        byteCount: Double,
        error: String? = nil,
        fileName: String,
        contentType: String,
        createdAt: String,
        startedAt: String? = nil,
        finishedAt: String? = nil,
        expiresAt: String? = nil,
        downloadUrl: String? = nil
    ) {
        self.id = id
        self.status = status
        self.format = format
        self.focusVersion = focusVersion
        self.from = from
        self.to = to
        self.source = source
        self.progress = progress
        self.rowCount = rowCount
        self.byteCount = byteCount
        self.error = error
        self.fileName = fileName
        self.contentType = contentType
        self.createdAt = createdAt
        self.startedAt = startedAt
        self.finishedAt = finishedAt
        self.expiresAt = expiresAt
        self.downloadUrl = downloadUrl
    }
}
