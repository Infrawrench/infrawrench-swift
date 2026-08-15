/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
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
    /// `client.changes.revert`
    public let revert: ChangesRevertNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.alertSettings = ChangesAlertSettingsNamespace(transport: transport)
        self.revert = ChangesRevertNamespace(transport: transport)
    }

    /// Cost impact of a page of changes
    ///
    /// For each change, compares the resource's per-day spend over the window
    /// before it against the window after, and reports the difference as a
    /// run-rate delta.
    ///
    /// A POST because it takes a list of ids, not because it writes: nothing is
    /// stored. The answer is recomputed on every call, deliberately — provider
    /// cost arrives late and is then restated, so a stored number would be a
    /// wrong number that never corrects itself.
    ///
    /// Both windows exclude the change's own day (spend on it is half old shape,
    /// half new) and today (an accruing day always reads as a dip), and are
    /// clamped symmetrically to the days cost collection actually covers.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/changes/cost-impacts
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func costImpacts(
        orgId: String? = nil,
        body: ChangeCostImpactsRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> ChangeCostImpactsResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/changes/cost-impacts",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
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

/// `client.changes.revert`
public final class ChangesRevertNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Revert one change event
    ///
    /// Applies the inverse patch through the plugin's ordinary `updateResource`
    /// path — the same call the Edit form makes — and only for the fields the dry
    /// run marked `revertible`.
    ///
    /// The plan is rebuilt against a fresh live read immediately before the
    /// write, so a field that moved between the preview and the apply becomes a
    /// conflict and drops out of the patch.
    ///
    /// **This is a last-moment re-read, not an atomic compare-and-swap.** The gap
    /// between reading a field and writing it is one provider round-trip wide,
    /// and a third party writing inside that gap will be overwritten without
    /// warning. It cannot be closed generically: the plugin update contract
    /// carries no expected value, ETag or version token, so no conditional write
    /// can be expressed for a provider that supports one. Treat the conflict
    /// detection as a strong guard against stale plans, not as a mutual-exclusion
    /// guarantee against other writers.
    ///
    /// Reverts of the *same event* are mutually exclusive: the event is claimed
    /// with a conditional update under a five-minute lease, so two concurrent
    /// reverts cannot both reach the provider and the loser gets `409`. A
    /// provider failure releases the claim immediately; a process that dies
    /// mid-write leaves a claim that expires, so an interrupted revert is
    /// retryable rather than permanently stuck. `revertedAt` is only set once the
    /// provider accepted the write.
    ///
    /// The claim carries an owner token, and every write that ends a revert is
    /// fenced on it. An attempt whose provider call outlives the lease can
    /// therefore neither release nor complete the claim that replaced it — it
    /// gets `409` with `appliedFields` naming what it did write, so the caller
    /// can reconcile rather than assume. Two attempts can overlap in that case,
    /// but they cannot disagree: both invert the same recorded event to the same
    /// values, so the second one's patch is a subset of the first's.
    ///
    /// If a write reaches the provider but recording it fails, the response is
    /// `500` with `appliedFields` — the resource moved and the timeline has not
    /// caught up. The claim is deliberately held in that case, and the next
    /// attempt after the lease expires finds every field already back and records
    /// the revert without touching the provider again, answering `200` with
    /// `reconciled: true` and an empty `appliedFields`. A resource put back by
    /// hand is not mistaken for this: reconciliation only happens on an event
    /// whose claim was still outstanding, which is the only state in which an
    /// unrecorded write is possible.
    ///
    /// Blocked with `423` while an org change freeze is in effect. Every attempt
    /// whose write reached the provider is audit-logged as
    /// `resource.change_revert`, including one that lost its claim or could not
    /// record — the entry's `outcome` is `recorded`, `superseded`, `unrecorded`
    /// or `reconciled`, so a contested outcome reads as one mutation rather than
    /// as several reverts. An attempt that neither wrote nor recorded anything
    /// logs nothing. Attribution is best-effort: no transaction spans a
    /// third-party cloud API and Infrawrench's database, so if the audit insert
    /// itself fails the response carries `auditRecorded: false` and the details
    /// go to the server log rather than being silently dropped.
    ///
    /// The stored resource snapshot is deliberately left untouched, so the next
    /// poll observes the reverted state and records it as an ordinary change
    /// event.
    ///
    /// POST /api/org/{orgId}/changes/{changeId}/revert
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Already reverted, another revert holds the event, nothing
    /// in the plan is writable, or this attempt was superseded mid-write (its
    /// lease lapsed). The body carries `code: change_revert_conflict` for all but
    /// the writability case, and `appliedFields` when the provider write had
    /// already landed.
    ///
    /// Raises on 423: Blocked by an active change freeze. Retry with the
    /// `x-change-freeze-override: true` header if you hold `freezes:override`;
    /// both blocks and overrides are audit-logged.
    ///
    /// Raises on 500: The provider accepted the write but it could not be
    /// recorded against the event. The resource *has* been put back;
    /// `appliedFields` names what changed. A later retry reconciles the timeline.
    ///
    /// Raises on 502: The provider couldn't be read. Nothing was written.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        changeId: String,
        options: RequestOptions? = nil
    ) async throws -> RevertApplyResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/changes/{changeId}/revert",
                pathParameters: ["orgId": orgId?.parameterValue, "changeId": changeId.parameterValue]
            ),
            options: options
        )
    }

    /// Dry-run a revert of one change event
    ///
    /// Inverts the recorded diff and reconciles it against the resource's
    /// *current* live fields, which is the whole point: the poller may have
    /// recorded this hours ago and the world may have moved on. Read-only — it
    /// reads from the provider and writes nothing.
    ///
    /// Only `updated` events with a field diff can be reverted. `outputs.*`
    /// entries are provider-derived and are never written back, and whether a
    /// field is writable at all is the plugin's own edit-form rule (`editable`,
    /// minus `secret` and `association` kinds), so a revert can never issue a
    /// provider call an edit could not.
    ///
    /// Gated on `resources:write` rather than `resources:read`: the plan names
    /// the write it is offering to make.
    ///
    /// GET /api/org/{orgId}/changes/{changeId}/revert
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 502: The provider couldn't be read, so no plan can be made
    /// safely. Nothing was written.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        changeId: String,
        options: RequestOptions? = nil
    ) async throws -> RevertPreviewResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/changes/{changeId}/revert",
                pathParameters: ["orgId": orgId?.parameterValue, "changeId": changeId.parameterValue]
            ),
            options: options
        )
    }
}
