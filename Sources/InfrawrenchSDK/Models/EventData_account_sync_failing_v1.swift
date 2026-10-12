/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `data` of a `account.sync.failing` event, version 1. An account's sync kept
/// failing past the org's paging threshold.
public struct EventData_account_sync_failing_v1: Codable, Hashable, Sendable {
    /// The account whose sync is failing.
    public var accountId: String
    /// Account display name.
    public var accountName: String
    /// The resource type the failing sync lists.
    public var resourceTypeId: String
    /// Sync incident id (shared by failing and recovered).
    public var incidentId: String
    /// The provider's last error.
    public var error: String
    /// Failures in the window.
    public var failureCount: Int
    /// The window the failures were counted in.
    public var windowMinutes: Int

    public init(
        accountId: String,
        accountName: String,
        resourceTypeId: String,
        incidentId: String,
        error: String,
        failureCount: Int,
        windowMinutes: Int
    ) {
        self.accountId = accountId
        self.accountName = accountName
        self.resourceTypeId = resourceTypeId
        self.incidentId = incidentId
        self.error = error
        self.failureCount = failureCount
        self.windowMinutes = windowMinutes
    }
}
