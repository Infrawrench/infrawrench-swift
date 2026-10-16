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

public struct K8sEfficiencyReportsQueryBody: Codable, Hashable, Sendable {
    public var config: KubernetesEfficiencyConfig

    public init(
        config: KubernetesEfficiencyConfig
    ) {
        self.config = config
    }
}

public struct K8sEfficiencyReportsValuesResult: Codable, Hashable, Sendable {
    public var values: [String]

    public init(
        values: [String]
    ) {
        self.values = values
    }
}

/// `client.k8sEfficiencyReports`
public final class K8sEfficiencyReportsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a Kubernetes efficiency report
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// POST /api/org/{orgId}/k8s-efficiency-reports
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: KubernetesEfficiencyReportInput,
        options: RequestOptions? = nil
    ) async throws -> KubernetesEfficiencyReport {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/k8s-efficiency-reports",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a Kubernetes efficiency report
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// DELETE /api/org/{orgId}/k8s-efficiency-reports/{id}
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
                path: "/api/org/{orgId}/k8s-efficiency-reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Export a Kubernetes efficiency report
    ///
    /// One record per row and cost category plus the totals; with `perPeriod`,
    /// each row's figures per period as well. CSV (RFC 4180) or newline-delimited
    /// JSON.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/k8s-efficiency-reports/{id}/export
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter format: One of `csv`, `ndjson`.
    ///
    /// - Parameter perPeriod: One of `true`, `false`, `1`, `0`.
    public func export(
        orgId: String? = nil,
        id: String,
        format: String? = nil,
        perPeriod: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> String {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/k8s-efficiency-reports/{id}/export",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                query: [QueryParameter("format", format), QueryParameter("perPeriod", perPeriod)]
            ),
            options: options
        )
    }

    /// Get a Kubernetes efficiency report
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/k8s-efficiency-reports/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> KubernetesEfficiencyReport {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/k8s-efficiency-reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List Kubernetes efficiency reports
    ///
    /// The reports the caller's sharing lets them open, alphabetically.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/k8s-efficiency-reports
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [KubernetesEfficiencyReport] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/k8s-efficiency-reports",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Picker options for Kubernetes efficiency reports
    ///
    /// Clusters, regions, namespaces, node pools and label keys present on the
    /// org's Kubernetes cost rows, narrowed to the caller's cost visibility
    /// scope.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/k8s-efficiency-reports/options
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func options(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> KubernetesEfficiencyOptions {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/k8s-efficiency-reports/options",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Run an unsaved Kubernetes efficiency report config
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/k8s-efficiency-reports/query
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func query(
        orgId: String? = nil,
        body: K8sEfficiencyReportsQueryBody,
        options: RequestOptions? = nil
    ) async throws -> KubernetesEfficiencyResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/k8s-efficiency-reports/query",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Run a Kubernetes efficiency report
    ///
    /// Per row and in total: total, used, requested-but-unused, unmeasured, idle
    /// and overhead cost, efficiency on the report's basis, a per-category
    /// breakdown and a per-period series.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/k8s-efficiency-reports/{id}/run
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func run(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> KubernetesEfficiencyRunResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/k8s-efficiency-reports/{id}/run",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Replace a Kubernetes efficiency report
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/k8s-efficiency-reports/{id}
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
        body: KubernetesEfficiencyReportInput,
        options: RequestOptions? = nil
    ) async throws -> KubernetesEfficiencyReport {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/k8s-efficiency-reports/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Values of one label on Kubernetes cost rows
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/k8s-efficiency-reports/values
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func values(
        orgId: String? = nil,
        tagKey: String,
        options: RequestOptions? = nil
    ) async throws -> K8sEfficiencyReportsValuesResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/k8s-efficiency-reports/values",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("tagKey", tagKey)]
            ),
            options: options
        )
    }
}
