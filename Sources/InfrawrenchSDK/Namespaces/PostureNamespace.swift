/*
 * InfrawrenchSDK v0.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.posture`
public final class PostureNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.posture.settings`
    public let settings: PostureSettingsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.settings = PostureSettingsNamespace(transport: transport)
    }

    /// List security posture findings on synced resources
    ///
    /// Plugin-declared security checks evaluated over already-synced resource
    /// state: public buckets, 0.0.0.0/0 ingress rules, unencrypted disks,
    /// publicly reachable database endpoints, stale credentials, missing
    /// deletion/backup protection. No provider API calls are made and results
    /// reflect the last sync. Findings are sorted worst severity first, with
    /// per-severity counts.
    ///
    /// _Requires permission: `resources:read`._
    ///
    /// GET /api/org/{orgId}/posture
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PostureListResponse {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/posture",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.posture.settings`
public final class PostureSettingsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the organization's posture alert settings
    ///
    /// Whether the poller's daily posture alert scan is enabled. An organization
    /// that never saved reads the shipped defaults (enabled).
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// GET /api/org/{orgId}/posture/settings
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PostureAlertSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/posture/settings",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Update the posture alert settings
    ///
    /// Saving never resets the alert cooldown.
    ///
    /// _Requires permission: `org:settings:write`._
    ///
    /// PUT /api/org/{orgId}/posture/settings
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: PostureAlertSettingsUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> PostureAlertSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/posture/settings",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
