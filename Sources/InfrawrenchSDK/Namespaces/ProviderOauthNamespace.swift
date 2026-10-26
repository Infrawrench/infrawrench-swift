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

/// `client.providerOauth`
public final class ProviderOauthNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Start connecting a provider account with OAuth
    ///
    /// Returns the provider's consent URL for a plugin whose listing carries
    /// `oauth`. After consent the provider redirects to
    /// `/api/provider-oauth/{pluginId}/callback`, which delivers `{ type:
    /// "infrawrench:provider-oauth", ok, pluginId, accountId?, credentials,
    /// accountName? }` (or `{ type, ok: false, pluginId, error }`) as `returnTo`
    /// asks. `credentials` holds the access token in the plugin's token field,
    /// prefilled fields the provider identified, and a sealed `__oauth` grant;
    /// send them unchanged to `POST /accounts` or `PUT
    /// /accounts/{id}/credentials` within 30 minutes. Requires `accounts:write`.
    /// 400 when the plugin has no OAuth flow or this server has no client
    /// configured for it.
    ///
    /// POST /api/org/{orgId}/provider-oauth/{pluginId}/authorize
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func authorize(
        orgId: String? = nil,
        pluginId: PluginId,
        body: ProviderOAuthAuthorizeRequest,
        options: RequestOptions? = nil
    ) async throws -> ProviderOAuthAuthorizeResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/provider-oauth/{pluginId}/authorize",
                pathParameters: ["orgId": orgId?.parameterValue, "pluginId": pluginId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
