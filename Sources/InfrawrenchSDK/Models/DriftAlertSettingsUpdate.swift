/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DriftAlertSettingsUpdate: Codable, Hashable, Sendable {
    public var notifyCreated: Bool?
    public var notifyUpdated: Bool?
    public var notifyDeleted: Bool?
    public var cooldownMinutes: Int?
    public var minChanges: Int?
    public var accountIds: [String]?

    public init(
        notifyCreated: Bool? = nil,
        notifyUpdated: Bool? = nil,
        notifyDeleted: Bool? = nil,
        cooldownMinutes: Int? = nil,
        minChanges: Int? = nil,
        accountIds: [String]? = nil
    ) {
        self.notifyCreated = notifyCreated
        self.notifyUpdated = notifyUpdated
        self.notifyDeleted = notifyDeleted
        self.cooldownMinutes = cooldownMinutes
        self.minChanges = minChanges
        self.accountIds = accountIds
    }
}
