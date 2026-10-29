/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.whoami`
public final class WhoamiNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Identify a bearer credential
    ///
    /// Reports who an `Authorization: Bearer` credential belongs to: an API key,
    /// an agent credential, or a WorkOS access token. Needs no scope; a 401 means
    /// the credential is unknown, revoked, expired or no longer backed by an
    /// organization membership. Use it to check a key before relying on it, or to
    /// gate a service of your own on Infrawrench sign-in.
    ///
    /// GET /api/v1/whoami
    ///
    /// Raises on 401: Unauthenticated
    public func get(
        options: RequestOptions? = nil
    ) async throws -> Whoami {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/v1/whoami"
            ),
            options: options
        )
    }
}
