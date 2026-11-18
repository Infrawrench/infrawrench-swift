/*
 * InfrawrenchSDK v1.119.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.119.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CommitmentReportResult: Codable, Hashable, Sendable {
    /// First day of the resolved window.
    public var from: String
    /// Last day of the resolved window; never past today.
    public var to: String
    public var granularity: CommitmentReportGranularity
    public var groupBy: CommitmentReportGroupBy
    /// Every bucket start in the window, gaps included, ascending.
    public var buckets: [String]
    /// One per group and currency, largest commitment cost first.
    public var series: [CommitmentReportSeries]
    /// All groups combined, one series per currency.
    public var overall: [CommitmentReportSeries]
    public var providers: [CommitmentReportProvider]
    public var notices: [CommitmentReportNotice]

    public init(
        from: String,
        to: String,
        granularity: CommitmentReportGranularity,
        groupBy: CommitmentReportGroupBy,
        buckets: [String],
        series: [CommitmentReportSeries],
        overall: [CommitmentReportSeries],
        providers: [CommitmentReportProvider],
        notices: [CommitmentReportNotice]
    ) {
        self.from = from
        self.to = to
        self.granularity = granularity
        self.groupBy = groupBy
        self.buckets = buckets
        self.series = series
        self.overall = overall
        self.providers = providers
        self.notices = notices
    }
}
