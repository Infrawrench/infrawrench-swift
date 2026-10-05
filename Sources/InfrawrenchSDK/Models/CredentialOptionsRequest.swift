/*
 * InfrawrenchSDK v1.49.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.49.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CredentialOptionsRequest: Codable, Hashable, Sendable {
    public var pluginId: String
    /// A credential field that declares `providerOptions`.
    public var fieldKey: String
    /// The credential values entered so far. Used for the lookup only; nothing is
    /// stored.
    public var credentials: [String: String]
    /// Look up through this bastion, matching how the account will egress once
    /// created.
    public var bastionId: String?
    /// When editing an existing account, its id; the lookup then egresses through
    /// that account's bastion binding.
    public var accountId: String?

    public init(
        pluginId: String,
        fieldKey: String,
        credentials: [String: String],
        bastionId: String? = nil,
        accountId: String? = nil
    ) {
        self.pluginId = pluginId
        self.fieldKey = fieldKey
        self.credentials = credentials
        self.bastionId = bastionId
        self.accountId = accountId
    }
}
