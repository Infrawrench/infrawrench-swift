/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrphanListResponse: Codable, Hashable, Sendable {
    /// Groups sorted by account name.
    public var accounts: [OrphanAccountGroup]
    public var totalCount: Int
    /// Flagged resources with no recorded owner — the 'nobody to ask' count.
    public var unownedCount: Int
    /// Days of trailing spend the annotations cover.
    public var costWindowDays: Int
    public var generatedAt: String

    public init(
        accounts: [OrphanAccountGroup],
        totalCount: Int,
        unownedCount: Int,
        costWindowDays: Int,
        generatedAt: String
    ) {
        self.accounts = accounts
        self.totalCount = totalCount
        self.unownedCount = unownedCount
        self.costWindowDays = costWindowDays
        self.generatedAt = generatedAt
    }
}
