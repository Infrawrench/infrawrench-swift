/*
 * InfrawrenchSDK v1.89.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.89.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AwsPricingQueryRequest: Codable, Hashable, Sendable {
    /// One read-only statement: SELECT or WITH (also DESCRIBE, SHOW, EXPLAIN). No
    /// FORMAT or SETTINGS clause, no trailing second statement.
    public var sql: String
    /// Rows to return at most. Default 1,000; at most 10,000.
    public var maxRows: Int?

    public init(
        sql: String,
        maxRows: Int? = nil
    ) {
        self.sql = sql
        self.maxRows = maxRows
    }
}
