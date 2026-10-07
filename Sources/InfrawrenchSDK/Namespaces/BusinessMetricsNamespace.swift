/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricsImporterOptionsBody: Codable, Hashable, Sendable {
    public var accountId: String
    public var fieldKey: String
    /// The source plugin's form values, keyed by field (see `GET
    /// /business-metrics/importer-sources`). SQL fields must be a single SELECT
    /// or WITH statement; `{{from}}`, `{{to}}`, `{{to_exclusive}}` and
    /// `{{timezone}}` are replaced with quoted literals.
    public var params: [String: String]

    public init(
        accountId: String,
        fieldKey: String,
        params: [String: String]
    ) {
        self.accountId = accountId
        self.fieldKey = fieldKey
        self.params = params
    }
}

public struct BusinessMetricsImporterOptionsResult: Codable, Hashable, Sendable {
    public struct Option: Codable, Hashable, Sendable {
        public var id: String
        public var label: String
        public var description: String?

        public init(
            id: String,
            label: String,
            description: String? = nil
        ) {
            self.id = id
            self.label = label
            self.description = description
        }
    }

    public var options: [Option]

    public init(
        options: [Option]
    ) {
        self.options = options
    }
}

public struct BusinessMetricsImporterSourcesResult: Codable, Hashable, Sendable {
    public var sources: [BusinessMetricSourceAccount]

    public init(
        sources: [BusinessMetricSourceAccount]
    ) {
        self.sources = sources
    }
}

public struct BusinessMetricsLabelsResult: Codable, Hashable, Sendable {
    public var labels: [BusinessMetricLabelSummary]

    public init(
        labels: [BusinessMetricLabelSummary]
    ) {
        self.labels = labels
    }
}

public struct BusinessMetricsUsageUnitsResult: Codable, Hashable, Sendable {
    public struct Unit: Codable, Hashable, Sendable {
        public var unit: String
        public var usage: Double
        public var services: [String]

        public init(
            unit: String,
            usage: Double,
            services: [String]
        ) {
            self.unit = unit
            self.usage = usage
            self.services = services
        }
    }

    public var units: [Unit]

    public init(
        units: [Unit]
    ) {
        self.units = units
    }
}

public struct BusinessMetricsGetGetResult: Codable, Hashable, Sendable {
    public var metrics: [BusinessMetric]

    public init(
        metrics: [BusinessMetric]
    ) {
        self.metrics = metrics
    }
}

public struct BusinessMetricsImporterGetResult: Codable, Hashable, Sendable {
    public var importer: BusinessMetricImporter?

    public init(
        importer: BusinessMetricImporter? = nil
    ) {
        self.importer = importer
    }
}

public struct BusinessMetricsImporterRunBody: Codable, Hashable, Sendable {
    public var from: String?
    public var to: String?

    public init(
        from: String? = nil,
        to: String? = nil
    ) {
        self.from = from
        self.to = to
    }
}

public struct BusinessMetricsImporterRunsResult: Codable, Hashable, Sendable {
    public var runs: [BusinessMetricImportRun]

    public init(
        runs: [BusinessMetricImportRun]
    ) {
        self.runs = runs
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
    /// `client.businessMetrics.importer`
    public let importer: BusinessMetricsImporterNamespace
    /// `client.businessMetrics.values`
    public let values: BusinessMetricsValuesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.get = BusinessMetricsGetNamespace(transport: transport)
        self.importer = BusinessMetricsImporterNamespace(transport: transport)
        self.values = BusinessMetricsValuesNamespace(transport: transport)
    }

    /// Create a business metric
    ///
    /// Keys must be unique per organization among live metrics; they are how
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

    /// List an importer picker's choices
    ///
    /// Choices for one `select` field of a source's form, given the values picked
    /// so far. Needs `resources:execute` and `costs:write`: it calls the provider
    /// with the account's credentials.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/business-metrics/importer-options
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func importerOptions(
        orgId: String? = nil,
        body: BusinessMetricsImporterOptionsBody,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricsImporterOptionsResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/business-metrics/importer-options",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Preview an importer
    ///
    /// Run a source over a window and return the values it would write, writing
    /// nothing; or, with `dryRun`, validate the query with the provider without
    /// reading data. Read-only queries only, with the same row limit and timeout
    /// as a scheduled run.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/business-metrics/importer-preview
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func importerPreview(
        orgId: String? = nil,
        body: BusinessMetricImportPreviewRequest,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricImportPreview {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/business-metrics/importer-preview",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List importer sources
    ///
    /// Connected accounts whose plugin can feed a business metric on a schedule,
    /// each with the plugin's importer form: which fields to fill and which are
    /// pickers.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/business-metrics/importer-sources
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func importerSources(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricsImporterSourcesResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/business-metrics/importer-sources",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// List a metric's labels
    ///
    /// The label keys the metric's values carry, each with its distinct values
    /// (at most 500) and its cost mapping. A mapped label nobody has reported yet
    /// is listed with no values.
    ///
    /// GET /api/org/{orgId}/business-metrics/{id}/labels
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Metric id or key.
    public func labels(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricsLabelsResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/business-metrics/{id}/labels",
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
    /// numerator and a summed denominator: never a mean of daily ratios, which
    /// weights a quiet day as heavily as a peak one. The same holds for
    /// `overallValue`.
    /// - **A missing or non-positive denominator is a gap** (`value: null` with a
    /// `gap` reason), never 0 and never infinite.
    /// - **Currencies are never merged.** Spend in a currency with no stated rate
    /// keeps its own series rather than being dropped or added to another.
    ///
    /// There is no spend `groupBy`: a per-group ratio needs a per-group
    /// denominator. Split by a metric label with `groupByLabel` instead; in a
    /// ratio mode the label must be mapped to the cost dimension its values name
    /// (`labelMappings` on the metric), so each label value's spend is divided by
    /// its own volume.
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
    /// Replaces the whole definition. Changing `key` never orphans history
    /// (values are keyed on the metric's id) but it does break a workflow still
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

    /// Query cost per usage unit
    ///
    /// Spend divided by the usage quantity providers report in one `usageUnit`,
    /// with no business metric involved. Both halves come from the same cost rows
    /// (those reported in that unit), so the numerator is exactly the spend that
    /// bought the denominator. A bucket with no usage is a gap (`no_usage`),
    /// never 0. Labels do not apply.
    ///
    /// POST /api/org/{orgId}/business-metrics/usage-unit-costs
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func usageUnitCosts(
        orgId: String? = nil,
        body: UnitCostQueryRequest,
        options: RequestOptions? = nil
    ) async throws -> UnitCostQueryResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/business-metrics/usage-unit-costs",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List usage units
    ///
    /// The provider usage units the organization's cost rows carry over the last
    /// 90 days, most spend first, with a few of the services reporting each.
    /// Backs the per-usage-unit picker.
    ///
    /// GET /api/org/{orgId}/business-metrics/usage-units
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func usageUnits(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricsUsageUnitsResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/business-metrics/usage-units",
                pathParameters: ["orgId": orgId?.parameterValue]
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

/// `client.businessMetrics.importer`
public final class BusinessMetricsImporterNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Delete a metric's importer
    ///
    /// Stops importing and drops the run history. Values already imported stay.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/business-metrics/{id}/importer
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
                path: "/api/org/{orgId}/business-metrics/{id}/importer",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a metric's importer
    ///
    /// `importer` is null when the metric's values are only pushed.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/business-metrics/{id}/importer
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Metric id or key.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricsImporterGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/business-metrics/{id}/importer",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Run a metric's importer now
    ///
    /// Runs synchronously and returns the finished run, failed or not. With no
    /// body it reads the importer's own window; `from`/`to` backfill a wider one
    /// (at most 730 days).
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/business-metrics/{id}/importer/run
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Metric id or key.
    public func run(
        orgId: String? = nil,
        id: String,
        body: BusinessMetricsImporterRunBody? = nil,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricImportRun {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/business-metrics/{id}/importer/run",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// List a metric's import runs
    ///
    /// Newest first; the most recent 50 are kept.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/business-metrics/{id}/importer/runs
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
    /// - Parameter limit: Default 20.
    public func runs(
        orgId: String? = nil,
        id: String,
        limit: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricsImporterRunsResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/business-metrics/{id}/importer/runs",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                query: [QueryParameter("limit", limit)]
            ),
            options: options
        )
    }

    /// Create or replace a metric's importer
    ///
    /// One importer per metric. A full replace: omitted fields take their
    /// defaults. Each run restates whole days (every label a day carried is
    /// replaced by what the source returned), never touches days the source
    /// returned nothing for, and ignores points outside the window. Changing the
    /// account, the params or the schedule makes it due immediately.
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// PUT /api/org/{orgId}/business-metrics/{id}/importer
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter id: Metric id or key.
    public func update(
        orgId: String? = nil,
        id: String,
        body: BusinessMetricImporterInput,
        options: RequestOptions? = nil
    ) async throws -> BusinessMetricImporter? {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/business-metrics/{id}/importer",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
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
    /// `infra.businessMetrics.write(...)` in a workflow; both go through one
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
