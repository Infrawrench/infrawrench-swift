/*
 * InfrawrenchSDK v0.43.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.43.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExpiryListResponse: Codable, Hashable, Sendable {
    /// All tracked deadlines, soonest first (`ok` items included).
    public var items: [ExpiryItem]
    public var totalCount: Int
    public var counts: ExpirySeverityCounts
    /// The lead time the `upcoming` bucket was computed against.
    public var leadDays: Int
    public var generatedAt: String

    public init(
        items: [ExpiryItem],
        totalCount: Int,
        counts: ExpirySeverityCounts,
        leadDays: Int,
        generatedAt: String
    ) {
        self.items = items
        self.totalCount = totalCount
        self.counts = counts
        self.leadDays = leadDays
        self.generatedAt = generatedAt
    }
}
