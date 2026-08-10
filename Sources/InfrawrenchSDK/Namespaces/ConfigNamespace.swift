/*
 * InfrawrenchSDK v1.7.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.7.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.config`
public final class ConfigNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Apply a configuration document
    ///
    /// Applies the document in a single transaction and returns the plan that was
    /// executed — all or nothing, so a failure never leaves the organization
    /// halfway between two configurations.
    ///
    /// Requires the write permission of every section the document carries, so
    /// this cannot be used to reach past a role that withholds one.
    ///
    /// _Requires permission: `config:write`._
    ///
    /// POST /api/org/{orgId}/config/apply
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 402: Payment required — the organization's plan does not include
    /// this
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func apply(
        orgId: String? = nil,
        body: OrgConfigRequest,
        options: RequestOptions? = nil
    ) async throws -> OrgConfigApplyResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/config/apply",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Export the organization's configuration as one document
    ///
    /// Dashboards, workflows, custom graphs, budgets, metric alerts, synthetic
    /// probes, cost centres, the tag policy and the org-wide alert settings,
    /// addressed by stable keys rather than row ids so the result applies to any
    /// organization.
    ///
    /// Credentials, accounts, resources and workflow signing secrets are never
    /// included. Ordering is stable, so re-exporting an unchanged organization
    /// produces the same bytes — commit it to git and the diff is the change.
    ///
    /// Requires the read permission of every section exported; it refuses rather
    /// than silently omitting one, because a partial document applied in
    /// `replace` mode would delete what the exporter could not see.
    ///
    /// _Requires permission: `config:read`._
    ///
    /// GET /api/org/{orgId}/config/export
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter sections: Comma-separated subset of sections to export.
    /// Defaults to all of: budgets, customGraphs, workflows, dashboards,
    /// metricAlerts, probes, costCentres, tagPolicy, alertSettings.
    public func export(
        orgId: String? = nil,
        sections: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> OrgConfigDocument {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/config/export",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("sections", sections)]
            ),
            options: options
        )
    }

    /// Preview what applying a document would do
    ///
    /// The dry run: validates the document, resolves its cross-references against
    /// this organization, and returns the create/update/delete/unchanged plan
    /// without writing anything. Read-only, so a reviewer with read access can
    /// run it on a pull request.
    ///
    /// _Requires permission: `config:read`._
    ///
    /// POST /api/org/{orgId}/config/plan
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func plan(
        orgId: String? = nil,
        body: OrgConfigRequest,
        options: RequestOptions? = nil
    ) async throws -> OrgConfigPlan {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/config/plan",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
