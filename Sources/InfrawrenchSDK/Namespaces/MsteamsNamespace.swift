/*
 * InfrawrenchSDK v1.10.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.10.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MsteamsTestResult: Codable, Hashable, Sendable {
    public var ok: Bool
    public var webhookCount: Int
    public var attempted: Int
    public var succeeded: Int

    public init(
        ok: Bool,
        webhookCount: Int,
        attempted: Int,
        succeeded: Int
    ) {
        self.ok = ok
        self.webhookCount = webhookCount
        self.attempted = attempted
        self.succeeded = succeeded
    }
}

/// `client.msteams`
public final class MsteamsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.msteams.webhooks`
    public let webhooks: MsteamsWebhooksNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.webhooks = MsteamsWebhooksNamespace(transport: transport)
    }

    /// List the organization's Teams channels
    ///
    /// Returns the Teams channels alerts can be routed to. Which alerts reach
    /// each one is decided by /alert-rules. Webhook URLs are never included.
    ///
    /// GET /api/org/{orgId}/msteams/status
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func status(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> MsTeamsStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/msteams/status",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Post a test card to every configured Teams channel
    ///
    /// Ignores routing rules — every channel gets the test. Fails with the error
    /// Microsoft returned when nothing could be delivered (HTTP 404 usually means
    /// the Workflow was deleted or turned off).
    ///
    /// POST /api/org/{orgId}/msteams/test
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func test(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> MsteamsTestResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/msteams/test",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.msteams.webhooks`
public final class MsteamsWebhooksNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Connect a Teams channel as an alert destination
    ///
    /// Adds a channel by webhook URL, or updates the one already holding that
    /// URL. Which alerts reach it is decided by /alert-rules — connecting a
    /// channel routes nothing to it on its own. Responds 400 when the URL is not
    /// https or its host is not Microsoft-operated.
    ///
    /// POST /api/org/{orgId}/msteams/webhooks
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: MsTeamsWebhookCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> MsTeamsWebhook {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/msteams/webhooks",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Disconnect a Teams channel
    ///
    /// DELETE /api/org/{orgId}/msteams/webhooks/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        id: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/msteams/webhooks/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Rename a Teams channel
    ///
    /// The webhook URL is immutable — remove the channel and re-add it to change
    /// it.
    ///
    /// PATCH /api/org/{orgId}/msteams/webhooks/{id}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: MsTeamsWebhookUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> MsTeamsWebhook {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/msteams/webhooks/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}
