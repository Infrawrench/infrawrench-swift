/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DriftAlertSettings: Codable, Hashable, Sendable {
    /// Alert on resources that appeared.
    public var notifyCreated: Bool
    /// Alert on field-level updates. Defaults to false — updates are the bulk of
    /// the volume and are usually a provider restating a value.
    public var notifyUpdated: Bool
    /// Alert on resources that disappeared.
    public var notifyDeleted: Bool
    /// Least time between drift notifications for this organization. One
    /// notification per window, no matter how many changes or accounts it covers.
    public var cooldownMinutes: Int
    /// Fewest matching changes in a window worth notifying about.
    public var minChanges: Int
    /// Accounts to alert on. An empty array means every account.
    public var accountIds: [String]
    /// When this organization last had a drift digest delivered.
    public var lastNotifiedAt: String?

    public init(
        notifyCreated: Bool,
        notifyUpdated: Bool,
        notifyDeleted: Bool,
        cooldownMinutes: Int,
        minChanges: Int,
        accountIds: [String],
        lastNotifiedAt: String? = nil
    ) {
        self.notifyCreated = notifyCreated
        self.notifyUpdated = notifyUpdated
        self.notifyDeleted = notifyDeleted
        self.cooldownMinutes = cooldownMinutes
        self.minChanges = minChanges
        self.accountIds = accountIds
        self.lastNotifiedAt = lastNotifiedAt
    }
}
