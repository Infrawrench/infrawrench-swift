/*
 * InfrawrenchSDK v1.96.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.96.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AwsPricingQueryResult: Codable, Hashable, Sendable {
    public var columns: [AwsPricingResultColumn]
    /// Each row's values, in `columns` order.
    public var rows: [[AwsPricingCell?]]
    /// More rows matched than `maxRows`; add a LIMIT or aggregate to see them
    /// all.
    public var truncated: Bool
    public var elapsedMs: Int

    public init(
        columns: [AwsPricingResultColumn],
        rows: [[AwsPricingCell?]],
        truncated: Bool,
        elapsedMs: Int
    ) {
        self.columns = columns
        self.rows = rows
        self.truncated = truncated
        self.elapsedMs = elapsedMs
    }
}
