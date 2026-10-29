/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.services`
public final class ServicesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.services.get`
    public let get: ServicesGetNamespace
    /// `client.services.members`
    public let members: ServicesMembersNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.get = ServicesGetNamespace(transport: transport)
        self.members = ServicesMembersNamespace(transport: transport)
    }

    /// Create a service
    ///
    /// Owners, the on-call schedule, SLOs and runbooks must belong to the
    /// organization. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/services
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: ServiceCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> Service {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/services",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a service
    ///
    /// The member resources, SLOs, runbooks and schedule are untouched.
    /// Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/services/{serviceId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter serviceId: Service id or slug.
    public func delete(
        orgId: String? = nil,
        serviceId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/services/{serviceId}",
                pathParameters: ["orgId": orgId?.parameterValue, "serviceId": serviceId.parameterValue]
            ),
            options: options
        )
    }

    /// Look up the services resources belong to
    ///
    /// Membership is explicit members plus rules minus exclusions, resolved
    /// against the current inventory. Resources in no service are absent from the
    /// map.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/services/for-resources
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter ids: Comma-separated Infrawrench resource ids (at most 500).
    public func forResources(
        orgId: String? = nil,
        ids: String,
        options: RequestOptions? = nil
    ) async throws -> ServicesForResources {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/services/for-resources",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("ids", ids)]
            ),
            options: options
        )
    }

    /// Read a service's scorecard results and history
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/services/{serviceId}/scorecards
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter serviceId: Service id or slug.
    public func scorecards(
        orgId: String? = nil,
        serviceId: String,
        options: RequestOptions? = nil
    ) async throws -> ServiceScorecards {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/services/{serviceId}/scorecards",
                pathParameters: ["orgId": orgId?.parameterValue, "serviceId": serviceId.parameterValue]
            ),
            options: options
        )
    }

    /// Summarize a service
    ///
    /// Trailing 30-day member spend (scoped to the caller's cost visibility),
    /// linked SLO standing, open posture, orphan and backup findings on members,
    /// the current on-call shift, the last week's changes and current scorecard
    /// results. Feeds that fail are listed in `findings.unavailable` or
    /// `cost.available` rather than failing the request.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/services/{serviceId}/summary
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter serviceId: Service id or slug.
    public func summary(
        orgId: String? = nil,
        serviceId: String,
        options: RequestOptions? = nil
    ) async throws -> ServiceSummary {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/services/{serviceId}/summary",
                pathParameters: ["orgId": orgId?.parameterValue, "serviceId": serviceId.parameterValue]
            ),
            options: options
        )
    }

    /// Update a service
    ///
    /// Omitted fields keep their value. List fields (owners, links, SLOs,
    /// runbooks, rules) replace the stored list. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PATCH /api/org/{orgId}/services/{serviceId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter serviceId: Service id or slug.
    public func update(
        orgId: String? = nil,
        serviceId: String,
        body: ServiceUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> Service {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/services/{serviceId}",
                pathParameters: ["orgId": orgId?.parameterValue, "serviceId": serviceId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.services.get`
public final class ServicesGetNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List services
    ///
    /// Every service with its owners, links, resolved member count and current
    /// scorecard levels.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/services
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ServiceList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/services",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Read a service with its members
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/services/{serviceId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter serviceId: Service id or slug.
    public func getOrgOrgIdServicesServiceId(
        orgId: String? = nil,
        serviceId: String,
        options: RequestOptions? = nil
    ) async throws -> ServiceDetail {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/services/{serviceId}",
                pathParameters: ["orgId": orgId?.parameterValue, "serviceId": serviceId.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.services.members`
public final class ServicesMembersNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Add members to a service
    ///
    /// Adds resources by hand. An excluded resource is put back. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/services/{serviceId}/members
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter serviceId: Service id or slug.
    public func create(
        orgId: String? = nil,
        serviceId: String,
        body: ServiceMembersRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> ServiceDetail {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/services/{serviceId}/members",
                pathParameters: ["orgId": orgId?.parameterValue, "serviceId": serviceId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Remove a member from a service
    ///
    /// A hand-added member is removed; a rule-matched one is excluded, since the
    /// rule would otherwise put it back. With `restore=1`, deletes an exclusion
    /// instead. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/services/{serviceId}/members/{resourceId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter serviceId: Service id or slug.
    ///
    /// - Parameter restore: Delete an exclusion instead. One of `1`.
    public func delete(
        orgId: String? = nil,
        serviceId: String,
        resourceId: String,
        restore: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ServiceDetail {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/services/{serviceId}/members/{resourceId}",
                pathParameters: ["orgId": orgId?.parameterValue, "serviceId": serviceId.parameterValue, "resourceId": resourceId.parameterValue],
                query: [QueryParameter("restore", restore)]
            ),
            options: options
        )
    }
}
