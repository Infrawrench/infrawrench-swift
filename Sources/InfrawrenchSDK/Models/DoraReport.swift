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

public struct DoraReport: Codable, Hashable, Sendable {
    public enum Bucket: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case day
        case week
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "day": self = .day
            case "week": self = .week
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .day: return "day"
            case .week: return "week"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Bucket] = [
            .day,
            .week,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public struct Trend: Codable, Hashable, Sendable {
        public var start: String
        public var deploys: Int
        public var changes: Int
        public var failures: Int
        public var restores: Int
        public var leadTimeMedianHours: Double?
        public var changeFailureRate: Double?
        public var restoreMedianHours: Double?

        public init(
            start: String,
            deploys: Int,
            changes: Int,
            failures: Int,
            restores: Int,
            leadTimeMedianHours: Double? = nil,
            changeFailureRate: Double? = nil,
            restoreMedianHours: Double? = nil
        ) {
            self.start = start
            self.deploys = deploys
            self.changes = changes
            self.failures = failures
            self.restores = restores
            self.leadTimeMedianHours = leadTimeMedianHours
            self.changeFailureRate = changeFailureRate
            self.restoreMedianHours = restoreMedianHours
        }
    }

    public struct Breakdown: Codable, Hashable, Sendable {
        public var key: String?
        public var label: String
        public var summary: DoraSummary

        public init(
            key: String? = nil,
            label: String,
            summary: DoraSummary
        ) {
            self.key = key
            self.label = label
            self.summary = summary
        }
    }

    public struct Dimension: Codable, Hashable, Sendable {
        public var id: String
        public var label: String

        public init(
            id: String,
            label: String
        ) {
            self.id = id
            self.label = label
        }
    }

    public var from: String
    public var to: String
    public var bucket: Bucket
    public var filter: DoraScopeFilter?
    public var groupBy: String
    public var summary: DoraSummary
    public var previous: DoraSummary
    public var trend: [Trend]
    /// The four metrics per value of `groupBy`, busiest first, at most 25 rows.
    public var breakdown: [Breakdown]
    /// Scope dimensions this server knows: environment, repository, owner, and
    /// any added.
    public var dimensions: [Dimension]
    public var settings: DoraSettings
    /// Deploy events of any environment in the window.
    public var eventCount: Int
    /// Every value each dimension took in the window: what a scope picker offers.
    public var scopeValues: [String: [DoraScopeValue]]

    public init(
        from: String,
        to: String,
        bucket: Bucket,
        filter: DoraScopeFilter? = nil,
        groupBy: String,
        summary: DoraSummary,
        previous: DoraSummary,
        trend: [Trend],
        breakdown: [Breakdown],
        dimensions: [Dimension],
        settings: DoraSettings,
        eventCount: Int,
        scopeValues: [String: [DoraScopeValue]]
    ) {
        self.from = from
        self.to = to
        self.bucket = bucket
        self.filter = filter
        self.groupBy = groupBy
        self.summary = summary
        self.previous = previous
        self.trend = trend
        self.breakdown = breakdown
        self.dimensions = dimensions
        self.settings = settings
        self.eventCount = eventCount
        self.scopeValues = scopeValues
    }
}
