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

public struct SavingsFindingsStatusResult: Codable, Hashable, Sendable {
    public var updated: [SavingsFindingStatusChange]
    public var missing: [String]

    public init(
        updated: [SavingsFindingStatusChange],
        missing: [String]
    ) {
        self.updated = updated
        self.missing = missing
    }
}

/// `client.savings`
public final class SavingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.savings.events`
    public let events: SavingsEventsNamespace
    /// `client.savings.findings`
    public let findings: SavingsFindingsNamespace
    /// `client.savings.settings`
    public let settings: SavingsSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.events = SavingsEventsNamespace(transport: transport)
        self.findings = SavingsFindingsNamespace(transport: transport)
        self.settings = SavingsSettingsNamespace(transport: transport)
    }

    /// Realized savings report
    ///
    /// What the actions taken actually saved, against each resource's own
    /// trailing daily spend before the action, accrued day by day (one-off
    /// actions up to the horizon). Recomputed on every read, so figures improve
    /// as restated billing lands. Days collection has not covered are not
    /// accrued. Per-currency throughout; never converted or merged.
    ///
    /// GET /api/org/{orgId}/savings/realized
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: Inclusive first day. Defaults to the first of the month
    /// 11 months back.
    ///
    /// - Parameter to: Inclusive last day. Defaults to yesterday.
    public func realized(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> RealizedSavingsReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/savings/realized",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to)]
            ),
            options: options
        )
    }
}

/// `client.savings.events`
public final class SavingsEventsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.savings.events.update`
    public let update: SavingsEventsUpdateNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.update = SavingsEventsUpdateNamespace(transport: transport)
    }

    /// Log a saving
    ///
    /// Record a saving by hand, with the monthly amount and the day it began.
    /// Leaves an org-wide cost annotation on that day. Requires `costs:write`.
    ///
    /// POST /api/org/{orgId}/savings/events
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: SavingsEventInput,
        options: RequestOptions? = nil
    ) async throws -> SavingsEvent {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/savings/events",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Remove a saving
    ///
    /// Hard delete, together with the cost annotation the event left on the
    /// charts.
    ///
    /// DELETE /api/org/{orgId}/savings/events/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/savings/events/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.savings.events.update`
public final class SavingsEventsUpdateNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Annotate a saving
    ///
    /// Add context to any event: a note, an explicit cost centre, a horizon
    /// override, or an end date. The facts of an automatic event (what was done,
    /// when, the projection) stay as observed.
    ///
    /// PATCH /api/org/{orgId}/savings/events/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func patchOrgOrgIdSavingsEventsId(
        orgId: String? = nil,
        id: String,
        body: SavingsEventAnnotation,
        options: RequestOptions? = nil
    ) async throws -> SavingsEvent {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/savings/events/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Rewrite a manual saving
    ///
    /// Full replace of a manual entry. Automatic events are a 400; use PATCH.
    ///
    /// PUT /api/org/{orgId}/savings/events/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: SavingsEventInput,
        options: RequestOptions? = nil
    ) async throws -> SavingsEvent {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/savings/events/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.savings.findings`
public final class SavingsFindingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List savings findings
    ///
    /// Every savings finder's findings (orphaned and idle resources, oversized
    /// resources, extended support surcharges, unused SaaS seats) with a
    /// lifecycle status, a detected date and summary tiles. Open findings that a
    /// scan stops reporting move to Completed automatically (`resolution:
    /// resolved`); a finding that returns after that reopens as Ready with a new
    /// detected date. A cost-scoped caller sees only findings on accounts granted
    /// to them outright.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/savings/findings
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter view: Apply a saved view, by id or name. Explicit params
    /// override it.
    ///
    /// - Parameter status: A status, `open` (Ready or In progress), or `all`.
    ///
    /// - Parameter kind: Comma-separated finding kinds.
    ///
    /// - Parameter provider: Comma-separated plugin ids.
    ///
    /// - Parameter account: Comma-separated account ids.
    ///
    /// - Parameter region: Comma-separated regions.
    ///
    /// - Parameter tag: `key` or `key=value`; repeat for more terms (all must
    /// match).
    ///
    /// - Parameter minSavings: Minimum monthly savings, in each finding's own
    /// currency. Unpriced findings never pass.
    ///
    /// - Parameter detectedFrom: Detected on or after (UTC day).
    ///
    /// - Parameter detectedTo: Detected on or before (UTC day).
    ///
    /// - Parameter q: Case-insensitive text match over title, resource and
    /// account.
    ///
    /// - Parameter sort: `<field>:<asc|desc>`; fields savings, detected, name,
    /// status_changed.
    ///
    /// - Parameter refresh: `true` bypasses the right-sizing and extended support
    /// caches.
    public func get(
        orgId: String? = nil,
        view: String? = nil,
        status: SavingsFindingStatusFilter? = nil,
        kind: String? = nil,
        provider: String? = nil,
        account: String? = nil,
        region: String? = nil,
        tag: String? = nil,
        minSavings: String? = nil,
        detectedFrom: String? = nil,
        detectedTo: String? = nil,
        q: String? = nil,
        sort: String? = nil,
        refresh: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SavingsFindingsResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/savings/findings",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("view", view), QueryParameter("status", status), QueryParameter("kind", kind), QueryParameter("provider", provider), QueryParameter("account", account), QueryParameter("region", region), QueryParameter("tag", tag), QueryParameter("minSavings", minSavings), QueryParameter("detectedFrom", detectedFrom), QueryParameter("detectedTo", detectedTo), QueryParameter("q", q), QueryParameter("sort", sort), QueryParameter("refresh", refresh)]
            ),
            options: options
        )
    }

    /// Change savings finding status
    ///
    /// Moves findings to a status, recording who, when and an optional note;
    /// Completed by hand records `resolution: manual`. Audited per finding and
    /// published as the `savings.finding.status_changed` event. Keys the caller
    /// cannot see come back in `missing`; a 404 when none matched.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/savings/findings/status
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func status(
        orgId: String? = nil,
        body: SavingsFindingStatusInput,
        options: RequestOptions? = nil
    ) async throws -> SavingsFindingsStatusResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/savings/findings/status",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.savings.settings`
public final class SavingsSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get realized savings settings
    ///
    /// The org's horizon, shortfall threshold and baseline window; defaults when
    /// never saved.
    ///
    /// GET /api/org/{orgId}/savings/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> RealizedSavingsSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/savings/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update realized savings settings
    ///
    /// Requires `costs:write`. Changes every figure in the report, retroactively.
    ///
    /// PUT /api/org/{orgId}/savings/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: RealizedSavingsSettings,
        options: RequestOptions? = nil
    ) async throws -> RealizedSavingsSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/savings/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
