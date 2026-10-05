/*
 * InfrawrenchSDK v1.63.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.63.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricImporterInput: Codable, Hashable, Sendable {
    /// A connected account whose plugin declares a business-metric source.
    public var accountId: String
    /// The source plugin's form values, keyed by field (see `GET
    /// /business-metrics/importer-sources`). SQL fields must be a single SELECT
    /// or WITH statement; `{{from}}`, `{{to}}`, `{{to_exclusive}}` and
    /// `{{timezone}}` are replaced with quoted literals.
    public var params: [String: String]
    public var schedule: BusinessMetricImportSchedule?
    /// Trailing closed days each scheduled run restates, ending yesterday. Absent
    /// is 7.
    public var backfillDays: Int?
    /// IANA timezone the days are counted in. Absent is `UTC`.
    public var timezone: String?
    public var aggregation: BusinessMetricImportAggregation?
    /// Absent is true.
    public var enabled: Bool?

    public init(
        accountId: String,
        params: [String: String],
        schedule: BusinessMetricImportSchedule? = nil,
        backfillDays: Int? = nil,
        timezone: String? = nil,
        aggregation: BusinessMetricImportAggregation? = nil,
        enabled: Bool? = nil
    ) {
        self.accountId = accountId
        self.params = params
        self.schedule = schedule
        self.backfillDays = backfillDays
        self.timezone = timezone
        self.aggregation = aggregation
        self.enabled = enabled
    }
}
