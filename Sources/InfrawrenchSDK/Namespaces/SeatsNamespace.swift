/*
 * InfrawrenchSDK v1.81.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.81.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SeatsRefreshResult: Codable, Hashable, Sendable {
    public var queued: Int

    public init(
        queued: Int
    ) {
        self.queued = queued
    }
}

/// `client.seats`
public final class SeatsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.seats.settings`
    public let settings: SeatsSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = SeatsSettingsNamespace(transport: transport)
    }

    /// List paid SaaS seats and seat savings findings
    ///
    /// Every paid seat the organization's connected accounts report (Copilot,
    /// Cursor, GitLab, Okta and others), collected daily, with three findings:
    /// inactive for the organization's threshold, the same person (by email)
    /// paying for two tools in one category, and a cheaper tier the member's
    /// usage fits. Each finding carries remediation commands.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/seats
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SeatListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/seats",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Re-collect seats now
    ///
    /// Makes every seat-capable account due; the poller collects within minutes.
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// POST /api/org/{orgId}/seats/refresh
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func refresh(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SeatsRefreshResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/seats/refresh",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Remove a flagged seat
    ///
    /// Removes a seat currently flagged inactive or duplicated through the
    /// provider's API and records the realized saving. Refused (409) for a seat
    /// that is not a finding. Blocked by an active change freeze (423).
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/seats/{seatId}/remove
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func remove(
        orgId: String? = nil,
        seatId: String,
        options: RequestOptions? = nil
    ) async throws -> SeatRemovalResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/seats/{seatId}/remove",
                pathParameters: ["orgId": orgId?.parameterValue, "seatId": seatId.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.seats.settings`
public final class SeatsSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the seat settings
    ///
    /// _Requires permission: `costs:read`._
    ///
    /// GET /api/org/{orgId}/seats/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SeatSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/seats/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the seat settings
    ///
    /// `inactiveDays` must be a whole number from 7 to 365; it is rejected, not
    /// clamped.
    ///
    /// _Requires permission: `costs:write`._
    ///
    /// PUT /api/org/{orgId}/seats/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: SeatSettings? = nil,
        options: RequestOptions? = nil
    ) async throws -> SeatSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/seats/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
