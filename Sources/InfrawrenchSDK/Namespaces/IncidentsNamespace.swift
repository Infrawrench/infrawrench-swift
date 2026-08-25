/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.incidents`
public final class IncidentsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.incidents.get`
    public let get: IncidentsGetNamespace
    /// `client.incidents.notes`
    public let notes: IncidentsNotesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.get = IncidentsGetNamespace(transport: transport)
        self.notes = IncidentsNotesNamespace(transport: transport)
    }

    /// Declare an incident
    ///
    /// Record the incident and perform the opted-in side effects. The incident
    /// row is written first and alone: a 201 means it exists, and the `artifacts`
    /// array on the response says what else happened. No side effect can lose the
    /// declaration, and none is swallowed. Audit-logged.
    ///
    /// _Requires permission: `incidents:write`._
    ///
    /// POST /api/org/{orgId}/incidents
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: IncidentDeclare? = nil,
        options: RequestOptions? = nil
    ) async throws -> Incident {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/incidents",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete an incident
    ///
    /// Removes the incident, its notes and its artefact records. It does not lift
    /// a freeze or close a status-page update — resolve for that; deleting is for
    /// a mis-declaration. Audit-logged.
    ///
    /// _Requires permission: `incidents:write`._
    ///
    /// DELETE /api/org/{orgId}/incidents/{incidentId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        incidentId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/incidents/{incidentId}",
                pathParameters: ["orgId": orgId?.parameterValue, "incidentId": incidentId.parameterValue]
            ),
            options: options
        )
    }

    /// Export a pre-filled postmortem
    ///
    /// Markdown with the timeline, the affected resources, the duration, the time
    /// to mitigate and the notes already filled in. The analysis headings —
    /// impact, root cause, action items — are deliberately left blank: a
    /// generated document that guesses at a root cause is worse than one that
    /// leaves a heading.
    ///
    /// _Requires permission: `incidents:read`._
    ///
    /// GET /api/org/{orgId}/incidents/{incidentId}/postmortem
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func postmortem(
        orgId: String? = nil,
        incidentId: String,
        options: RequestOptions? = nil
    ) async throws -> IncidentPostmortem {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/incidents/{incidentId}/postmortem",
                pathParameters: ["orgId": orgId?.parameterValue, "incidentId": incidentId.parameterValue]
            ),
            options: options
        )
    }

    /// Retry the artefacts that failed
    ///
    /// Re-runs only the side effects whose artefact is in a failure state,
    /// replacing each failure rather than queueing a second attempt beside it. A
    /// `failed` artefact is **re-created**; a `close_failed` one is **re-closed**
    /// — re-creating the latter would open a second change freeze or post a
    /// duplicate public notice. A status-page retry reuses the components
    /// recorded on the artefact's `request`, so the announcement keeps its
    /// original scope. Its own endpoint rather than a flag on PATCH, because it
    /// writes into three external systems. Audit-logged.
    ///
    /// _Requires permission: `incidents:write`._
    ///
    /// POST /api/org/{orgId}/incidents/{incidentId}/retry-artifacts
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func retryArtifacts(
        orgId: String? = nil,
        incidentId: String,
        options: RequestOptions? = nil
    ) async throws -> Incident {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/incidents/{incidentId}/retry-artifacts",
                pathParameters: ["orgId": orgId?.parameterValue, "incidentId": incidentId.parameterValue]
            ),
            options: options
        )
    }

    /// Assemble the incident's timeline
    ///
    /// Merged on read from what is already recorded between the incident's start
    /// and its resolution: resource changes, deployments, cost anomalies,
    /// provider status incidents, audit entries, change freezes and workflow runs
    /// (all via the same union the Moment screen uses), plus probe state
    /// transitions, metric-alert firings, the incident's own life events, its
    /// artefacts and its operator notes. Nothing is copied — a correction
    /// upstream shows up here on the next read.
    ///
    /// Probe transitions are an approximation: `synthetic_probes` keeps only a
    /// single `lastStateChangeAt`, so a probe that flapped twice inside the
    /// window contributes its most recent flip and no more.
    ///
    /// _Requires permission: `incidents:read`._
    ///
    /// GET /api/org/{orgId}/incidents/{incidentId}/timeline
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func timeline(
        orgId: String? = nil,
        incidentId: String,
        options: RequestOptions? = nil
    ) async throws -> IncidentTimeline {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/incidents/{incidentId}/timeline",
                pathParameters: ["orgId": orgId?.parameterValue, "incidentId": incidentId.parameterValue]
            ),
            options: options
        )
    }

    /// Edit or transition an incident
    ///
    /// Omitted fields keep their value. Setting `status` stamps the matching
    /// timestamp, and resolving undoes exactly what this incident created — the
    /// freeze whose id is on its own artefact, not whatever freeze happens to be
    /// in effect. Resolving an incident that was never marked mitigated
    /// back-fills `mitigatedAt` from `resolvedAt`. Audit-logged.
    ///
    /// _Requires permission: `incidents:write`._
    ///
    /// PATCH /api/org/{orgId}/incidents/{incidentId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        incidentId: String,
        body: IncidentPatch? = nil,
        options: RequestOptions? = nil
    ) async throws -> Incident {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/incidents/{incidentId}",
                pathParameters: ["orgId": orgId?.parameterValue, "incidentId": incidentId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.incidents.get`
public final class IncidentsGetNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List declared incidents
    ///
    /// Every incident the organization has declared, newest first, each with the
    /// artefacts its declaration created — including the ones that failed.
    ///
    /// _Requires permission: `incidents:read`._
    ///
    /// GET /api/org/{orgId}/incidents
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter status: `open`, `mitigated`, `resolved`, or `all` (the
    /// default).
    public func get(
        orgId: String? = nil,
        status: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> IncidentList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/incidents",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("status", status)]
            ),
            options: options
        )
    }

    /// Read one incident
    ///
    /// The incident with its artefacts and its operator notes.
    ///
    /// _Requires permission: `incidents:read`._
    ///
    /// GET /api/org/{orgId}/incidents/{incidentId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdIncidentsIncidentId(
        orgId: String? = nil,
        incidentId: String,
        options: RequestOptions? = nil
    ) async throws -> IncidentDetail {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/incidents/{incidentId}",
                pathParameters: ["orgId": orgId?.parameterValue, "incidentId": incidentId.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.incidents.notes`
public final class IncidentsNotesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Add an operator note
    ///
    /// The running commentary no join can reconstruct. `occurredAt` may be
    /// backdated so a note typed at 04:00 lands on the timeline where it belongs.
    ///
    /// _Requires permission: `incidents:write`._
    ///
    /// POST /api/org/{orgId}/incidents/{incidentId}/notes
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        incidentId: String,
        body: IncidentNoteCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> IncidentNote {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/incidents/{incidentId}/notes",
                pathParameters: ["orgId": orgId?.parameterValue, "incidentId": incidentId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete an operator note
    ///
    /// _Requires permission: `incidents:write`._
    ///
    /// DELETE /api/org/{orgId}/incidents/{incidentId}/notes/{noteId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        incidentId: String,
        noteId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/incidents/{incidentId}/notes/{noteId}",
                pathParameters: ["orgId": orgId?.parameterValue, "incidentId": incidentId.parameterValue, "noteId": noteId.parameterValue]
            ),
            options: options
        )
    }
}
