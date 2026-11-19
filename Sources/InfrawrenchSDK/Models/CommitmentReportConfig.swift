/*
 * InfrawrenchSDK v1.121.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.121.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// An absolute range covers at most 1096 days, and at most 367 at daily
/// granularity. Every relative preset fits every granularity.
public struct CommitmentReportConfig: Codable, Hashable, Sendable {
    public var version: Double
    public var dateRange: CostDateRange
    public var granularity: CommitmentReportGranularity
    public var groupBy: CommitmentReportGroupBy
    public var filters: CommitmentReportFilters
    public var metric: CommitmentReportMetric

    public init(
        version: Double,
        dateRange: CostDateRange,
        granularity: CommitmentReportGranularity,
        groupBy: CommitmentReportGroupBy,
        filters: CommitmentReportFilters,
        metric: CommitmentReportMetric
    ) {
        self.version = version
        self.dateRange = dateRange
        self.granularity = granularity
        self.groupBy = groupBy
        self.filters = filters
        self.metric = metric
    }
}
