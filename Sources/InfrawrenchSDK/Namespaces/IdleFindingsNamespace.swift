/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IdleFindingsRescanResult: Codable, Hashable, Sendable {
    public var ok: Bool

    public init(
        ok: Bool
    ) {
        self.ok = ok
    }
}

/// `client.idleFindings`
public final class IdleFindingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.idleFindings.settings`
    public let settings: IdleFindingsSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = IdleFindingsSettingsNamespace(transport: transport)
    }

    /// Idle rules, their settings and collection status
    ///
    /// Every metric-based idle rule the loaded plugins declare (idle NAT
    /// gateways, load balancers, caches, provisioned tables, clusters, unused
    /// custom metrics), with the organization's effective thresholds, plus each
    /// account's last collection and error. The findings themselves are rows of
    /// `GET /orphans` with `idle` set.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/idle-findings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> IdleFindingsOverview {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/idle-findings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Re-scan idle rules now
    ///
    /// Makes every account due for an idle collection on the next poller tick.
    /// The reads are billed to the organization's own cloud accounts (CloudWatch
    /// GetMetricData and the like).
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// POST /api/org/{orgId}/idle-findings/rescan
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func rescan(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> IdleFindingsRescanResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/idle-findings/rescan",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.idleFindings.settings`
public final class IdleFindingsSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the organization's idle-rule settings
    ///
    /// An organization that never saved reads the shipped defaults (enabled, 14
    /// days).
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/idle-findings/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> IdleFindingSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/idle-findings/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the idle-rule settings
    ///
    /// Every field is optional. `lookbackDays` must be a whole number from 7 to
    /// 42; an unknown rule or threshold key, or a threshold outside its declared
    /// range, is rejected rather than clamped. Any change makes every account due
    /// for a fresh collection.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/idle-findings/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: IdleFindingSettingsUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> IdleFindingSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/idle-findings/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
