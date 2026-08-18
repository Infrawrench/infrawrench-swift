/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreateSharedConsole: Codable, Hashable, Sendable {
    /// The pty to share, as the terminal's WebSocket reported it in its
    /// `ssh:connected` frame. Everything else about the session — host, account,
    /// recording — is read from the proxy's own registration rather than from
    /// this body.
    public var liveConsoleId: String
    public var routingKey: String
    /// Defaults to true.
    public var allowHandover: Bool?
    /// Defaults to 15.
    public var inviteTtlMinutes: Int?

    public init(
        liveConsoleId: String,
        routingKey: String,
        allowHandover: Bool? = nil,
        inviteTtlMinutes: Int? = nil
    ) {
        self.liveConsoleId = liveConsoleId
        self.routingKey = routingKey
        self.allowHandover = allowHandover
        self.inviteTtlMinutes = inviteTtlMinutes
    }
}
