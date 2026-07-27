/*
 * InfrawrenchSDK v0.5.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.5.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SlackInstallUrlResult: Codable, Hashable, Sendable {
    public var url: String

    public init(
        url: String
    ) {
        self.url = url
    }
}

public struct SlackTestResult: Codable, Hashable, Sendable {
    public var ok: Bool
    public var channelCount: Int
    public var attempted: Int
    public var succeeded: Int

    public init(
        ok: Bool,
        channelCount: Int,
        attempted: Int,
        succeeded: Int
    ) {
        self.ok = ok
        self.channelCount = channelCount
        self.attempted = attempted
        self.succeeded = succeeded
    }
}

public struct SlackInstallationsAvailableChannelsResult: Codable, Hashable, Sendable {
    public var channels: [SlackAvailableChannel]

    public init(
        channels: [SlackAvailableChannel]
    ) {
        self.channels = channels
    }
}

/// `client.slack`
public final class SlackNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.slack.channels`
    public let channels: SlackChannelsNamespace
    /// `client.slack.installations`
    public let installations: SlackInstallationsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.channels = SlackChannelsNamespace(transport: transport)
        self.installations = SlackInstallationsNamespace(transport: transport)
    }

    /// Get the Add to Slack URL
    ///
    /// Returns a slack.com/oauth/v2/authorize URL carrying a signed `state` that
    /// binds the resulting install to this organization. Send the user's browser
    /// there; Slack redirects back to /api/slack/oauth/callback.
    ///
    /// GET /api/org/{orgId}/slack/install-url
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func installUrl(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SlackInstallUrlResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/slack/install-url",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Get the organization's Slack connection
    ///
    /// Reports whether the server has a Slack app registered, which workspaces
    /// this organization has connected, and which channels alerts are routed to.
    ///
    /// GET /api/org/{orgId}/slack/status
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func status(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SlackStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/slack/status",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// Post a test message to every configured channel
    ///
    /// Ignores trigger opt-ins — every channel gets the test. Fails with the
    /// Slack error when nothing could be delivered (`not_in_channel` means the
    /// bot needs inviting to a private channel).
    ///
    /// POST /api/org/{orgId}/slack/test
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func test(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> SlackTestResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/slack/test",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }
}

/// `client.slack.channels`
public final class SlackChannelsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Route alerts to a Slack channel
    ///
    /// Adds a channel, or updates the trigger opt-ins of one already added. Each
    /// trigger defaults to enabled.
    ///
    /// POST /api/org/{orgId}/slack/channels
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: SlackChannelCreate? = nil,
        options: RequestOptions? = nil
    ) async throws -> SlackChannel {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/slack/channels",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }

    /// Stop routing alerts to a channel
    ///
    /// DELETE /api/org/{orgId}/slack/channels/{id}
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
                path: "/api/org/{orgId}/slack/channels/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue]
            ),
            options: options
        )
    }

    /// Change which alerts a channel receives
    ///
    /// PATCH /api/org/{orgId}/slack/channels/{id}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func update(
        orgId: String? = nil,
        id: String,
        body: SlackChannelUpdate? = nil,
        options: RequestOptions? = nil
    ) async throws -> SlackChannel {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/slack/channels/{id}",
                pathParameters: ["orgId": orgId?.parameterValue, "id": id.parameterValue],
                body: body.map { AnyEncodable($0) }
            ),
            options: options
        )
    }
}

/// `client.slack.installations`
public final class SlackInstallationsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// List channels the connected workspace can see
    ///
    /// Live call to Slack's conversations.list, for populating a channel picker.
    /// Returns non-archived public and private channels visible to the bot.
    ///
    /// GET
    /// /api/org/{orgId}/slack/installations/{installationId}/available-channels
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func availableChannels(
        orgId: String? = nil,
        installationId: String,
        options: RequestOptions? = nil
    ) async throws -> SlackInstallationsAvailableChannelsResult {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/slack/installations/{installationId}/available-channels",
                pathParameters: ["orgId": orgId?.parameterValue, "installationId": installationId.parameterValue]
            ),
            options: options
        )
    }

    /// Disconnect a Slack workspace
    ///
    /// Stops all delivery to this workspace. The channel routing is retained, so
    /// re-installing restores it.
    ///
    /// DELETE /api/org/{orgId}/slack/installations/{installationId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func delete(
        orgId: String? = nil,
        installationId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/slack/installations/{installationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "installationId": installationId.parameterValue]
            ),
            options: options
        )
    }
}
