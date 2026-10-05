/*
 * InfrawrenchSDK v1.74.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.74.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.tagKeys`
public final class TagKeysNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.tagKeys.settings`
    public let settings: TagKeysSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = TagKeysSettingsNamespace(transport: transport)
    }

    /// Discovered tag keys with usage
    ///
    /// Every tag key the org's cost data (trailing 90 days) and resource
    /// inventory carry, with the providers using it, row and resource counts, and
    /// whether the tag key settings hide or pin it. Preferred keys first, then by
    /// usage. Cost counts are included only when the caller also holds
    /// `costs:read`.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/tag-keys
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> DiscoveredTagKeys {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/tag-keys",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.tagKeys.settings`
public final class TagKeysSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// The org's hidden and preferred tag keys
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/tag-keys/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> TagKeySettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/tag-keys/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Replace the org's hidden and preferred tag keys
    ///
    /// Applied to every tag-key listing the API serves (`GET
    /// /costs/dimensions?dimension=tag-keys`, the metric alert selector options,
    /// the MCP tools): preferred keys first, hidden keys omitted. A display
    /// preference only; no stored data changes.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/tag-keys/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: TagKeySettings,
        options: RequestOptions? = nil
    ) async throws -> TagKeySettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/tag-keys/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
