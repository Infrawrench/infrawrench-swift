/*
 * InfrawrenchSDK v1.94.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.94.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentT3PolicyApplyRequest: Codable, Hashable, Sendable {
    /// Restart T3 Code so the policy applies now (interrupts running agent
    /// turns), or leave it for the next restart.
    public var restart: Bool
    /// One server; omitted, every T3 Code server in the organization.
    public var sessionId: String?

    public init(
        restart: Bool,
        sessionId: String? = nil
    ) {
        self.restart = restart
        self.sessionId = sessionId
    }
}
