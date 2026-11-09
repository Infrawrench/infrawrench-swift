/*
 * InfrawrenchSDK v1.101.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.101.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceReportConfig: Codable, Hashable, Sendable {
    public var version: Double
    public var filters: ResourceReportFilters
    /// Shown columns, in display order.
    public var columns: [String]
    public var sort: JSONValue
    public var costRange: CostDateRange
    public var costBasis: CostBasis
    public var pageSize: Int

    public init(
        version: Double,
        filters: ResourceReportFilters,
        columns: [String],
        sort: JSONValue,
        costRange: CostDateRange,
        costBasis: CostBasis,
        pageSize: Int
    ) {
        self.version = version
        self.filters = filters
        self.columns = columns
        self.sort = sort
        self.costRange = costRange
        self.costBasis = costBasis
        self.pageSize = pageSize
    }
}
