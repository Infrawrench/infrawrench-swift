/*
 * InfrawrenchSDK v0.32.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.32.0).
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
    /// `client.costs.anomalySettings`
    public let anomalySettings: CostsAnomalySettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.anomalySettings = CostsAnomalySettingsNamespace(transport: transport)
    }

    /// List recently detected cost anomalies
    ///
    /// Spend anomalies detected by the daily background pass. Two kinds share the
    /// list: a `spike`, where a provider's or service's spend exceeded its
    /// trailing 28-day baseline by a statistical threshold (mean + N·stddev, with
    /// an absolute floor to ignore penny-scale noise), and a `new_source`, where
    /// a provider or service with no spend at all across that window suddenly
    /// billed a material amount. Thresholds are per organization — see GET
    /// /costs/anomaly-settings. Newest day first, capped at 200 rows.
    ///
    /// _Requires permission: `costs:read`._
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

    /// Spend grouped by cost centre (showback)
    ///
    /// Runs the org's allocation rules over collected spend and sums per cost
    /// centre and currency. Spend no rule claims comes back as the "Unallocated"
    /// bucket; every defined centre appears even with zero spend.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/showback
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: Defaults to 30 days ago.
    ///
    /// - Parameter to: Defaults to today.
    public func showback(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ShowbackReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/showback",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to)]
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

    /// Untagged spend over the required tag keys
    ///
    /// Spend on cost rows missing at least one of the org's required tag keys,
    /// overall and per key, plus the largest untagged (account, service) buckets.
    /// Empty when no tag policy is configured — untagged is only meaningful
    /// against a policy.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/untagged
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: Defaults to 30 days ago.
    ///
    /// - Parameter to: Defaults to today.
    public func untagged(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> UntaggedSpendReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/untagged",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to)]
            ),
            options: options
        )
    }
}

/// `client.costs.anomalySettings`
public final class CostsAnomalySettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the organization's anomaly detection thresholds
    ///
    /// The tunable part of cost anomaly detection. Everything else about the
    /// model — the 28-day baseline, the 7-day notification cooldown, the minimum
    /// history a baseline needs — is fixed. An organization that has never
    /// changed a threshold reads back the defaults. The response also carries the
    /// derived, read-only `smsConfigured`.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/anomaly-settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostAnomalySettingsView {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/anomaly-settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the organization's anomaly detection thresholds
    ///
    /// Takes effect on the next detection pass (which runs after each cost
    /// collection). Anomalies already stored are not re-judged. All four fields
    /// are required — this is a PUT of the whole settings object, not a patch —
    /// and `smsAlerts` deliberately has no server-side default, so a client that
    /// omits it is rejected rather than silently switching an organization's SMS
    /// paging back off. `smsConfigured` is derived and is not accepted here.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/costs/anomaly-settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: CostAnomalySettings,
        options: RequestOptions? = nil
    ) async throws -> CostAnomalySettingsView {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/costs/anomaly-settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
