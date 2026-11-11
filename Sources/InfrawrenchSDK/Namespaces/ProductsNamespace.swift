/*
 * InfrawrenchSDK v1.102.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.102.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.products`
public final class ProductsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the apps the organization has turned off
    ///
    /// A turned-off app is hidden from Home, the sidebar and the Tools launcher,
    /// and its tools are not offered to, and are refused for, the chat agent and
    /// the MCP server. It does not block this API: the routes behind an app keep
    /// answering under their own permissions.
    ///
    /// GET /api/org/{orgId}/products
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> OrgProductPolicy {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/products",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Set the apps the organization has turned off
    ///
    /// Replaces the list. An unknown app id, or an app that cannot be turned off
    /// (`infrastructure`), is refused with a 400 and nothing is saved.
    ///
    /// _Requires permission: `org:apps:write`._
    ///
    /// PUT /api/org/{orgId}/products
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: OrgProductPolicyUpdate,
        options: RequestOptions? = nil
    ) async throws -> OrgProductPolicy {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/products",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
