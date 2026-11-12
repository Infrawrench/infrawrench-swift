/*
 * InfrawrenchSDK v1.103.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.103.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.awsPricing`
public final class AwsPricingNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Run a read-only SQL query over instance pricing data (deprecated path)
    ///
    /// Deprecated alias of `POST /api/v1/instance-pricing/query`, its path before
    /// the warehouse covered clouds other than AWS; it behaves identically. Use
    /// the new path.
    ///
    /// POST /api/v1/aws-pricing/query
    ///
    /// Deprecated.
    ///
    /// Raises on 400: The query was refused: not read-only, more than one
    /// statement, or ClickHouse's own error (unknown column, syntax), with its
    /// message
    ///
    /// Raises on 401: Unauthenticated
    ///
    /// Raises on 502: The warehouse could not answer; try again shortly
    ///
    /// Raises on 503: A backing service this endpoint depends on is not available
    ///
    /// Raises on 504: The query ran longer than 30 seconds
    @available(*, deprecated)
    public func query(
        body: AwsPricingQueryRequest,
        options: RequestOptions? = nil
    ) async throws -> AwsPricingQueryResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/v1/aws-pricing/query",
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Describe the instance pricing tables (deprecated path)
    ///
    /// Deprecated alias of `GET /api/v1/instance-pricing/schema`, its path before
    /// the warehouse covered clouds other than AWS; it behaves identically. Use
    /// the new path.
    ///
    /// GET /api/v1/aws-pricing/schema
    ///
    /// Deprecated.
    ///
    /// Raises on 401: Unauthenticated
    @available(*, deprecated)
    public func schema(
        options: RequestOptions? = nil
    ) async throws -> AwsPricingSchema {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/v1/aws-pricing/schema"
            ),
            options: options
        )
    }
}
