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

public struct NetworkFlowReportResult: Codable, Hashable, Sendable {
    public var from: String
    public var to: String
    public var granularity: NetworkFlowReportGranularity
    public var groupBy: NetworkFlowReportGroupBy
    public var metric: NetworkFlowReportMetric
    public var estimated: Bool
    public var buckets: [String]
    /// The chart: the largest groups, then one `__other__` series per currency,
    /// so the stack adds up to `overall`. Empty when `groupBy` is `none`.
    public var series: [NetworkFlowReportSeries]
    /// All groups combined, one series per currency.
    public var overall: [NetworkFlowReportSeries]
    /// Per-group totals, largest first, up to `topN`.
    public var groups: [NetworkFlowReportGroupTotal]
    /// How many groups there were before the `topN` cut.
    public var groupCount: Int
    public var topTalkers: [NetworkFlowReportTalker]
    public var sampledPluginIds: [String]
    public var notices: [NetworkFlowReportNotice]

    public init(
        from: String,
        to: String,
        granularity: NetworkFlowReportGranularity,
        groupBy: NetworkFlowReportGroupBy,
        metric: NetworkFlowReportMetric,
        estimated: Bool,
        buckets: [String],
        series: [NetworkFlowReportSeries],
        overall: [NetworkFlowReportSeries],
        groups: [NetworkFlowReportGroupTotal],
        groupCount: Int,
        topTalkers: [NetworkFlowReportTalker],
        sampledPluginIds: [String],
        notices: [NetworkFlowReportNotice]
    ) {
        self.from = from
        self.to = to
        self.granularity = granularity
        self.groupBy = groupBy
        self.metric = metric
        self.estimated = estimated
        self.buckets = buckets
        self.series = series
        self.overall = overall
        self.groups = groups
        self.groupCount = groupCount
        self.topTalkers = topTalkers
        self.sampledPluginIds = sampledPluginIds
        self.notices = notices
    }
}
