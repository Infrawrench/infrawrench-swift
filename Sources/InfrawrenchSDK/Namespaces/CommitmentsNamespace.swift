/*
 * InfrawrenchSDK v1.118.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.118.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.commitments`
public final class CommitmentsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.commitments.reports`
    public let reports: CommitmentsReportsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.reports = CommitmentsReportsNamespace(transport: transport)
    }

    /// Reservations, savings plans and committed-use discounts
    ///
    /// The organization's purchased commitments (reserved instances, savings
    /// plans, committed-use discounts) with three derived readings.
    ///
    /// **Coverage** is a range, not a number: the broad ratio counts every
    /// uncovered usage dollar in the denominator (a lower bound; egress and
    /// per-request charges can never be committed against), the narrow ratio only
    /// uncovered usage in cells where a commitment demonstrably landed (an upper
    /// bound). Accounts whose plugin cannot distinguish charge types are excluded
    /// and listed; a scope where every account is excluded reports unavailable,
    /// not 0%.
    ///
    /// **Utilization** is measured only over days cost data was actually
    /// collected; a collection gap is reported as missing days, never counted as
    /// idle commitment. Unit-denominated commitments (GCP) report null with a
    /// reason, never 0%. Azure's own reported utilization rides on each holding
    /// separately and is never blended with the derived figure.
    ///
    /// **The planner** recommends committing at the p10 floor of daily uncovered
    /// spend, gated on presence, trend, floor and materiality. Savings are quoted
    /// against published "up to" discount rates and marked as such. Nothing is
    /// ever purchased automatically.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/commitments
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CommitmentsFeed {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/commitments",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Picker values for the commitment report editor
    ///
    /// Providers (with whether their cost rows can measure coverage), accounts,
    /// the services and regions with usage in the last 180 days, and the
    /// commitment inventory. Scoped to what the caller may see.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/commitments/report-options
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func reportOptions(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> CommitmentReportOptions {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/commitments/report-options",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Run an unsaved commitment report config
    ///
    /// Coverage, utilization, savings and commitment cost over time, on the
    /// amortized basis. See `CommitmentReportMetricValues` for each metric's
    /// formula. A read despite the method.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/commitments/report-query
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func reportQuery(
        orgId: String? = nil,
        body: CommitmentReportConfig,
        options: RequestOptions? = nil
    ) async throws -> CommitmentReportResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/commitments/report-query",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.commitments.reports`
public final class CommitmentsReportsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a commitment report
    ///
    /// Stored exactly as sent. The creator is the report's implicit owner for
    /// sharing; filing it in a folder needs editor access to the folder.
    /// Audit-logged.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/commitments/reports
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CommitmentReportInput,
        options: RequestOptions? = nil
    ) async throws -> CommitmentReport {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/commitments/reports",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a commitment report
    ///
    /// Soft delete; its sharing goes with it. Audit-logged.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/commitments/reports/{id}
    ///
    /// Raises on 403: Forbidden
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
                path: "/api/org/{orgId}/commitments/reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a commitment report
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/commitments/reports/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CommitmentReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/commitments/reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List saved commitment reports
    ///
    /// The saved commitment reports the caller's sharing lets them open, by name.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/commitments/reports
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [CommitmentReport] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/commitments/reports",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Run a saved commitment report
    ///
    /// A relative date range resolves against today on every run, and a range
    /// reaching past today ends today.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/commitments/reports/{id}/run
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func run(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CommitmentReportRunResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/commitments/reports/{id}/run",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Replace a commitment report
    ///
    /// Name, description, config and folder together. Needs editor. Moving it to
    /// another folder needs editor access to that folder. Audit-logged.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/commitments/reports/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: CommitmentReportInput,
        options: RequestOptions? = nil
    ) async throws -> CommitmentReport {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/commitments/reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
