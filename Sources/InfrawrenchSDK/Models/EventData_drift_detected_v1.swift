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

/// `data` of a `drift.detected` event, version 1. Resources changed outside
/// Infrawrench since the last drift window.
public struct EventData_drift_detected_v1: Codable, Hashable, Sendable {
    /// Start of the window the changes were observed in.
    public var since: String
    /// Changes in the window.
    public var changeCount: Int
    /// Resources that appeared.
    public var created: Int
    /// Resources whose fields changed.
    public var updated: Int
    /// Resources that disappeared.
    public var deleted: Int
    /// Accounts the changes touched.
    public var accountIds: [String]

    public init(
        since: String,
        changeCount: Int,
        created: Int,
        updated: Int,
        deleted: Int,
        accountIds: [String]
    ) {
        self.since = since
        self.changeCount = changeCount
        self.created = created
        self.updated = updated
        self.deleted = deleted
        self.accountIds = accountIds
    }
}
