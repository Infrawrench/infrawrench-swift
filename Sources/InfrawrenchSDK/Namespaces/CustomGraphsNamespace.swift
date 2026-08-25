/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.customGraphs`
public final class CustomGraphsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Type-check custom-graph source without saving it
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// POST /api/org/{orgId}/custom-graphs/check
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func check(
        orgId: String? = nil,
        body: CustomGraphCheckRequest,
        options: RequestOptions? = nil
    ) async throws -> CustomGraphCheckResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/custom-graphs/check",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Create a custom graph (paid plan required)
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// POST /api/org/{orgId}/custom-graphs
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 402: Payment required — the organization's plan does not include
    /// this
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: CustomGraphInput,
        options: RequestOptions? = nil
    ) async throws -> CustomGraphFull {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/custom-graphs",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a custom graph (and its dashboard cards)
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// DELETE /api/org/{orgId}/custom-graphs/{id}
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
                path: "/api/org/{orgId}/custom-graphs/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Get a custom graph (including source)
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// GET /api/org/{orgId}/custom-graphs/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> CustomGraphFull {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/custom-graphs/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List custom graphs
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// GET /api/org/{orgId}/custom-graphs
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func list(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> [CustomGraphSummary] {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/custom-graphs",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Run the graph's script and return its render spec (paid plan required)
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// POST /api/org/{orgId}/custom-graphs/{id}/render
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 402: Payment required — the organization's plan does not include
    /// this
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func render(
        orgId: String? = nil,
        id: String,
        body: CustomGraphRenderRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> CustomGraphRenderResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/custom-graphs/{id}/render",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// The ambient graph.d.ts for custom-graph source
    ///
    /// _Requires permission: `dashboards:read`._
    ///
    /// GET /api/org/{orgId}/custom-graphs/typings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func typings(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> Data {
        return try await transport.sendData(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/custom-graphs/typings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a custom graph (paid plan required)
    ///
    /// _Requires permission: `dashboards:write`._
    ///
    /// PUT /api/org/{orgId}/custom-graphs/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 402: Payment required — the organization's plan does not include
    /// this
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: CustomGraphUpdate,
        options: RequestOptions? = nil
    ) async throws -> CustomGraphFull {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/custom-graphs/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
