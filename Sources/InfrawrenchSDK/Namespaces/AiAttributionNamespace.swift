/*
 * InfrawrenchSDK v1.62.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.62.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AiAttributionLocationsResult: Codable, Hashable, Sendable {
    public var locations: [AiRequestLogLocation]

    public init(
        locations: [AiRequestLogLocation]
    ) {
        self.locations = locations
    }
}

public struct AiAttributionReattributeBody: Codable, Hashable, Sendable {
    public var from: String
    public var to: String

    public init(
        from: String,
        to: String
    ) {
        self.from = from
        self.to = to
    }
}

public struct AiAttributionReattributeResult: Codable, Hashable, Sendable {
    public var ok: Bool
    public var days: Int

    public init(
        ok: Bool,
        days: Int
    ) {
        self.ok = ok
        self.days = days
    }
}

public struct AiAttributionSourceKindsResult: Codable, Hashable, Sendable {
    public var sourceKinds: [AiRequestSourceKindOption]

    public init(
        sourceKinds: [AiRequestSourceKindOption]
    ) {
        self.sourceKinds = sourceKinds
    }
}

public struct AiAttributionDimensionsDeleteResult: Codable, Hashable, Sendable {
    public var ok: Bool

    public init(
        ok: Bool
    ) {
        self.ok = ok
    }
}

public struct AiAttributionDimensionsGetResult: Codable, Hashable, Sendable {
    public var dimensions: [AiAttributionDimension]

    public init(
        dimensions: [AiAttributionDimension]
    ) {
        self.dimensions = dimensions
    }
}

public struct AiAttributionSourcesDeleteResult: Codable, Hashable, Sendable {
    public var ok: Bool

    public init(
        ok: Bool
    ) {
        self.ok = ok
    }
}

public struct AiAttributionSourcesGetResult: Codable, Hashable, Sendable {
    public var sources: [AiRequestSource]

    public init(
        sources: [AiRequestSource]
    ) {
        self.sources = sources
    }
}

public struct AiAttributionSourcesRecollectBody: Codable, Hashable, Sendable {
    public var from: String

    public init(
        from: String
    ) {
        self.from = from
    }
}

/// `client.aiAttribution`
public final class AiAttributionNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.aiAttribution.dimensions`
    public let dimensions: AiAttributionDimensionsNamespace
    /// `client.aiAttribution.sources`
    public let sources: AiAttributionSourcesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.dimensions = AiAttributionDimensionsNamespace(transport: transport)
        self.sources = AiAttributionSourcesNamespace(transport: transport)
    }

    /// Discover locations (buckets, log groups, gateways) for a source kind
    ///
    /// GET /api/org/{orgId}/ai-attribution/locations
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func locations(
        orgId: String? = nil,
        accountId: String,
        sourceKindId: String,
        options: RequestOptions? = nil
    ) async throws -> AiAttributionLocationsResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ai-attribution/locations",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("accountId", accountId), QueryParameter("sourceKindId", sourceKindId)]
            ),
            options: options
        )
    }

    /// Re-split a range of days now
    ///
    /// POST /api/org/{orgId}/ai-attribution/reattribute
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func reattribute(
        orgId: String? = nil,
        body: AiAttributionReattributeBody,
        options: RequestOptions? = nil
    ) async throws -> AiAttributionReattributeResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ai-attribution/reattribute",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// List the request-log source kinds the org can add
    ///
    /// GET /api/org/{orgId}/ai-attribution/source-kinds
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func sourceKinds(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AiAttributionSourceKindsResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ai-attribution/source-kinds",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Attributed AI spend by one caller dimension
    ///
    /// Includes the `(unattributed)` remainder and `(not set)` for matched
    /// requests that lacked every mapped key. For time series, group a cost
    /// report by the tag key `caller:<dimension>`.
    ///
    /// GET /api/org/{orgId}/ai-attribution/spend
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: Inclusive start day. Defaults to 29 days ago.
    ///
    /// - Parameter to: Inclusive end day. Defaults to today.
    public func spend(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        dimension: String,
        options: RequestOptions? = nil
    ) async throws -> AiSpendBreakdown {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ai-attribution/spend",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to), QueryParameter("dimension", dimension)]
            ),
            options: options
        )
    }

    /// Match-rate statistics per source and coverage per provider
    ///
    /// GET /api/org/{orgId}/ai-attribution/stats
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter from: Inclusive start day. Defaults to 29 days ago.
    ///
    /// - Parameter to: Inclusive end day. Defaults to today.
    public func stats(
        orgId: String? = nil,
        from: String? = nil,
        to: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AiAttributionStats {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ai-attribution/stats",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("from", from), QueryParameter("to", to)]
            ),
            options: options
        )
    }
}

/// `client.aiAttribution.dimensions`
public final class AiAttributionDimensionsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Map request-metadata keys to a caller dimension
    ///
    /// POST /api/org/{orgId}/ai-attribution/dimensions
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: AiAttributionDimensionInput,
        options: RequestOptions? = nil
    ) async throws -> AiAttributionDimension {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ai-attribution/dimensions",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a caller dimension
    ///
    /// DELETE /api/org/{orgId}/ai-attribution/dimensions/{id}
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
    ) async throws -> AiAttributionDimensionsDeleteResult {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/ai-attribution/dimensions/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List caller dimensions
    ///
    /// GET /api/org/{orgId}/ai-attribution/dimensions
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AiAttributionDimensionsGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ai-attribution/dimensions",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update a caller dimension
    ///
    /// PUT /api/org/{orgId}/ai-attribution/dimensions/{id}
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
        body: AiAttributionDimensionInput,
        options: RequestOptions? = nil
    ) async throws -> AiAttributionDimension {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ai-attribution/dimensions/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.aiAttribution.sources`
public final class AiAttributionSourcesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Add a request-log source
    ///
    /// Governed by `org:settings:write`: a source authorizes a daily read of the
    /// org's request logs, and the Bedrock CloudWatch kind runs a Logs Insights
    /// query billed to the org's own AWS account per GB scanned. Audit-logged.
    ///
    /// POST /api/org/{orgId}/ai-attribution/sources
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: AiRequestSourceInput,
        options: RequestOptions? = nil
    ) async throws -> AiRequestSource {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ai-attribution/sources",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a request-log source
    ///
    /// DELETE /api/org/{orgId}/ai-attribution/sources/{id}
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
    ) async throws -> AiAttributionSourcesDeleteResult {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/ai-attribution/sources/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// List request-log sources
    ///
    /// GET /api/org/{orgId}/ai-attribution/sources
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> AiAttributionSourcesGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ai-attribution/sources",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Read one request-log source
    ///
    /// GET /api/org/{orgId}/ai-attribution/sources/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdAiAttributionSourcesId(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> AiRequestSource {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/ai-attribution/sources/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Re-read a source's history from a day
    ///
    /// Aggregates keep only mapped metadata keys, so a newly mapped dimension
    /// reaches history only by re-reading it. Clamped to the source kind's
    /// history limit.
    ///
    /// POST /api/org/{orgId}/ai-attribution/sources/{id}/recollect
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func recollect(
        orgId: String? = nil,
        id: String,
        body: AiAttributionSourcesRecollectBody,
        options: RequestOptions? = nil
    ) async throws -> AiRequestSource {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/ai-attribution/sources/{id}/recollect",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Update a request-log source
    ///
    /// Pointing a source at a different location restarts its collection history.
    ///
    /// PUT /api/org/{orgId}/ai-attribution/sources/{id}
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
        body: AiRequestSourceInput,
        options: RequestOptions? = nil
    ) async throws -> AiRequestSource {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/ai-attribution/sources/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
