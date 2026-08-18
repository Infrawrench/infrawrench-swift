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

/// `client.tagPolicy`
public final class TagPolicyNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Per-account tag compliance scores
    ///
    /// For each account: how many of its resources expose tags and how many of
    /// those carry every required tag with an allowed value. `score` is over the
    /// evaluated (tag-capable) set so untaggable resource types don't drag it.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/tag-policy/compliance
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func compliance(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> TagComplianceReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/tag-policy/compliance",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// The org's required-tag policy
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/tag-policy
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> TagPolicy {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/tag-policy",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Replace the org's tag policy
    ///
    /// Sets the required tag keys (each optionally restricted to allowed values)
    /// and whether resource creation is blocked when they are missing. Keys are
    /// matched case-insensitively against the generic `tags`/`labels` field
    /// convention.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/tag-policy
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: TagPolicy,
        options: RequestOptions? = nil
    ) async throws -> TagPolicy {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/tag-policy",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
