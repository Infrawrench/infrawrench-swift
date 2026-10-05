/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricImportPreviewRequest: Codable, Hashable, Sendable {
    public var accountId: String
    /// The source plugin's form values, keyed by field (see `GET
    /// /business-metrics/importer-sources`). SQL fields must be a single SELECT
    /// or WITH statement; `{{from}}`, `{{to}}`, `{{to_exclusive}}` and
    /// `{{timezone}}` are replaced with quoted literals.
    public var params: [String: String]
    /// Default: 14 days ending yesterday.
    public var from: String?
    public var to: String?
    public var timezone: String?
    public var aggregation: BusinessMetricImportAggregation?
    /// Validate with the provider without reading data, where the source supports
    /// it.
    public var dryRun: Bool?

    public init(
        accountId: String,
        params: [String: String],
        from: String? = nil,
        to: String? = nil,
        timezone: String? = nil,
        aggregation: BusinessMetricImportAggregation? = nil,
        dryRun: Bool? = nil
    ) {
        self.accountId = accountId
        self.params = params
        self.from = from
        self.to = to
        self.timezone = timezone
        self.aggregation = aggregation
        self.dryRun = dryRun
    }
}
