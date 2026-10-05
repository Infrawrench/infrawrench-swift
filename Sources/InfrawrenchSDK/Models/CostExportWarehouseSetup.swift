/*
 * InfrawrenchSDK v1.74.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostExportWarehouseSetup: Codable, Hashable, Sendable {
    /// GRANT statements to run once, with comments.
    public var sql: String
    public var notes: [String]

    public init(
        sql: String,
        notes: [String]
    ) {
        self.sql = sql
        self.notes = notes
    }
}
