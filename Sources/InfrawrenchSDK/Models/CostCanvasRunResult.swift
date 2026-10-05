/*
 * InfrawrenchSDK v1.68.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.68.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostCanvasRunResult: Codable, Hashable, Sendable {
    public var canvasId: String?
    public var name: String
    public var ranAt: String
    public var displayCurrency: String?
    /// One result per block, in spec order, each `{id, kind, ...}` with an
    /// `error` string when that block failed: `kpi` carries `kpi {value, unit,
    /// currency, previous, changePercent, from, to, note}`, `table` carries
    /// `table {columns, rows, currency}`, `chart`/`cost_report` carry the cost or
    /// unit-cost query response when chart data was requested, `budgets`,
    /// `anomalies` and `custom_graph` carry their rows or render spec, and `text`
    /// carries the narrative with KPI tokens filled in.
    public var blocks: [JsonObject]

    public init(
        canvasId: String? = nil,
        name: String,
        ranAt: String,
        displayCurrency: String? = nil,
        blocks: [JsonObject]
    ) {
        self.canvasId = canvasId
        self.name = name
        self.ranAt = ranAt
        self.displayCurrency = displayCurrency
        self.blocks = blocks
    }
}
