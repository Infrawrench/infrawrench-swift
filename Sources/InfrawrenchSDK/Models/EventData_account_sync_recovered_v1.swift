/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `account.sync.recovered` event, version 1. A failing account sync
/// succeeded again.
public struct EventData_account_sync_recovered_v1: Codable, Hashable, Sendable {
    /// The account whose sync is failing.
    public var accountId: String
    /// Account display name.
    public var accountName: String
    /// The resource type the failing sync lists.
    public var resourceTypeId: String
    /// Sync incident id (shared by failing and recovered).
    public var incidentId: String

    public init(
        accountId: String,
        accountName: String,
        resourceTypeId: String,
        incidentId: String
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.resourceTypeId = resourceTypeId
        self.incidentId = incidentId
    }
}
