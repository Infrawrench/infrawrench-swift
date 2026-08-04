/*
 * InfrawrenchSDK v0.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.changes`
public final class ChangesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.changes.alertSettings`
    public let alertSettings: ChangesAlertSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.alertSettings = ChangesAlertSettingsNamespace(transport: transport)
    }

    /// Org-wide change timeline (paginated, filterable)
    ///
    /// Change events recorded by the resource poller: each poll cycle diffs the
    /// freshly fetched state against the stored snapshot and records resources
    /// that appeared, changed a stored field, or disappeared upstream.
    /// Cross-provider by construction — the diff runs on the generic stored
    /// record, so every plugin's resources show up here.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/changes
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        page: Int? = nil,
        pageSize: Int? = nil,
        accountId: String? = nil,
        resourceId: String? = nil,
        kind: ResourceChangeKind? = nil,
        from: String? = nil,
        to: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceChangeFeedResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/changes",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("page", page), QueryParameter("pageSize", pageSize), QueryParameter("accountId", accountId), QueryParameter("resourceId", resourceId), QueryParameter("kind", kind), QueryParameter("from", from), QueryParameter("to", to)]
            ),
            options: options
        )
    }

    /// Change timeline for one resource
    ///
    /// Recent change events for a single resource, newest first. The resource id
    /// travels as a query parameter because composite ids contain slashes and
    /// colons.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/changes/resource
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func resource(
        orgId: String? = nil,
        resourceId: String,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceChangeListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/changes/resource",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }
}

/// `client.changes.alertSettings`
public final class ChangesAlertSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the organization's resource-drift alert filter
    ///
    /// Drift notifications are batched: at most one message per organization per
    /// `cooldownMinutes`, covering every change since the previous one. These
    /// settings decide which changes count and how often a message may go out.
    /// Who receives it is the `resourceDrift` opt-in on push preferences, Slack
    /// channels and Teams webhooks — off by default on all three.
    ///
    /// GET /api/org/{orgId}/changes/alert-settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> DriftAlertSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/changes/alert-settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the organization's resource-drift alert filter
    ///
    /// Every field is optional so a single toggle can be saved on its own.
    /// `cooldownMinutes` is floored at 5: below the poller's own cycle the
    /// notification rate would follow the sync rate again, which is what the
    /// batching exists to prevent.
    ///
    /// PUT /api/org/{orgId}/changes/alert-settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: DriftAlertSettingsUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> DriftAlertSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/changes/alert-settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
