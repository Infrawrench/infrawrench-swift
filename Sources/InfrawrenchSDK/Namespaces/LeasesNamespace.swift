/*
 * InfrawrenchSDK v1.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.leases`
public final class LeasesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Cancel a lease
    ///
    /// Stop the countdown — the resource stays, the lease goes `canceled` and
    /// leaves the expiry radar. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/leases/{leaseId}/cancel
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func cancel(
        orgId: String? = nil,
        leaseId: String,
        options: RequestOptions? = nil
    ) async throws -> ResourceLease {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/leases/{leaseId}/cancel",
                pathParameters: ["orgId": orgId?.parameterValue, "leaseId": leaseId.parameterValue]
            ),
            options: options
        )
    }

    /// Create a resource lease
    ///
    /// Attach an expiry to a resource — 'give me a test cluster for 3 days'. One
    /// lease per resource (an active lease conflicts; a terminal one is
    /// replaced). `autoDelete: true` opts into deletion at expiry — the poller
    /// announces it twice first, defers during change freezes, and requires the
    /// caller to hold `resources:delete`. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/leases
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: The resource already has an active lease
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: ResourceLeaseCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceLease {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/leases",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a lease row
    ///
    /// Remove the lease record entirely (including terminal rows). The resource
    /// is not touched. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/leases/{leaseId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        leaseId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/leases/{leaseId}",
                pathParameters: ["orgId": orgId?.parameterValue, "leaseId": leaseId.parameterValue]
            ),
            options: options
        )
    }

    /// List resource leases
    ///
    /// Every lease in the organization, soonest deadline first. Active leases
    /// also appear on the expiry radar (`GET /expiring`) as kind `lease` items,
    /// so the owner is nagged through the existing expiry alerts.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/leases
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceLeaseList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/leases",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get one resource's lease
    ///
    /// The (unique) lease on a resource, whatever its status, or null.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/leases/resource
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func resource(
        orgId: String? = nil,
        resourceId: String,
        options: RequestOptions? = nil
    ) async throws -> ResourceLeaseLookup {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/leases/resource",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId)]
            ),
            options: options
        )
    }

    /// Update a lease
    ///
    /// Edit the deadline, the auto-delete opt-in and/or the note of an active
    /// lease. Changing the deadline or the auto-delete flag re-arms the
    /// two-announcement schedule. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/leases/{leaseId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        leaseId: String,
        body: ResourceLeaseUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> ResourceLease {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/leases/{leaseId}",
                pathParameters: ["orgId": orgId?.parameterValue, "leaseId": leaseId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
