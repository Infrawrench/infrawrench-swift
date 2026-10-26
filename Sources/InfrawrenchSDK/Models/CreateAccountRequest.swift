/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreateAccountRequest: Codable, Hashable, Sendable {
    public var pluginId: String
    public var displayName: String
    /// An `__oauth` key may only carry the sealed grant returned by the provider
    /// OAuth callback (for this organization, the calling user and this plugin,
    /// within 30 minutes) or the redacted grant `GET .../credentials` returned,
    /// which counts as no grant (the stored one is kept while the token is
    /// unchanged). Any other value is rejected with 400.
    public var credentials: [String: String]
    /// Optional bastion id to route this account's cloud API traffic through.
    public var bastionId: String?

    public init(
        pluginId: String,
        displayName: String,
        credentials: [String: String],
        bastionId: String? = nil
    ) {
        self.pluginId = pluginId
        self.displayName = displayName
        self.credentials = credentials
        self.bastionId = bastionId
    }
}
