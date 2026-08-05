/*
 * InfrawrenchSDK v0.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DigestRecipientsDeleteResult: Codable, Hashable, Sendable {
    public var ok: Bool

    public init(
        ok: Bool
    ) {
        self.ok = ok
    }
}

/// `client.digest`
public final class DigestNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.digest.recipients`
    public let recipients: DigestRecipientsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.recipients = DigestRecipientsNamespace(transport: transport)
    }

    /// Get the organization's weekly digest settings
    ///
    /// The weekly digest is a summary of the last complete Monday-to-Sunday
    /// week's spend (with week-over-week movers), sync incidents, and resource
    /// churn, delivered to the Slack channels and Teams webhooks opted into the
    /// weeklyDigest trigger and to the organization's digest email recipients.
    /// The response also carries the outcome of the most recent delivery attempt
    /// so a silently failing digest is visible.
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
    /// last complete week and sends it to every opted-in channel and email
    /// recipient. This is also the manual recovery for a partial delivery, which
    /// is never retried automatically. Fails when nothing is routed to receive
    /// the digest, or when every destination rejected it.
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

    /// Update the weekly digest settings
    ///
    /// Every field is optional. Enabling schedules the first digest for the next
    /// configured send time rather than sending immediately — use POST
    /// /digest/send for an immediate one. The week boundary follows `timezone`,
    /// so the reported window is always the organization's own local
    /// Monday-to-Sunday week. Changing the schedule clears any parked failure
    /// state but never replays a week that already went out.
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

/// `client.digest.recipients`
public final class DigestRecipientsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Add a digest email recipient
    ///
    /// Adding an address the organization already has is a no-op that returns the
    /// existing entry, so a double submit cannot double-deliver.
    ///
    /// POST /api/org/{orgId}/digest/recipients
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: DigestEmailRecipientCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> DigestEmailRecipient {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/digest/recipients",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Remove a digest email recipient
    ///
    /// DELETE /api/org/{orgId}/digest/recipients/{recipientId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter recipientId: Recipient id.
    public func delete(
        orgId: String? = nil,
        recipientId: String,
        options: RequestOptions? = nil
    ) async throws -> DigestRecipientsDeleteResult {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/digest/recipients/{recipientId}",
                pathParameters: ["orgId": orgId?.parameterValue, "recipientId": recipientId.parameterValue]
            ),
            options: options
        )
    }

    /// List the organization's digest email recipients
    ///
    /// Email is a digest-only transport, so its destinations are an
    /// organization-level address list rather than a per-channel trigger.
    /// Addresses need not belong to Infrawrench users — a finance alias is a
    /// valid recipient.
    ///
    /// GET /api/org/{orgId}/digest/recipients
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> DigestEmailRecipientList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/digest/recipients",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}
