/*
 * InfrawrenchSDK v1.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.orgs`
public final class OrgsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a new organization
    ///
    /// The caller becomes the `owner` of the new organization.
    ///
    /// POST /api/orgs
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 401: Unauthenticated
    public func create(
        body: CreateOrgRequest,
        options: RequestOptions? = nil
    ) async throws -> Organization {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/orgs",
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
