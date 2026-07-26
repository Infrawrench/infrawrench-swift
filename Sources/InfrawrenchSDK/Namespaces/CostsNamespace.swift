/*
 * InfrawrenchSDK v0.2.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.2.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

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

    /// List distinct values for a cost dimension
    ///
    /// Feeds the filter and group-by pickers. Pass dimension=tag-keys for tag
    /// keys; dimension=tag requires tagKey.
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

    /// Per-account cost collection status
    ///
    /// Which accounts support cost collection, whether their history backfill has
    /// completed, and the ingested date coverage.
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
