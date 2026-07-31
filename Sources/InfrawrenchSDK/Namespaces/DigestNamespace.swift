/*
 * InfrawrenchSDK v0.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.digest`
public final class DigestNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Get the organization's weekly digest settings
    ///
    /// The weekly digest is a Monday-morning summary of last week's spend (with
    /// week-over-week movers), sync incidents, and resource churn, delivered to
    /// the Slack channels and Teams webhooks opted into the weeklyDigest trigger.
    ///
    /// GET /api/org/{orgId}/digest
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> DigestSettings {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/digest",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Compose and send last week's digest now
    ///
    /// Ignores the schedule and the enabled flag — composes the digest for the
    /// last complete week and posts it to every opted-in channel. Fails when no
    /// Slack channel or Teams webhook has the weeklyDigest trigger on.
    ///
    /// POST /api/org/{orgId}/digest/send
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func send(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> DigestSendResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/digest/send",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Enable or disable the weekly digest
    ///
    /// Enabling schedules the first digest for next Monday morning (07:00 UTC)
    /// rather than sending immediately — use POST /digest/send for an immediate
    /// one.
    ///
    /// PUT /api/org/{orgId}/digest
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        body: DigestSettingsUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> DigestSettings {
        return try await transport.send(
            RequestSpec(
                method: "PUT",
                path: "/api/org/{orgId}/digest",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
