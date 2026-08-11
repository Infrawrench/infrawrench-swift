/*
 * InfrawrenchSDK v1.9.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.9.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceLeaseCreate: Codable, Hashable, Sendable {
    public var resourceId: String
    public var accountId: String
    /// Must be in the future, at most 365 days out.
    public var expiresAt: String
    /// Requires the `resources:delete` permission when true.
    public var autoDelete: Bool?
    public var note: String?

    public init(
        resourceId: String,
        accountId: String,
        expiresAt: String,
        autoDelete: Bool? = nil,
        note: String? = nil
    ) {
        self.resourceId = resourceId
        self.accountId = accountId
        self.expiresAt = expiresAt
        self.autoDelete = autoDelete
        self.note = note
    }
}
