/*
 * InfrawrenchSDK v1.122.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.122.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.heartbeats`
public final class HeartbeatsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a heartbeat
    ///
    /// Create a heartbeat with a schedule and grace period. It stays `new` until
    /// its first ping, then goes down whenever a ping is later than the schedule
    /// plus grace. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/heartbeats
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
        body: HeartbeatCreate,
        options: RequestOptions? = nil
    ) async throws -> Heartbeat {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/heartbeats",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Delete a heartbeat
    ///
    /// Remove the heartbeat and its ping history. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/heartbeats/{heartbeatId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        heartbeatId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/heartbeats/{heartbeatId}",
                pathParameters: ["orgId": orgId?.parameterValue, "heartbeatId": heartbeatId.parameterValue]
            ),
            options: options
        )
    }

    /// List heartbeat monitors
    ///
    /// Every heartbeat in the organization with its status, schedule, ping URL,
    /// last ping and next deadline.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/heartbeats
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> HeartbeatList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/heartbeats",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Read a heartbeat's ping history
    ///
    /// Recent pings, newest first, with each run's duration where a `/start`
    /// opened it. Kept for 30 days.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/heartbeats/{heartbeatId}/pings
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func pings(
        orgId: String? = nil,
        heartbeatId: String,
        limit: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> HeartbeatPings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/heartbeats/{heartbeatId}/pings",
                pathParameters: ["orgId": orgId?.parameterValue, "heartbeatId": heartbeatId.parameterValue],
                query: [QueryParameter("limit", limit)]
            ),
            options: options
        )
    }

    /// Replace a heartbeat's ping URL
    ///
    /// Issue a new secret ping URL. The old one stops working at once.
    /// Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/heartbeats/{heartbeatId}/rotate-token
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func rotateToken(
        orgId: String? = nil,
        heartbeatId: String,
        options: RequestOptions? = nil
    ) async throws -> Heartbeat {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/heartbeats/{heartbeatId}/rotate-token",
                pathParameters: ["orgId": orgId?.parameterValue, "heartbeatId": heartbeatId.parameterValue]
            ),
            options: options
        )
    }

    /// Suggest scheduled resources to watch
    ///
    /// Scheduled jobs, pipelines and functions from the organization's synced
    /// resources (the fields their plugins flag as a schedule), with each
    /// schedule read into cron or an interval. A read over stored state; no
    /// provider API calls.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/heartbeats/suggestions
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter resourceId: Only this resource's schedule.
    public func suggestions(
        orgId: String? = nil,
        resourceId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> HeartbeatSuggestions {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/heartbeats/suggestions",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("resourceId", resourceId)]
            ),
            options: options
        )
    }

    /// Update, pause or resume a heartbeat
    ///
    /// Edit the name, schedule or grace period, or toggle `enabled`. A schedule
    /// change recomputes the deadline from the last ping. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/heartbeats/{heartbeatId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        heartbeatId: String,
        body: HeartbeatUpdate,
        options: RequestOptions? = nil
    ) async throws -> Heartbeat {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/heartbeats/{heartbeatId}",
                pathParameters: ["orgId": orgId?.parameterValue, "heartbeatId": heartbeatId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
