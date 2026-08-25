/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OnCallOverridesGetResult: Codable, Hashable, Sendable {
    public var overrides: [OnCallOverride]

    public init(
        overrides: [OnCallOverride]
    ) {
        self.overrides = overrides
    }
}

/// `client.onCall`
public final class OnCallNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.onCall.overrides`
    public let overrides: OnCallOverridesNamespace
    /// `client.onCall.schedules`
    public let schedules: OnCallSchedulesNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.overrides = OnCallOverridesNamespace(transport: transport)
        self.schedules = OnCallSchedulesNamespace(transport: transport)
    }

    /// Who is on call right now
    ///
    /// One entry per rotation: the shift in effect, and the next person in the
    /// rotation. Takes `team:read` — knowing who is on call is something every
    /// member needs and nobody should have to ask an admin for.
    ///
    /// GET /api/org/{orgId}/on-call/now
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func now(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> OnCallNowResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/on-call/now",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.onCall.overrides`
public final class OnCallOverridesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Arrange cover
    ///
    /// A cover beats the rotation for exactly its window. Among several
    /// overlapping covers the one that **started most recently** wins, so a
    /// later-written cover supersedes an earlier one rather than the answer
    /// depending on row order.
    ///
    /// Takes `team:read`, not a settings permission: cover is arranged at 17:55
    /// on a Friday and the person handing over is rarely an org admin. Every
    /// cover is audit-logged, which is the control that makes the looser
    /// permission safe.
    ///
    /// POST /api/org/{orgId}/on-call/overrides
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: OnCallOverrideCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> OnCallOverride {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/on-call/overrides",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Cancel a cover
    ///
    /// DELETE /api/org/{orgId}/on-call/overrides/{overrideId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        overrideId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/on-call/overrides/{overrideId}",
                pathParameters: ["orgId": orgId?.parameterValue, "overrideId": overrideId.parameterValue]
            ),
            options: options
        )
    }

    /// List covers
    ///
    /// GET /api/org/{orgId}/on-call/overrides
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        scheduleId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> OnCallOverridesGetResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/on-call/overrides",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("scheduleId", scheduleId)]
            ),
            options: options
        )
    }
}

/// `client.onCall.schedules`
public final class OnCallSchedulesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Create an on-call rotation
    ///
    /// Shift boundaries are calendar-day arithmetic in the rotation's own zone,
    /// not 24-hour arithmetic: a rotation stepped in fixed milliseconds drifts an
    /// hour at each daylight-saving change until the 09:00 Monday handover
    /// happens at 08:00 — or until two people each think the other is on call.
    ///
    /// Writing takes `org:settings:write`: a rotation decides who gets woken up.
    ///
    /// POST /api/org/{orgId}/on-call/schedules
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: OnCallScheduleCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> OnCallSchedule {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/on-call/schedules",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete an on-call rotation
    ///
    /// Takes its covers with it. Routing rules naming it resolve to nobody
    /// afterwards.
    ///
    /// DELETE /api/org/{orgId}/on-call/schedules/{scheduleId}
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
                path: "/api/org/{orgId}/on-call/schedules/{scheduleId}",
                pathParameters: ["orgId": orgId?.parameterValue, "scheduleId": scheduleId.parameterValue]
            ),
            options: options
        )
    }

    /// List on-call rotations
    ///
    /// GET /api/org/{orgId}/on-call/schedules
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> OnCallScheduleList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/on-call/schedules",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Preview upcoming shifts
    ///
    /// The same computation the alert path resolves with, so a preview can never
    /// disagree with who actually gets woken up.
    ///
    /// GET /api/org/{orgId}/on-call/schedules/{scheduleId}/shifts
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func shifts(
        orgId: String? = nil,
        scheduleId: String,
        count: Int? = nil,
        options: RequestOptions? = nil
    ) async throws -> OnCallShiftsResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/on-call/schedules/{scheduleId}/shifts",
                pathParameters: ["orgId": orgId?.parameterValue, "scheduleId": scheduleId.parameterValue],
                query: [QueryParameter("count", count)]
            ),
            options: options
        )
    }

    /// Edit an on-call rotation
    ///
    /// Omitted fields are left alone, and the result is validated after merging.
    /// Sending `participantUserIds` replaces the list wholesale — position is
    /// rotation order, so reordering re-plans the future.
    ///
    /// PATCH /api/org/{orgId}/on-call/schedules/{scheduleId}
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
        scheduleId: String,
        body: OnCallScheduleUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> OnCallSchedule {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/on-call/schedules/{scheduleId}",
                pathParameters: ["orgId": orgId?.parameterValue, "scheduleId": scheduleId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
