/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.runbooks`
public final class RunbooksNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.runbooks.get`
    public let get: RunbooksGetNamespace
    /// `client.runbooks.runs`
    public let runs: RunbooksRunsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.get = RunbooksGetNamespace(transport: transport)
        self.runs = RunbooksRunsNamespace(transport: transport)
    }

    /// Write a runbook
    ///
    /// Editing takes `org:settings:write` — a procedure is an org-wide statement
    /// about how something is done, and it is read by strangers under pressure.
    /// Names are unique within an organization: two runbooks called "Failover" is
    /// how the wrong one gets run.
    ///
    /// POST /api/org/{orgId}/runbooks
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: RunbookCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> Runbook {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/runbooks",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a runbook
    ///
    /// Takes its run history with it. To retire a procedure without losing the
    /// record of the runs performed against it, set `enabled` to false instead.
    ///
    /// DELETE /api/org/{orgId}/runbooks/{runbookId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        runbookId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/runbooks/{runbookId}",
                pathParameters: ["orgId": orgId?.parameterValue, "runbookId": runbookId.parameterValue]
            ),
            options: options
        )
    }

    /// Edit a runbook
    ///
    /// Omitted fields are left alone. The result is validated **after** merging,
    /// so a patch that only changes the steps still has to produce a runbook that
    /// is valid as a whole. A step sent with its `id` keeps its identity, so a
    /// run in progress still matches it.
    ///
    /// PATCH /api/org/{orgId}/runbooks/{runbookId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        runbookId: String,
        body: RunbookUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> Runbook {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/runbooks/{runbookId}",
                pathParameters: ["orgId": orgId?.parameterValue, "runbookId": runbookId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.runbooks.get`
public final class RunbooksGetNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List the organization's runbooks
    ///
    /// Every runbook, with how many times each has been run and when it was last
    /// used. Reading takes `resources:read`: the person who can see the
    /// infrastructure is the person who will be woken up about it.
    ///
    /// GET /api/org/{orgId}/runbooks
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> RunbookList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/runbooks",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get one runbook
    ///
    /// GET /api/org/{orgId}/runbooks/{runbookId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdRunbooksRunbookId(
        orgId: String? = nil,
        runbookId: String,
        options: RequestOptions? = nil
    ) async throws -> Runbook {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/runbooks/{runbookId}",
                pathParameters: ["orgId": orgId?.parameterValue, "runbookId": runbookId.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.runbooks.runs`
public final class RunbooksRunsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.runbooks.runs.steps`
    public let steps: RunbooksRunsStepsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.steps = RunbooksRunsStepsNamespace(transport: transport)
    }

    /// Close a run out
    ///
    /// Closing does **not** settle outstanding steps. A run completed with three
    /// steps still pending is a true and useful record — it says the incident
    /// ended before the checklist did — and quietly marking them done would erase
    /// the one thing a postmortem wants to know.
    ///
    /// POST /api/org/{orgId}/runbooks/runs/{runId}/close
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func close(
        orgId: String? = nil,
        runId: String,
        body: RunbookRunClose? = nil,
        options: RequestOptions? = nil
    ) async throws -> RunbookRun {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/runbooks/runs/{runId}/close",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Start performing a runbook
    ///
    /// Copies every step's title and kind into the run, so the record of what
    /// somebody was asked to do survives the runbook being rewritten next week.
    ///
    /// Takes `resources:read`, like ticking a step: performing a checklist is not
    /// an act of configuration, and requiring an admin mid-incident is how a team
    /// stops using it. Deliberately not deduplicated against a run already in
    /// progress — performing the failover twice in one incident is a real thing,
    /// and refusing the second would mean it goes unrecorded rather than not
    /// happening.
    ///
    /// POST /api/org/{orgId}/runbooks/{runbookId}/runs
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        runbookId: String,
        body: RunbookRunStart? = nil,
        options: RequestOptions? = nil
    ) async throws -> RunbookRun {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/runbooks/{runbookId}/runs",
                pathParameters: ["orgId": orgId?.parameterValue, "runbookId": runbookId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// List runbook runs
    ///
    /// Newest first, optionally narrowed to one runbook or one incident.
    ///
    /// GET /api/org/{orgId}/runbooks/runs
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        runbookId: String? = nil,
        incidentId: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> RunbookRunList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/runbooks/runs",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("runbookId", runbookId), QueryParameter("incidentId", incidentId), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }

    /// Get one runbook run
    ///
    /// GET /api/org/{orgId}/runbooks/runs/{runId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdRunbooksRunsRunId(
        orgId: String? = nil,
        runId: String,
        options: RequestOptions? = nil
    ) async throws -> RunbookRun {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/runbooks/runs/{runId}",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.runbooks.runs.steps`
public final class RunbooksRunsStepsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Tick a step
    ///
    /// One targeted update on one row, so two responders working the same
    /// incident can tick different steps at the same moment without either losing
    /// the other's work.
    ///
    /// A closed run refuses updates, and reopening is not offered: a run is a
    /// record of what happened. Start another run to record another attempt.
    ///
    /// PATCH /api/org/{orgId}/runbooks/runs/{runId}/steps/{stepId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        runId: String,
        stepId: String,
        body: RunbookStepUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> RunbookRun {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/runbooks/runs/{runId}/steps/{stepId}",
                pathParameters: ["orgId": orgId?.parameterValue, "runId": runId.parameterValue, "stepId": stepId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
