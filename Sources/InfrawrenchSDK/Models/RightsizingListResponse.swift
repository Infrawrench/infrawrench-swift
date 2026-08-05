/*
 * InfrawrenchSDK v0.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RightsizingListResponse: Codable, Hashable, Sendable {
    /// Groups sorted by account name.
    public var accounts: [OversizedAccountGroup]
    public var totalCount: Int
    /// Days of stored metrics the percentiles cover.
    public var windowDays: Int
    public var generatedAt: String

    public init(
        accounts: [OversizedAccountGroup],
        totalCount: Int,
        windowDays: Int,
        generatedAt: String
    ) {
        self.accounts = accounts
        self.totalCount = totalCount
        self.windowDays = windowDays
        self.generatedAt = generatedAt
    }
}
