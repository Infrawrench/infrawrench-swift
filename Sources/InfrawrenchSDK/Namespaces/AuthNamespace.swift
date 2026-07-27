/*
 * InfrawrenchSDK v0.6.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.6.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.auth`
public final class AuthNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Current session + onboarding status
    ///
    /// GET /api/auth/me
    ///
    /// Raises on 401: Unauthenticated
    public func me(
        options: RequestOptions? = nil
    ) async throws -> Session {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/auth/me"
            ),
            options: options
        )
    }

    /// Organizations the current user belongs to
    ///
    /// GET /api/auth/orgs
    ///
    /// Raises on 401: Unauthenticated
    public func orgs(
        options: RequestOptions? = nil
    ) async throws -> [OrgMembership] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/auth/orgs"
            ),
            options: options
        )
    }
}
