/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostsEfficiencyAlertsResult: Codable, Hashable, Sendable {
    public var events: [EfficiencyAlertEvent]

    public init(
        events: [EfficiencyAlertEvent]
    ) {
        self.events = events
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

public struct CostsAnomaliesAcknowledgeBody: Codable, Hashable, Sendable {
    /// One sentence on what caused the spend. Becomes the annotation's text, so
    /// the annotation's 500-character ceiling applies.
    public var explanation: String

    public init(
        explanation: String
    ) {
        self.explanation = explanation
    }
}

public struct CostsAnomaliesGetResult: Codable, Hashable, Sendable {
    public var anomalies: [CostAnomaly]

    public init(
        anomalies: [CostAnomaly]
    ) {
        self.anomalies = anomalies
    }
}

public struct CostsAnomalySuppressionsGetResult: Codable, Hashable, Sendable {
    public var suppressions: [CostAnomalySuppression?]

    public init(
        suppressions: [CostAnomalySuppression?]
    ) {
        self.suppressions = suppressions
    }
}

/// `client.costs`
public final class CostsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.costs.anomalies`
    public let anomalies: CostsAnomaliesNamespace
    /// `client.costs.anomalySettings`
    public let anomalySettings: CostsAnomalySettingsNamespace
    /// `client.costs.anomalySuppressions`
    public let anomalySuppressions: CostsAnomalySuppressionsNamespace
    /// `client.costs.efficiencyAlertSettings`
    public let efficiencyAlertSettings: CostsEfficiencyAlertSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.anomalies = CostsAnomaliesNamespace(transport: transport)
        self.anomalySettings = CostsAnomalySettingsNamespace(transport: transport)
        self.anomalySuppressions = CostsAnomalySuppressionsNamespace(transport: transport)
        self.efficiencyAlertSettings = CostsEfficiencyAlertSettingsNamespace(transport: transport)
    }

    /// Anomaly detection precision over time
    ///
    /// Per month of the anomalous day: findings detected, suppressed, and marked
    /// expected or unexpected, and precision (the share of reviewed findings that
    /// were real problems).
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/anomaly-precision
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter months: Months to cover, 1-24. Defaults to 6.
    public func anomalyPrecision(
        orgId: String? = nil,
        months: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostAnomalyPrecisionReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/anomaly-precision",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("months", months)]
            ),
            options: options
        )
    }

    /// Per-key sensitivity learned from feedback
    ///
    /// Every provider or service with a verdict in the last 90 days, the σ its
    /// spikes are judged against, and one sentence saying why.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/anomaly-sensitivity
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func anomalySensitivity(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostAnomalySensitivity {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/anomaly-sensitivity",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List distinct values for a cost dimension
    ///
    /// Feeds the filter and group-by pickers. Pass dimension=tag-keys for tag
    /// keys, which follow the org's tag key settings (preferred keys first and
    /// flagged, hidden keys omitted unless includeHidden=true),
    /// dimension=virtual-tag-keys for the organization's virtual tag keys
    /// (labelled by name), or dimension=usage-units for the usage units providers
    /// report (a usage budget's unit); dimension=tag and dimension=virtual_tag
    /// require tagKey. `charge_type` answers from the fixed set of charge types
    /// rather than from the stored data, so the picker is populated before any
    /// provider has reported one. `usage-units` lists the usage units present in
    /// the cost data, most common first, for the `usage` measure's unit picker.
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
    /// `resource`, `tag`, `charge_type`, `commitment`, `virtual_tag`, `tag-keys`,
    /// `usage-units`, `virtual-tag-keys`.
    ///
    /// - Parameter includeHidden: dimension=tag-keys only: also list keys the org
    /// hides, flagged `hidden`. One of `true`, `false`.
    public func dimensions(
        orgId: String? = nil,
        dimension: String,
        tagKey: String? = nil,
        includeHidden: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostDimensionValues {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/dimensions",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("dimension", dimension), QueryParameter("tagKey", tagKey), QueryParameter("includeHidden", includeHidden)]
            ),
            options: options
        )
    }

    /// Recently fired efficiency alerts
    ///
    /// The three slow-lane cost alerts in one feed, newest first: commitments
    /// about to lapse, commitments that are not being used, and business metrics
    /// whose cost per unit rose. Unlike budgets, anomalies and change alerts —
    /// all of which compare a spend total against another spend total — these
    /// read the commitment calendar and the volume the spend bought, so they see
    /// the two surprises the other three structurally cannot.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/efficiency-alerts
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter kind: Restrict to one detector. Omitted returns all three,
    /// interleaved by time. One of `commitment_expiry`, `commitment_idle`,
    /// `unit_cost_regression`, `unit_cost_threshold`.
    ///
    /// - Parameter limit: Rows to return, newest first. Defaults to 50.
    public func efficiencyAlerts(
        orgId: String? = nil,
        kind: String? = nil,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostsEfficiencyAlertsResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/efficiency-alerts",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("kind", kind), QueryParameter("limit", limit)]
            ),
            options: options
        )
    }

    /// Download cost rows as a FOCUS 1.3 CSV
    ///
    /// The rows a cost query selects, written as a CSV in the FinOps Open Cost
    /// and Usage Specification (FOCUS) v1.3 layout: one row per account, service,
    /// region, resource, tag set, charge type and commitment per day, with
    /// `BilledCost` (cash) and `EffectiveCost` (amortized) side by side,
    /// `ChargeCategory`, `ServiceCategory`/`ServiceSubcategory`, `Tags` as a JSON
    /// object and the commitment columns where the provider reports a commitment.
    /// Custom columns follow, prefixed `x_`. The same mapping a `focus-1.3`
    /// scheduled export writes (see /cost-exports).
    ///
    /// Takes the cost query's filter in either spelling (`filters` or `query`,
    /// never both), an optional saved filter, and charge types. The range spans
    /// at most 366 days; for anything longer, or for a recurring feed, use a
    /// scheduled export. Validation errors are a 400 before any CSV is written;
    /// the body is then streamed.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/costs/focus-export
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func focusExport(
        orgId: String? = nil,
        body: FocusExportRequest,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/costs/focus-export",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
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
    /// `costBasis` chooses between cash and amortized money, and `chargeTypes`
    /// narrows which kinds of charge count. Both the comparison period and the
    /// forecast are computed on the same basis and charge types as the series
    /// itself.
    ///
    /// The filter can be sent structurally as `filters` or as text in the cost
    /// query language via `query` (`provider = 'aws' AND tag['env'] != 'dev'`).
    /// They are two spellings of one filter: sending both is a 400, and a query
    /// that does not parse is a 400 carrying the offset of the mistake.
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
    /// Cost centres nest, so the list is a depth-first tree. Each entry carries
    /// `totals` (spend allocated directly to it) and `subtreeTotals` (its own
    /// plus every descendant's) — "Engineering, of which Platform" needs both.
    /// Rules still evaluate first-match-wins by ascending priority against a flat
    /// list, so a row is allocated exactly once even when a rule targets a parent
    /// and another targets its child; at equal priority the more deeply nested
    /// centre wins.
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
    ///
    /// - Parameter basis: Which money to sum. `cash` (the default) is what the
    /// provider charged on the day it charged it; `amortized` spreads a
    /// commitment's up-front fee across the term it buys; `blended` also spreads
    /// each commitment's discount evenly over all the usage it could cover.
    /// Providers that report no amortized amount fall back to their cash amount.
    /// One of `cash`, `amortized`, `blended`.
    ///
    /// - Parameter adjusted: Apply the organization's billing rules (see
    /// /billing-rules): markups multiply, and a reallocation moves a centre's
    /// spend onto another centre. Off by default — a chargeback report that
    /// silently showed marked-up numbers is one the receiving team could not
    /// reconcile. On, the response carries `adjustment` with the collected totals
    /// beside the adjusted ones. Fixed-amount rules are booked onto the cost
    /// centre they name (or "Unallocated" when they name none), pro-rated across
    /// the period. One of `true`, `false`.
    public func showback(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        basis: String? = nil,
        adjusted: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ShowbackReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/showback",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to), QueryParameter("basis", basis), QueryParameter("adjusted", adjusted)]
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
    ///
    /// - Parameter basis: Which money to sum. `cash` (the default) is what the
    /// provider charged on the day it charged it; `amortized` spreads a
    /// commitment's up-front fee across the term it buys; `blended` also spreads
    /// each commitment's discount evenly over all the usage it could cover.
    /// Providers that report no amortized amount fall back to their cash amount.
    /// One of `cash`, `amortized`, `blended`.
    public func untagged(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        basis: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> UntaggedSpendReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/untagged",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to), QueryParameter("basis", basis)]
            ),
            options: options
        )
    }
}

/// `client.costs.anomalies`
public final class CostsAnomaliesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.costs.anomalies.feedback`
    public let feedback: CostsAnomaliesFeedbackNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.feedback = CostsAnomaliesFeedbackNamespace(transport: transport)
    }

    /// Explain a detected cost anomaly
    ///
    /// Record what a finding actually was, and publish that sentence as a cost
    /// annotation on **every** chart covering the anomalous day — the point being
    /// that 'we migrated the fleet' is not a fact about whichever report somebody
    /// happened to open. The note's date (the anomalous day) and its org-wide
    /// scope are derived from the anomaly and are not the caller's to choose.
    ///
    /// The reply is the updated anomaly, carrying `acknowledgement` with the id
    /// of the note it created. Sending it again replaces the sentence and rewords
    /// that note rather than filing a second one; it will not recreate a note
    /// that has since been deleted, since deleting a note is a deliberate act and
    /// the finding stays explained without it.
    ///
    /// This does not suppress detection. If the same provider or service spikes
    /// again on a later day, that is a new anomaly and it is detected and alerted
    /// on as normal.
    ///
    /// POST /api/org/{orgId}/costs/anomalies/{anomalyId}/acknowledge
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func acknowledge(
        orgId: String? = nil,
        anomalyId: String,
        body: CostsAnomaliesAcknowledgeBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostAnomaly {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/costs/anomalies/{anomalyId}/acknowledge",
                pathParameters: ["orgId": orgId?.parameterValue, "anomalyId": anomalyId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
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
    public func get(
        orgId: String? = nil,
        days: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostsAnomaliesGetResult {
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
}

/// `client.costs.anomalies.feedback`
public final class CostsAnomaliesFeedbackNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Mark a cost anomaly expected or unexpected
    ///
    /// Record whether a finding was expected (planned or known) or unexpected (a
    /// real problem), with an optional reason category and note. The verdict
    /// tunes detection: repeated `expected` verdicts on a provider or service
    /// raise its spike threshold within bounds (see GET
    /// /costs/anomaly-sensitivity), and an `expected` verdict with `suppress`
    /// creates a suppression so the same pattern does not alert again.
    /// `unexpected` keeps sensitivity where it is and removes any suppression an
    /// earlier `expected` verdict on the same anomaly created. Sending again
    /// replaces the verdict.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/costs/anomalies/{anomalyId}/feedback
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        anomalyId: String,
        body: CostAnomalyFeedbackInput,
        options: RequestOptions? = nil
    ) async throws -> CostAnomalyFeedbackResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/costs/anomalies/{anomalyId}/feedback",
                pathParameters: ["orgId": orgId?.parameterValue, "anomalyId": anomalyId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Withdraw a cost anomaly verdict
    ///
    /// Clears the verdict and deletes the suppression it created, if any.
    /// Suppressions made by hand are never touched.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/costs/anomalies/{anomalyId}/feedback
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        anomalyId: String,
        options: RequestOptions? = nil
    ) async throws -> CostAnomaly {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/costs/anomalies/{anomalyId}/feedback",
                pathParameters: ["orgId": orgId?.parameterValue, "anomalyId": anomalyId.parameterValue]
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
    /// collection). Anomalies already stored are not re-judged. The four
    /// threshold fields are required — this is a PUT of the whole settings
    /// object, not a patch — and `smsAlerts` deliberately has no server-side
    /// default, so a client that omits it is rejected rather than silently
    /// switching an organization's SMS paging back off. `smsConfigured` is
    /// derived and is not accepted here.
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

/// `client.costs.anomalySuppressions`
public final class CostsAnomalySuppressionsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create an anomaly suppression
    ///
    /// Declare that spend in a scope is expected on a pattern of days until an
    /// expiry. An organization can hold at most 100 active suppressions (409 past
    /// that).
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/costs/anomaly-suppressions
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CostAnomalySuppressionInput,
        options: RequestOptions? = nil
    ) async throws -> CostAnomalySuppression? {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/costs/anomaly-suppressions",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete an anomaly suppression
    ///
    /// The findings it suppressed keep their rows. Any whose day detection still
    /// re-judges (the last three days) becomes eligible to alert on the next
    /// pass.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/costs/anomaly-suppressions/{suppressionId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        suppressionId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/costs/anomaly-suppressions/{suppressionId}",
                pathParameters: ["orgId": orgId?.parameterValue, "suppressionId": suppressionId.parameterValue]
            ),
            options: options
        )
    }

    /// List anomaly suppressions
    ///
    /// Every suppression of the organization, active ones first (soonest expiry
    /// first), then expired ones, most recent first. Expired suppressions are
    /// kept so the list can show what they suppressed.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/anomaly-suppressions
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostsAnomalySuppressionsGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/anomaly-suppressions",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get an anomaly suppression
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/anomaly-suppressions/{suppressionId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdCostsAnomalySuppressionsSuppressionId(
        orgId: String? = nil,
        suppressionId: String,
        options: RequestOptions? = nil
    ) async throws -> CostAnomalySuppression? {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/anomaly-suppressions/{suppressionId}",
                pathParameters: ["orgId": orgId?.parameterValue, "suppressionId": suppressionId.parameterValue]
            ),
            options: options
        )
    }

    /// Update an anomaly suppression
    ///
    /// Replaces the whole object. Takes effect on the next detection pass.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/costs/anomaly-suppressions/{suppressionId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        suppressionId: String,
        body: CostAnomalySuppressionInput,
        options: RequestOptions? = nil
    ) async throws -> CostAnomalySuppression? {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/costs/anomaly-suppressions/{suppressionId}",
                pathParameters: ["orgId": orgId?.parameterValue, "suppressionId": suppressionId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.costs.efficiencyAlertSettings`
public final class CostsEfficiencyAlertSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the organization's efficiency alert tuning
    ///
    /// Thresholds for the commitment-expiry, idle-commitment and
    /// unit-cost-regression detectors. An organization that has never changed one
    /// reads back the defaults, which are chosen to work with no setup.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/costs/efficiency-alert-settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CostEfficiencySettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/costs/efficiency-alert-settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the organization's efficiency alert tuning
    ///
    /// Takes effect on the next evaluation pass (which runs after each cost
    /// collection). Already-fired alerts are not re-judged, and horizons that
    /// have already fired for a commitment's current term do not fire again —
    /// widening the horizon list warns about future crossings, not past ones. A
    /// PUT of the whole object, not a patch.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/costs/efficiency-alert-settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: CostEfficiencySettings,
        options: RequestOptions? = nil
    ) async throws -> CostEfficiencySettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/costs/efficiency-alert-settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
