/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct BusinessMetricImporter: Codable, Hashable, Sendable {
    public enum LastStatus: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case success
        case error
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "success": self = .success
            case "error": self = .error
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .success: return "success"
            case .error: return "error"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [LastStatus] = [
            .success,
            .error,
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
    public var metricId: String
    public var accountId: String
    public var accountName: String?
    public var pluginId: String?
    public var sourceLabel: String?
    public var params: [String: String]
    public var schedule: BusinessMetricImportSchedule
    public var backfillDays: Int
    public var timezone: String
    public var aggregation: BusinessMetricImportAggregation
    public var enabled: Bool
    public var nextRunAt: String?
    public var lastRunAt: String?
    public var lastStatus: LastStatus?
    public var lastError: String?
    /// Failed runs in a row; scheduling backs off on it and a success resets it.
    public var consecutiveFailures: Int
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        metricId: String,
        accountId: String,
        accountName: String? = nil,
        pluginId: String? = nil,
        sourceLabel: String? = nil,
        params: [String: String],
        schedule: BusinessMetricImportSchedule,
        backfillDays: Int,
        timezone: String,
        aggregation: BusinessMetricImportAggregation,
        enabled: Bool,
        nextRunAt: String? = nil,
        lastRunAt: String? = nil,
        lastStatus: LastStatus? = nil,
        lastError: String? = nil,
        consecutiveFailures: Int,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.metricId = metricId
        self.accountId = accountId
        self.accountName = accountName
        self.pluginId = pluginId
        self.sourceLabel = sourceLabel
        self.params = params
        self.schedule = schedule
        self.backfillDays = backfillDays
        self.timezone = timezone
        self.aggregation = aggregation
        self.enabled = enabled
        self.nextRunAt = nextRunAt
        self.lastRunAt = lastRunAt
        self.lastStatus = lastStatus
        self.lastError = lastError
        self.consecutiveFailures = consecutiveFailures
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
