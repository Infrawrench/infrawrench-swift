/*
 * InfrawrenchSDK v0.15.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.15.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum SqlQueryResult: Codable, Hashable, Sendable {
    case sqlQueryResponse(SqlQueryResponse)
    case jsonObject(JsonObject)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(SqlQueryResponse.self) {
            self = .sqlQueryResponse(value)
            return
        }
        if let value = try? container.decode(JsonObject.self) {
            self = .jsonObject(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .sqlQueryResponse(let value): try container.encode(value)
        case .jsonObject(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}

/// `client.sql`
public final class SqlNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Dry-run cost estimate (e.g. BigQuery byte scan)
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/sql/estimate
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func estimate(
        orgId: String? = nil,
        body: SqlEstimateRequest,
        options: RequestOptions? = nil
    ) async throws -> JsonObject {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/sql/estimate",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Run an INSERT/UPDATE/DELETE/DDL statement
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/sql/execute
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func execute(
        orgId: String? = nil,
        body: SqlExecuteRequest,
        options: RequestOptions? = nil
    ) async throws -> SqlExecuteResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/sql/execute",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Run a read-only SQL query
    ///
    /// Routes to the right driver: REST `executeQuery` (BigQuery, Databricks),
    /// per-resource SQL driver (Neon, Turso) or account-level SQL driver
    /// (Postgres, MySQL).
    ///
    /// _Requires permission: `resources:execute`._
    ///
    /// POST /api/org/{orgId}/sql/query
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func query(
        orgId: String? = nil,
        body: SqlQueryRequest,
        options: RequestOptions? = nil
    ) async throws -> SqlQueryResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/sql/query",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
