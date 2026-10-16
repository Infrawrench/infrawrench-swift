/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.dora`
public final class DoraNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.dora.settings`
    public let settings: DoraSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = DoraSettingsNamespace(transport: transport)
    }

    /// List production changes
    ///
    /// The drill-down: every production change in the window with its lead time
    /// and, when it failed, what it was blamed for. Newest first, at most 500.
    ///
    /// _Requires permission: `deployments:read`._
    ///
    /// GET /api/org/{orgId}/dora/changes
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: Start (inclusive). Defaults to 30 days before `to`.
    ///
    /// - Parameter to: End (exclusive). Defaults to now. At most 366 days after
    /// `from`.
    ///
    /// - Parameter dimension: Filter to one scope of this dimension.
    ///
    /// - Parameter value: The scope key to filter to. Omit it with `dimension`
    /// for changes where it is not known.
    ///
    /// - Parameter failedOnly: One of `true`, `false`.
    public func changes(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        dimension: String? = nil,
        value: String? = nil,
        failedOnly: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> DoraChangeList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/dora/changes",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to), QueryParameter("dimension", dimension), QueryParameter("value", value), QueryParameter("failedOnly", failedOnly)]
            ),
            options: options
        )
    }

    /// Record a deploy
    ///
    /// For a CI or deploy tool no plugin covers: one call per deploy, from the
    /// pipeline's last step. Idempotent on `externalId`, so a retried step
    /// updates rather than duplicates. Audit-logged.
    ///
    /// _Requires permission: `deployments:write`._
    ///
    /// POST /api/org/{orgId}/dora/deployments
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func deployments(
        orgId: String? = nil,
        body: DoraDeploymentInput? = nil,
        options: RequestOptions? = nil
    ) async throws -> DoraDeploymentRecorded {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/dora/deployments",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// DORA metrics
    ///
    /// Deployment frequency, lead time for changes, change failure rate and time
    /// to restore over production, from Infrafile runs, synced provider deploys,
    /// GitHub deployments, recorded deploys and declared incidents. With the
    /// previous period, a trend, and a breakdown.
    ///
    /// _Requires permission: `deployments:read`._
    ///
    /// GET /api/org/{orgId}/dora
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: Start (inclusive). Defaults to 30 days before `to`.
    ///
    /// - Parameter to: End (exclusive). Defaults to now. At most 366 days after
    /// `from`.
    ///
    /// - Parameter dimension: Filter to one scope of this dimension.
    ///
    /// - Parameter value: The scope key to filter to. Omit it with `dimension`
    /// for changes where it is not known.
    ///
    /// - Parameter bucket: Trend bucket; weeks past 45 days. One of `day`,
    /// `week`.
    ///
    /// - Parameter groupBy: Breakdown dimension; defaults to `environment`.
    public func get(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        dimension: String? = nil,
        value: String? = nil,
        bucket: String? = nil,
        groupBy: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> DoraReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/dora",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to), QueryParameter("dimension", dimension), QueryParameter("value", value), QueryParameter("bucket", bucket), QueryParameter("groupBy", groupBy)]
            ),
            options: options
        )
    }

    /// List recoveries
    ///
    /// Declared incidents resolved and bad deploys rolled back in the window,
    /// newest first, at most 500.
    ///
    /// _Requires permission: `deployments:read`._
    ///
    /// GET /api/org/{orgId}/dora/restores
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: Start (inclusive). Defaults to 30 days before `to`.
    ///
    /// - Parameter to: End (exclusive). Defaults to now. At most 366 days after
    /// `from`.
    ///
    /// - Parameter dimension: Filter to one scope of this dimension.
    ///
    /// - Parameter value: The scope key to filter to. Omit it with `dimension`
    /// for changes where it is not known.
    public func restores(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        dimension: String? = nil,
        value: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> DoraRestoreList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/dora/restores",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to), QueryParameter("dimension", dimension), QueryParameter("value", value)]
            ),
            options: options
        )
    }
}

/// `client.dora.settings`
public final class DoraSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Read DORA settings
    ///
    /// The org singleton; the shipped defaults until first saved.
    ///
    /// _Requires permission: `deployments:read`._
    ///
    /// GET /api/org/{orgId}/dora/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> DoraSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/dora/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update DORA settings
    ///
    /// Omitted fields keep their value. Patterns are trimmed and de-duplicated.
    /// Out-of-range values are rejected, not clamped. Audit-logged.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/dora/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: DoraSettingsUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> DoraSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/dora/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
