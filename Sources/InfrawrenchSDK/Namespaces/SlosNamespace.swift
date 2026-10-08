/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.slos`
public final class SlosNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.slos.get`
    public let get: SlosGetNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.get = SlosGetNamespace(transport: transport)
    }

    /// Create an SLO
    ///
    /// Out-of-range inputs are rejected, not clamped. The source must exist in
    /// the organization. The first evaluation runs within one poller tick.
    /// Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// POST /api/org/{orgId}/slos
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
        body: SloCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> Slo {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/slos",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Delete an SLO
    ///
    /// The measured series are untouched. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// DELETE /api/org/{orgId}/slos/{sloId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        sloId: String,
        options: RequestOptions? = nil
    ) async throws {
        try await transport.sendVoid(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/slos/{sloId}",
                pathParameters: ["orgId": orgId?.parameterValue, "sloId": sloId.parameterValue]
            ),
            options: options
        )
    }

    /// Start a change freeze for an SLO
    ///
    /// Acts on the freeze suggestion an exhausted budget makes: creates an
    /// ordinary change freeze named after the SLO, listed and ended like any
    /// other. Needs `freezes:write`.
    ///
    /// _Requires permission: `freezes:write`._
    ///
    /// POST /api/org/{orgId}/slos/{sloId}/freeze
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func freeze(
        orgId: String? = nil,
        sloId: String,
        body: SloFreezeRequest? = nil,
        options: RequestOptions? = nil
    ) async throws -> SloActiveFreeze? {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/slos/{sloId}/freeze",
                pathParameters: ["orgId": orgId?.parameterValue, "sloId": sloId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// List what an SLO can be measured from
    ///
    /// Every synthetic probe, and every synced resource that reported a metric
    /// series in the last week with the series it reported. Feeds the editor's
    /// pickers.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/slos/sources
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func sources(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SloSources {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/slos/sources",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update an SLO
    ///
    /// Omitted fields keep their value. Changing the source, target or window
    /// resets the snapshot and the alert state. Audit-logged.
    ///
    /// _Requires permission: `resources:write`._
    ///
    /// PUT /api/org/{orgId}/slos/{sloId}
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
        sloId: String,
        body: SloUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> Slo {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/slos/{sloId}",
                pathParameters: ["orgId": orgId?.parameterValue, "sloId": sloId.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.slos.get`
public final class SlosGetNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List SLOs
    ///
    /// Every service-level objective with its last snapshot: SLI, error budget
    /// remaining (as a fraction and in minutes) and burn rates over the alerting
    /// windows.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/slos
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SloList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/slos",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Read an SLO with its history
    ///
    /// The SLO plus hourly good/total buckets over its window (the SLI and
    /// budget-burndown charts are drawn from these) and the change freeze in
    /// effect, if any.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/slos/{sloId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func getOrgOrgIdSlosSloId(
        orgId: String? = nil,
        sloId: String,
        options: RequestOptions? = nil
    ) async throws -> SloDetail {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/slos/{sloId}",
                pathParameters: ["orgId": orgId?.parameterValue, "sloId": sloId.parameterValue]
            ),
            options: options
        )
    }
}
