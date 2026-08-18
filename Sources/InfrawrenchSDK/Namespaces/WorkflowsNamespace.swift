/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.workflows`
public final class WorkflowsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.workflows.schedule`
    public let schedule: WorkflowsScheduleNamespace
    /// `client.workflows.secrets`
    public let secrets: WorkflowsSecretsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.schedule = WorkflowsScheduleNamespace(transport: transport)
        self.secrets = WorkflowsSecretsNamespace(transport: transport)
    }

    /// Generated infra.d.ts for a workflow
    ///
    /// The ambient TypeScript declarations workflow source is written against,
    /// specialized with this organization's connected accounts, resource types,
    /// SSH key names, and the workflow's trigger + metrics. Default is the fast
    /// static surface (`create` fields are `Record<string, string>`). Pass
    /// `enrich=1` for a second pass that hits provider APIs for precise create()
    /// field unions and live sidecar capability flags — the editor loads static
    /// first and upgrades when that finishes.
    ///
    /// _Requires permission: `workflows:read`._
    ///
    /// GET /api/org/{orgId}/workflows/{id}/typings
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow id.
    ///
    /// - Parameter enrich: When `1` or `true`, enrich create() field shapes and
    /// sidecar capabilities from live provider configs. Omit for the fast static
    /// surface. One of `1`, `true`.
    public func typings(
        orgId: String? = nil,
        id: String,
        enrich: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> WorkflowTypingsResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/workflows/{id}/typings",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                query: [QueryParameter("enrich", enrich)]
            ),
            options: options
        )
    }
}

/// `client.workflows.schedule`
public final class WorkflowsScheduleNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Remove a workflow's cron schedule
    ///
    /// Reverts the workflow's trigger to manual and clears the pending fire time.
    /// A no-op when the trigger is not cron.
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// DELETE /api/org/{orgId}/workflows/{id}/schedule
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow id.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/workflows/{id}/schedule",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a workflow's cron schedule
    ///
    /// The schedule view of the workflow's trigger, with the next few computed
    /// fire times. `schedule` is null when the workflow is triggered some other
    /// way (manual, git, budget).
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// GET /api/org/{orgId}/workflows/{id}/schedule
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow id.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> WorkflowScheduleResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/workflows/{id}/schedule",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Create or replace a workflow's cron schedule
    ///
    /// Sets the workflow's trigger to cron with the given expression and
    /// timezone, validating both, and computes the next fire time. The workflow
    /// fires at the schedule's next occurrence — never immediately on save.
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// PUT /api/org/{orgId}/workflows/{id}/schedule
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow id.
    public func update(
        orgId: String? = nil,
        id: String,
        body: WorkflowScheduleInput,
        options: RequestOptions? = nil
    ) async throws -> WorkflowScheduleResponse {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/workflows/{id}/schedule",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.workflows.secrets`
public final class WorkflowsSecretsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List a workflow's assigned secrets
    ///
    /// Returns assigned ids and metadata only, never values.
    ///
    /// _Requires permission: `secrets:read`._
    ///
    /// GET /api/org/{orgId}/workflows/{id}/secrets
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow id.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> WorkflowSecretAssignment {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/workflows/{id}/secrets",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Replace a workflow's secret assignments
    ///
    /// _Requires permission: `workflows:write`._
    ///
    /// PUT /api/org/{orgId}/workflows/{id}/secrets
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow id.
    public func update(
        orgId: String? = nil,
        id: String,
        body: WorkflowSecretAssignmentInput,
        options: RequestOptions? = nil
    ) async throws -> WorkflowSecretAssignment {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/workflows/{id}/secrets",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
