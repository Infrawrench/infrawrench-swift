/*
 * InfrawrenchSDK v1.120.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.120.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentReportSeries: Codable, Hashable, Sendable {
    public struct Total: Codable, Hashable, Sendable {
        public var totals: CommitmentReportTotals
        public var metrics: CommitmentReportMetricValues

        public init(
            totals: CommitmentReportTotals,
            metrics: CommitmentReportMetricValues
        ) {
            self.totals = totals
            self.metrics = metrics
        }
    }

    /// Group key and currency, joined by U+0000: unique within a result.
    public var id: String
    /// The group's key: empty without grouping; a sentinel (`__on_demand__`,
    /// `__unattributed__`, `__unknown_kind__`) or the value otherwise.
    public var groupKey: String
    /// An account's name, a provider's display name or a holding's description
    /// where the server can name the key; the key itself otherwise (clients name
    /// kinds and sentinels).
    public var label: String
    public var currency: String
    public var points: [CommitmentReportPoint]
    public var total: Total

    public init(
        id: String,
        groupKey: String,
        label: String,
        currency: String,
        points: [CommitmentReportPoint],
        total: Total
    ) {
        self.id = id
        self.groupKey = groupKey
        self.label = label
        self.currency = currency
        self.points = points
        self.total = total
    }
}
