/*
 * InfrawrenchSDK v1.104.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.104.0).
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
    public var pluginId: PluginId
    public var displayName: String
    /// An `__oauth` key may only carry the sealed grant returned by the provider
    /// OAuth callback (for this organization, the calling user and this plugin,
    /// within 30 minutes) or the redacted grant `GET .../credentials` returned,
    /// which counts as no grant (the stored one is kept while the token is
    /// unchanged). Any other value is rejected with 400.
    public var credentials: [String: String]
    /// Optional bastion id to route this account's cloud API traffic through.
    public var bastionId: String?
    /// The apps to use this connection for. Each must be one the plugin offers
    /// (the distinct `product`s of its `preflight.capabilities`, where a
    /// capability without one follows the convention for its id); an empty list
    /// is rejected, as is any list for a plugin without preflight. `null`, or the
    /// plugin's whole offer, means every app and is stored as `null`.
    public var products: [ProductId]?

    public init(
        pluginId: PluginId,
        displayName: String,
        credentials: [String: String],
        bastionId: String? = nil,
        products: [ProductId]? = nil
    ) {
        self.pluginId = pluginId
        self.displayName = displayName
        self.credentials = credentials
        self.bastionId = bastionId
        self.products = products
    }
}
