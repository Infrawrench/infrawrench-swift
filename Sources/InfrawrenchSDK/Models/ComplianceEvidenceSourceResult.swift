/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ComplianceEvidenceSourceResult: Codable, Hashable, Sendable {
    public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case snapshot
        case period
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "snapshot": self = .snapshot
            case "period": self = .period
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .snapshot: return "snapshot"
            case .period: return "period"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Kind] = [
            .snapshot,
            .period,
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
        case present
        case gap
        case noData
        case unavailable
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "present": self = .present
            case "gap": self = .gap
            case "no-data": self = .noData
            case "unavailable": self = .unavailable
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .present: return "present"
            case .gap: return "gap"
            case .noData: return "no-data"
            case .unavailable: return "unavailable"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .present,
            .gap,
            .noData,
            .unavailable,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var sourceId: String
    public var label: String
    /// `snapshot` sources describe the org at generation time; `period` sources
    /// are filtered to the period.
    public var kind: Kind
    /// `present`: evidence exists and shows nothing wrong. `gap`: evidence shows
    /// a problem. `no-data`: the source ran and has nothing to show.
    /// `unavailable`: the source could not be read (missing permission, read
    /// failure, no evaluator); never counted as evidence.
    public var status: Status
    public var summary: String
    public var metrics: [ComplianceEvidenceMetric]
    public var gaps: [String]
    /// Rows this source contributes to an evidence pack.
    public var itemCount: Int
    public var error: String?

    public init(
        sourceId: String,
        label: String,
        kind: Kind,
        status: Status,
        summary: String,
        metrics: [ComplianceEvidenceMetric],
        gaps: [String],
        itemCount: Int,
        error: String? = nil
    ) {
        self.sourceId = sourceId
        self.label = label
        self.kind = kind
        self.status = status
        self.summary = summary
        self.metrics = metrics
        self.gaps = gaps
        self.itemCount = itemCount
        self.error = error
    }
}
