/*
 * InfrawrenchSDK v1.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.14.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.quotas`
public final class QuotasNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.quotas.settings`
    public let settings: QuotasSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = QuotasSettingsNamespace(transport: transport)
    }

    /// List provider quota utilisation across the organization
    ///
    /// How close each account is to the limits its provider enforces, with the
    /// trend fitted over the last 14 days of collected readings. Both halves of
    /// every row — the used figure and the limit — come from the provider;
    /// nothing is filled in from published defaults, so an account with an
    /// approved increase reads as having the headroom it has. This is a read over
    /// already-collected snapshots: no provider API calls are made here, and the
    /// readings are as fresh as the last collection pass (roughly six hours). A
    /// plugin that declares no quota capability contributes nothing rather than
    /// zero — see `unsupportedPluginIds`.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/quotas
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> QuotaListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/quotas",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.quotas.settings`
public final class QuotasSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the organization's quota alert settings
    ///
    /// The threshold feeds both the feed's severity buckets and the poller's
    /// daily alert scan. An organization that never saved reads the shipped
    /// defaults (enabled, 0.8).
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/quotas/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> QuotaAlertSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/quotas/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the quota alert settings
    ///
    /// Every field is optional so a single toggle can be saved on its own.
    /// `threshold` is a fraction from 0.5 to 0.99 and is rejected rather than
    /// clamped when out of range. Saving never resets the alert cooldown.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/quotas/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: QuotaAlertSettingsUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> QuotaAlertSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/quotas/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
