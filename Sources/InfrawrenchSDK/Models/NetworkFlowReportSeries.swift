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

public struct NetworkFlowReportSeries: Codable, Hashable, Sendable {
    public var id: String
    /// The group's key; `__other__` is everything outside the charted groups.
    public var groupKey: String
    public var label: String
    public var currency: String
    public var points: [NetworkFlowReportPoint]
    public var total: NetworkFlowReportTotals

    public init(
        id: String,
        groupKey: String,
        label: String,
        currency: String,
        points: [NetworkFlowReportPoint],
        total: NetworkFlowReportTotals
    ) {
        self.id = id
        self.groupKey = groupKey
        self.label = label
        self.currency = currency
        self.points = points
        self.total = total
    }
}
