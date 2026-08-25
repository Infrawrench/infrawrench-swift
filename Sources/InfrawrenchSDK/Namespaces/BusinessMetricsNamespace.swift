/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricsGetGetResult: Codable, Hashable, Sendable {
    public var metrics: [BusinessMetric]

    public init(
        metrics: [BusinessMetric]
    ) {
        self.metrics = metrics
    }
}

public struct BusinessMetricsValuesCreateResult: Codable, Hashable, Sendable {
    /// Days written, counting restatements.
    public var written: Int

    public init(
        written: Int
    ) {
        self.written = written
    }
}

public struct BusinessMetricsValuesGetResult: Codable, Hashable, Sendable {
    public var values: [BusinessMetricValue]

    public init(
        values: [BusinessMetricValue]
    ) {
        self.values = values
    }
}

/// `client.businessMetrics`
public final class BusinessMetricsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.businessMetrics.get`
    public let get: BusinessMetricsGetNamespace
    /// `client.businessMetrics.values`
    public let values: BusinessMetricsValuesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.get = BusinessMetricsGetNamespace(transport: transport)
        self.values = BusinessMetricsValuesNamespace(transport: transport)
    }

    /// Create a business metric
    ///
    /// Keys must be unique per organization among live metrics — they are how
    /// workflows and the CLI address the metric. A key collision is a 409.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/business-metrics
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: A live metric already uses this key.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: BusinessMetricInput,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetric {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/business-metrics",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a business metric
    ///
    /// Soft delete. Not refused when a dashboard card references the metric,
    /// unlike a saved cost filter: a unit-cost card whose metric is gone fails
    /// its query and says so, whereas a card that quietly reverted to plain spend
    /// would be a chart claiming to be something it is not.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/business-metrics/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Metric id or key.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/business-metrics/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Query unit costs or margin
    ///
    /// Divide spend by the metric, bucketed as asked. Three properties of the
    /// answer are worth knowing before reading it:
    ///
    /// - **The ratio is computed at the requested bucket**, from a summed
    /// numerator and a summed denominator — never a mean of daily ratios, which
    /// weights a quiet day as heavily as a peak one. The same holds for
    /// `overallValue`.
    /// - **A missing or non-positive denominator is a gap** (`value: null` with a
    /// `gap` reason), never 0 and never infinite.
    /// - **Currencies are never merged.** Spend in a currency with no stated rate
    /// keeps its own series rather than being dropped or added to another.
    ///
    /// There is no `groupBy`: a per-group ratio would need a per-group
    /// denominator, and dividing each service's spend by the whole customer count
    /// produces numbers that do not sum to the real one.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/business-metrics/{id}/unit-costs
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Metric id or key.
    public func unitCosts(
        orgId: String? = nil,
        id: String,
        body: UnitCostQueryRequest,
        options: RequestOptions? = nil
    ) async throws -> UnitCostQueryResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/business-metrics/{id}/unit-costs",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Update a business metric
    ///
    /// Replaces the whole definition. Changing `key` never orphans history —
    /// values are keyed on the metric's id — but it does break a workflow still
    /// writing to the old key, which is why the key is separate from the display
    /// name in the first place.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/business-metrics/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: A live metric already uses this key.
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Metric id or key.
    public func update(
        orgId: String? = nil,
        id: String,
        body: BusinessMetricInput,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetric {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/business-metrics/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.businessMetrics.get`
public final class BusinessMetricsGetNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List business metrics
    ///
    /// The organization's declared denominators, by key, each with the range of
    /// days it has values for.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/business-metrics
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricsGetGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/business-metrics",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get a business metric
    ///
    /// `id` accepts either the metric's id or its key.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/business-metrics/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Metric id or key.
    public func getOrgOrgIdBusinessMetricsId(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetric {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/business-metrics/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.businessMetrics.values`
public final class BusinessMetricsValuesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Report metric values
    ///
    /// Write a batch of days. **Re-reporting a day restates it rather than
    /// accumulating**, which is what makes a nightly job safe to retry. Nothing
    /// lands unless the whole batch validates, so a bad row is a 400 rather than
    /// half a month restated. The same guarantees back
    /// `infra.businessMetrics.write(...)` in a workflow — both go through one
    /// validator.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/business-metrics/{id}/values
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Metric id or key.
    public func create(
        orgId: String? = nil,
        id: String,
        body: BusinessMetricValuesInput,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricsValuesCreateResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/business-metrics/{id}/values",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List a metric's reported values
    ///
    /// Newest day first.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/business-metrics/{id}/values
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Metric id or key.
    ///
    /// - Parameter limit: Default 90.
    public func get(
        orgId: String? = nil,
        id: String,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricsValuesGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/business-metrics/{id}/values",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                query: [QueryParameter("limit", limit)]
            ),
            options: options
        )
    }
}
