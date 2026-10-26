/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowReportConfig: Codable, Hashable, Sendable {
    public var version: Double
    public var dateRange: CostDateRange
    public var granularity: NetworkFlowReportGranularity
    public var groupBy: NetworkFlowReportGroupBy
    public var filters: NetworkFlowReportFilters
    public var metric: NetworkFlowReportMetric
    /// Groups and top talkers listed. Absent means 25.
    public var topN: Int?

    public init(
        version: Double,
        dateRange: CostDateRange,
        granularity: NetworkFlowReportGranularity,
        groupBy: NetworkFlowReportGroupBy,
        filters: NetworkFlowReportFilters,
        metric: NetworkFlowReportMetric,
        topN: Int? = nil
    ) {
        self.version = version
        self.dateRange = dateRange
        self.granularity = granularity
        self.groupBy = groupBy
        self.filters = filters
        self.metric = metric
        self.topN = topN
    }
}
