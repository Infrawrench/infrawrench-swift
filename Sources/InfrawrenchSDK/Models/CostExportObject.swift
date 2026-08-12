/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostExportObject: Codable, Hashable, Sendable {
    /// The period's first day, in the export's own timezone.
    public var periodStart: String
    public var from: String
    public var to: String
    /// `{prefix}/cost-export/{exportId}/{cadence}/{periodStart}.{format}`.
    /// Deterministic, so re-exporting a restated period overwrites this object
    /// instead of adding a second copy.
    public var key: String
    public var rowCount: Int
    public var byteCount: Int

    public init(
        periodStart: String,
        from: String,
        to: String,
        key: String,
        rowCount: Int,
        byteCount: Int
    ) {
        self.periodStart = periodStart
        self.from = from
        self.to = to
        self.key = key
        self.rowCount = rowCount
        self.byteCount = byteCount
    }
}
