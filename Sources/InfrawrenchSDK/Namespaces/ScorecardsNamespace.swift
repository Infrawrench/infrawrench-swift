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

/// `client.scorecards`
public final class ScorecardsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.scorecards.get`
    public let get: ScorecardsGetNamespace
    /// `client.scorecards.org`
    public let org: ScorecardsOrgNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.get = ScorecardsGetNamespace(transport: transport)
        self.org = ScorecardsOrgNamespace(transport: transport)
    }

    /// Create a scorecard
    ///
    /// Omitted checks and levels default to every built-in check and
    /// bronze/silver/gold. Out-of-range inputs are rejected. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/scorecards
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: ScorecardCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> Scorecard {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/scorecards",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a scorecard
    ///
    /// Its results and history go with it. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/scorecards/{scorecardId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        scorecardId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/scorecards/{scorecardId}",
                pathParameters: ["orgId": orgId?.parameterValue, "scorecardId": scorecardId.parameterValue]
            ),
            options: options
        )
    }

    /// Score every service on a scorecard now
    ///
    /// Level drops found here are stored but not announced: the caller just
    /// changed the bar.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/scorecards/{scorecardId}/evaluate
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func evaluate(
        orgId: String? = nil,
        scorecardId: String,
        options: RequestOptions? = nil
    ) async throws -> ScorecardOverview {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/scorecards/{scorecardId}/evaluate",
                pathParameters: ["orgId": orgId?.parameterValue, "scorecardId": scorecardId.parameterValue]
            ),
            options: options
        )
    }

    /// Read the scorecard matrix
    ///
    /// Every service, every scorecard and the current result for each applicable
    /// pair.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/scorecards/overview
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func overview(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ScorecardOverview {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/scorecards/overview",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a scorecard
    ///
    /// Omitted fields keep their value; `checks` and `levels` replace the stored
    /// lists. Services are re-scored within one poller tick. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PATCH /api/org/{orgId}/scorecards/{scorecardId}
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
        scorecardId: String,
        body: ScorecardUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> Scorecard {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/scorecards/{scorecardId}",
                pathParameters: ["orgId": orgId?.parameterValue, "scorecardId": scorecardId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.scorecards.get`
public final class ScorecardsGetNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List scorecards
    ///
    /// Seeds the default scorecard for organizations that have never had one
    /// (once; a deleted default is not recreated).
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/scorecards
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ScorecardList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/scorecards",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Read a scorecard
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/scorecards/{scorecardId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdScorecardsScorecardId(
        orgId: String? = nil,
        scorecardId: String,
        options: RequestOptions? = nil
    ) async throws -> Scorecard {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/scorecards/{scorecardId}",
                pathParameters: ["orgId": orgId?.parameterValue, "scorecardId": scorecardId.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.scorecards.org`
public final class ScorecardsOrgNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Grade the organization
    ///
    /// The org grade shown above the scorecard matrix: one weighted reading over
    /// seven feeds the product already computes (security posture, backup
    /// coverage, the service scorecard results, declared deadlines, the
    /// cross-cloud access review, quota headroom and resource ownership). Nothing
    /// is re-derived.
    ///
    /// An unassessed pillar is excluded, never scored zero, and weights
    /// renormalize over what was assessed. The trend comes from a daily snapshot
    /// the poller records; days when nothing could be graded are absent rather
    /// than zero. Does not seed the default scorecard.
    ///
    /// GET /api/org/{orgId}/scorecards/org
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> OrgScorecard {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/scorecards/org",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List stored org grade readings
    ///
    /// The daily history alone, without computing the grade: the cheap read for a
    /// sparkline.
    ///
    /// GET /api/org/{orgId}/scorecards/org/history
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter days: How far back to read. Defaults to 90; readings are kept
    /// for 400 days.
    public func history(
        orgId: String? = nil,
        days: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> OrgScorecardHistory {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/scorecards/org/history",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("days", days)]
            ),
            options: options
        )
    }
}
