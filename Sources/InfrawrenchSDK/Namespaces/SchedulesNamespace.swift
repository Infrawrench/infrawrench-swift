/*
 * InfrawrenchSDK v0.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.schedules`
public final class SchedulesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create a sleep/wake schedule
    ///
    /// Attach an off-at/on-at weekly window to a resource. The resource's type
    /// must declare lifecycle start/stop actions (see the resource type
    /// metadata); one schedule per resource. Times are wall-clock in the given
    /// IANA timezone and remain correct across DST. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/schedules
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: The resource already has a schedule
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: SleepScheduleCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> SleepSchedule {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/schedules",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete a schedule
    ///
    /// Remove the schedule. The resource is left in whatever state it is in.
    /// Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/schedules/{scheduleId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        scheduleId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/schedules/{scheduleId}",
                pathParameters: ["orgId": orgId?.parameterValue, "scheduleId": scheduleId.parameterValue]
            ),
            options: options
        )
    }

    /// List sleep/wake schedules
    ///
    /// Every schedule in the organization with its next transition, last run
    /// outcome and a projected monthly saving computed from trailing per-resource
    /// spend and the weekly off-hours fraction. Schedules attach to resources
    /// whose plugin declares lifecycle start/stop actions; the poller executes
    /// due transitions server-side.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/schedules
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SleepScheduleList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/schedules",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Preview a schedule's projected saving
    ///
    /// Quote a timing against a resource before saving: the weekly off-hours
    /// fraction, the resource's trailing spend normalized to a month, the
    /// projected monthly saving, and the next few transitions. Makes no provider
    /// API calls and changes nothing.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// POST /api/org/{orgId}/schedules/preview
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func preview(
        orgId: String? = nil,
        body: SleepSchedulePreviewRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> SleepSchedulePreview {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/schedules/preview",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Update or pause a schedule
    ///
    /// Edit the timing and/or toggle `paused`. Any change recomputes the next
    /// transition; pausing clears it. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/schedules/{scheduleId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        scheduleId: String,
        body: SleepScheduleUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> SleepSchedule {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/schedules/{scheduleId}",
                pathParameters: ["orgId": orgId?.parameterValue, "scheduleId": scheduleId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
