/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.extendedSupport`
public final class ExtendedSupportNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.extendedSupport.settings`
    public let settings: ExtendedSupportSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = ExtendedSupportSettingsNamespace(transport: transport)
    }

    /// List resources billed at extended-support or end-of-life rates
    ///
    /// Matches every synced resource's version against its provider's support
    /// calendar (declared by the plugin): resources paying an extended-support
    /// surcharge, past the end of support, or whose standard support ends within
    /// the lead time. Each finding carries the monthly surcharge an upgrade
    /// removes: the provider's billed amount where it can be attributed (AWS Cost
    /// Explorer extended-support usage types), otherwise list price. Results are
    /// cached for a few minutes; pass `refresh=true` to recompute.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/extended-support
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter refresh: Bypass the short server-side cache and recompute now.
    /// One of `true`, `false`.
    public func get(
        orgId: String? = nil,
        refresh: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ExtendedSupportListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/extended-support",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("refresh", refresh)]
            ),
            options: options
        )
    }
}

/// `client.extendedSupport.settings`
public final class ExtendedSupportSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the organization's extended-support settings
    ///
    /// An organization that never saved reads the shipped defaults (enabled, 90
    /// days).
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/extended-support/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ExtendedSupportSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/extended-support/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the extended-support settings
    ///
    /// Every field is optional. `leadDays` must be a whole number from 1 to 365.
    /// Saving never resets the alert cooldown.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/extended-support/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: ExtendedSupportSettingsUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> ExtendedSupportSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/extended-support/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
