/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.accessReview`
public final class AccessReviewNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.accessReview.dismissals`
    public let dismissals: AccessReviewDismissalsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.dismissals = AccessReviewDismissalsNamespace(transport: transport)
    }

    /// Export the access review as compliance evidence
    ///
    /// The same review as a downloadable file, one row per finding. `format=csv`
    /// (the default) returns RFC 4180 CSV with every cell quoted and spreadsheet
    /// formulas neutralised; `format=json` returns the full response body
    /// pretty-printed.
    ///
    /// Dismissed findings are included and labelled in both formats, with the
    /// note and the person who accepted them: an evidence pack answers what you
    /// found *and* what you decided. Exports are recorded in the audit log.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/access-review/export
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter format: Defaults to "csv". One of `csv`, `json`.
    ///
    /// - Parameter staleDays: Staleness window in days. Defaults to 90.
    public func export(
        orgId: String? = nil,
        format: String? = nil,
        staleDays: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> AccessReviewResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/access-review/export",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("format", format), QueryParameter("staleDays", staleDays)]
            ),
            options: options
        )
    }

    /// Review the principals inside your connected clouds
    ///
    /// Every IAM user and role, service account, app registration, group, role
    /// binding and long-lived API key your connected accounts have synced, with
    /// the findings that have evidence against them: unused beyond the staleness
    /// window, holding administrative or wildcard permissions, past the rotation
    /// budget their plugin declares, carrying no recorded owner, or signing in
    /// without a second factor.
    ///
    /// This is about principals in **your** clouds — it is neither your
    /// Infrawrench team's roles (`/team`) nor the credentials Infrawrench stores
    /// for you (`/credential-hygiene`).
    ///
    /// No provider API calls are made: everything is computed from already-synced
    /// fields, so a principal whose provider does not report last use is reported
    /// with `activity: "unknown"` and is never called stale. Findings the
    /// organization has dismissed are reported separately under `dismissed` and
    /// are excluded from `findings`, `counts`, `byRule` and the security alerts.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/access-review
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter staleDays: Staleness window in days. Defaults to 90.
    public func get(
        orgId: String? = nil,
        staleDays: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> AccessReviewResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/access-review",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("staleDays", staleDays)]
            ),
            options: options
        )
    }
}

/// `client.accessReview.dismissals`
public final class AccessReviewDismissalsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Dismiss an access review finding
    ///
    /// Accept a finding — that break-glass role really is meant to be admin, that
    /// shared key really is rotated out of band. The finding leaves `findings`
    /// and stops feeding the security alerts, but the rule keeps being evaluated
    /// and the finding is reported back under `dismissed` for as long as it still
    /// matches. The principal itself stays in `principals` either way.
    /// Idempotent: dismissing an already-dismissed finding rewrites the note and
    /// the author.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/access-review/dismissals
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: AccessReviewDismissalCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> AccessReviewDismissal {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/access-review/dismissals",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Restore a dismissed access review finding
    ///
    /// Undo a dismissal, putting the finding back on the list and back into the
    /// security alerts. The finding is identified by query parameters rather than
    /// path segments because resource ids are provider-native and routinely
    /// contain slashes.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/access-review/dismissals
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter resourceId: Infrawrench resource id the finding is on.
    ///
    /// - Parameter ruleId: Which rule was raised. Half of a dismissal's key,
    /// alongside the resource id. The `access-review:` prefix is reserved so
    /// these can share the posture dismissal store without colliding with
    /// plugin-declared posture rule ids. One of `access-review:stale-principal`,
    /// `access-review:admin-principal`, `access-review:key-past-rotation`,
    /// `access-review:no-recorded-owner`, `access-review:no-mfa`.
    public func delete(
        orgId: String? = nil,
        resourceId: String,
        ruleId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/access-review/dismissals",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId), QueryParameter("ruleId", ruleId)]
            ),
            options: options
        )
    }
}
