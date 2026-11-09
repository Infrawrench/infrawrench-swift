/*
 * InfrawrenchSDK v1.100.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.100.0).
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

    /// Type-check workflow source
    ///
    /// Checks `source` (or the stored source) against the workflow's generated
    /// typings, the same check the editor runs. Needs `secrets:read` as well,
    /// since the typings name the assigned secrets.
    ///
    /// _Requires permission: `workflows:read`._
    ///
    /// POST /api/org/{orgId}/workflows/{id}/check
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow id.
    public func check(
        orgId: String? = nil,
        id: String,
        body: WorkflowCheckInput,
        options: RequestOptions? = nil
    ) async throws -> WorkflowTypecheckResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/workflows/{id}/check",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Create a workflow
    ///
    /// Every field is optional: an empty body creates an enabled, manually
    /// triggered workflow with no source. Assigning secrets (`secretIds`) also
    /// needs `secrets:read`.
    ///
    /// _Requires permission: `workflows:write`._
    ///
    /// POST /api/org/{orgId}/workflows
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: WorkflowInput,
        options: RequestOptions? = nil
    ) async throws -> Workflow {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/workflows",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a workflow
    ///
    /// _Requires permission: `workflows:write`._
    ///
    /// DELETE /api/org/{orgId}/workflows/{id}
    ///
    /// Raises on 400: Bad request
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
                path: "/api/org/{orgId}/workflows/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a workflow
    ///
    /// _Requires permission: `workflows:read`._
    ///
    /// GET /api/org/{orgId}/workflows/{id}
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
    ) async throws -> Workflow {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/workflows/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List workflows
    ///
    /// _Requires permission: `workflows:read`._
    ///
    /// GET /api/org/{orgId}/workflows
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [Workflow] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/workflows",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// A workflow's metric values
    ///
    /// _Requires permission: `workflows:read`._
    ///
    /// GET /api/org/{orgId}/workflows/{id}/metrics
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow id.
    public func metrics(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> [WorkflowMetric] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/workflows/{id}/metrics",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Run a workflow now
    ///
    /// Runs the workflow to completion with the caller's permissions and answers
    /// its outcome. Non-interactive: an `infra.prompt` gets no answer.
    ///
    /// _Requires permission: `workflows:write`._
    ///
    /// POST /api/org/{orgId}/workflows/{id}/run
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow id.
    public func run(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> WorkflowRunOutcome {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/workflows/{id}/run",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// A workflow's recent runs
    ///
    /// _Requires permission: `workflows:read`._
    ///
    /// GET /api/org/{orgId}/workflows/{id}/runs
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Workflow id.
    public func runs(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> [WorkflowRun] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/workflows/{id}/runs",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Generated infra.d.ts for a workflow
    ///
    /// The ambient TypeScript declarations workflow source is written against,
    /// specialized with this organization's connected accounts, resource types,
    /// SSH key names, and the workflow's trigger + metrics. Default is the fast
    /// static surface (`create` fields are `Record<string, string>`). Pass
    /// `enrich=1` for a second pass that hits provider APIs for precise create()
    /// field unions and live sidecar capability flags; the editor loads static
    /// first and upgrades when that finishes.
    ///
    /// _Requires permission: `workflows:read`._
    ///
    /// GET /api/org/{orgId}/workflows/{id}/typings
    ///
    /// Raises on 403: Forbidden
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

    /// Update a workflow
    ///
    /// An omitted field keeps its stored value. Changing the source, trigger or
    /// assigned secrets makes automated runs act with the caller's permissions
    /// from then on; when the workflow has secrets assigned, any edit also needs
    /// `secrets:read`.
    ///
    /// _Requires permission: `workflows:write`._
    ///
    /// PUT /api/org/{orgId}/workflows/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
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
        body: WorkflowInput,
        options: RequestOptions? = nil
    ) async throws -> Workflow {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/workflows/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
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
    /// _Requires permission: `workflows:write`._
    ///
    /// DELETE /api/org/{orgId}/workflows/{id}/schedule
    ///
    /// Raises on 400: Bad request
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
    /// _Requires permission: `workflows:read`._
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
    /// fires at the schedule's next occurrence; never immediately on save.
    ///
    /// Changing the schedule makes scheduled runs act with the permissions of the
    /// caller from then on, the same as editing the workflow's code. When the
    /// workflow has secrets assigned, the caller also needs `secrets:read`.
    ///
    /// _Requires permission: `workflows:write`._
    ///
    /// PUT /api/org/{orgId}/workflows/{id}/schedule
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
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
    /// Raises on 403: Forbidden
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
