/*
 * InfrawrenchSDK v0.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostsAnomaliesResult: Codable, Hashable, Sendable {
    public var anomalies: [CostAnomaly]

    public init(
        anomalies: [CostAnomaly]
    ) {
        self.anomalies = anomalies
    }
}

public struct CostsStatusResult: Codable, Hashable, Sendable {
    public var accounts: [CostAccountStatus]

    public init(
        accounts: [CostAccountStatus]
    ) {
        self.accounts = accounts
    }
}

/// `client.costs`
public final class CostsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List recently detected cost anomalies
    ///
    /// Spend anomalies detected by the daily background pass: days where a
    /// provider's or service's spend exceeded its trailing 28-day baseline by a
    /// statistical threshold (mean + N·stddev, with an absolute floor to ignore
    /// penny-scale noise). Newest day first, capped at 200 rows.
    ///
    /// GET /api/org/{orgId}/costs/anomalies
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter days: Window in days over anomalous days, 1-90. Defaults to
    /// 30.
    public func anomalies(
        orgId: String? = nil,
        days: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostsAnomaliesResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/anomalies",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("days", days)]
            ),
            options: options
        )
    }

    /// List distinct values for a cost dimension
    ///
    /// Feeds the filter and group-by pickers. Pass dimension=tag-keys for tag
    /// keys; dimension=tag requires tagKey.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/dimensions
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter dimension: One of `provider`, `account`, `service`, `region`,
    /// `resource`, `tag`, `tag-keys`.
    public func dimensions(
        orgId: String? = nil,
        dimension: String,
        tagKey: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostDimensionValues {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/dimensions",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("dimension", dimension), QueryParameter("tagKey", tagKey)]
            ),
            options: options
        )
    }

    /// Query aggregated cost series
    ///
    /// Aggregates collected provider spend into per-bucket, per-group series for
    /// cost graphs. Currencies are never merged; mixed-currency orgs get one
    /// series per currency. Optionally returns a previous-period comparison and a
    /// trend forecast.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/costs/query
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func query(
        orgId: String? = nil,
        body: CostQueryRequest,
        options: RequestOptions? = nil
    ) async throws -> CostQueryResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/costs/query",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Push cost rows from your own systems
    ///
    /// Reports spend Infrawrench has no provider plugin for — a parsed SaaS
    /// invoice, an internal chargeback, a colo bill — into the same store the
    /// provider collectors write to, so it appears in cost graphs, dimension
    /// filters, and budgets alongside everything else.
    ///
    /// Rows are grouped under a caller-chosen `source`. Writes are idempotent per
    /// `(source, day, service, region, resourceId, tags, currency)`: pushing the
    /// same day again restates that day rather than adding to it, so a nightly
    /// job can safely re-push a trailing window. Rows pushed under a source can
    /// never overwrite rows a provider collector wrote.
    ///
    /// The whole batch is validated before anything is stored, so a 400 means
    /// nothing was written.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/costs/rows
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func rows(
        orgId: String? = nil,
        body: CostPushRequest,
        options: RequestOptions? = nil
    ) async throws -> CostPushResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/costs/rows",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Per-account cost collection status
    ///
    /// Which accounts support cost collection, whether their history backfill has
    /// completed, and the ingested date coverage.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/status
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func status(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostsStatusResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/status",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
