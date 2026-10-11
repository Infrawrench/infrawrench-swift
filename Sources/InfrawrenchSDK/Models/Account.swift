/*
 * InfrawrenchSDK v1.80.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.80.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Account: Codable, Hashable, Sendable {
    public var id: String
    public var pluginId: String
    public var displayName: String
    /// Bastion this account's cloud-API egress is routed through. `null` ⇒ direct
    /// egress.
    public var bastionId: String?
    public var oauthStatus: AccountOAuthStatus?
    public var createdAt: String

    public init(
        id: String,
        pluginId: String,
        displayName: String,
        bastionId: String? = nil,
        oauthStatus: AccountOAuthStatus? = nil,
        createdAt: String
    ) {
        self.id = id
        self.pluginId = pluginId
        self.displayName = displayName
        self.bastionId = bastionId
        self.oauthStatus = oauthStatus
        self.createdAt = createdAt
    }
}
