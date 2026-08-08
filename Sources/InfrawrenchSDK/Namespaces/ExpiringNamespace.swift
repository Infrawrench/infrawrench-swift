/*
 * InfrawrenchSDK v0.43.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.43.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.expiring`
public final class ExpiringNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.expiring.settings`
    public let settings: ExpiringSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = ExpiringSettingsNamespace(transport: transport)
    }

    /// List approaching deadlines on synced resources
    ///
    /// One cross-provider countdown of everything with a clock on it: TLS
    /// certificate expiries, domain registrations, API token expirations, access
    /// keys past their rotation budget, Kubernetes/SSH credential ages. Plugins
    /// declare which synced fields carry deadlines; the feed is computed over
    /// already-stored state, so no provider API calls are made and results
    /// reflect the last sync. Items are sorted soonest first and bucketed by
    /// severity against the organization's lead time.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/expiring
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ExpiryListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/expiring",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.expiring.settings`
public final class ExpiringSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the organization's expiry alert settings
    ///
    /// The lead time feeds both the feed's `upcoming` bucket and the poller's
    /// daily alert scan. An organization that never saved reads the shipped
    /// defaults (enabled, 60 days).
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/expiring/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ExpiryAlertSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/expiring/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the expiry alert settings
    ///
    /// Every field is optional so a single toggle can be saved on its own.
    /// `leadDays` must be a whole number from 1 to 365. Saving never resets the
    /// alert cooldown.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/expiring/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: ExpiryAlertSettingsUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> ExpiryAlertSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/expiring/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
