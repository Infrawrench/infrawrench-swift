/*
 * InfrawrenchSDK v1.31.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.31.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DigestSendResult: Codable, Hashable, Sendable {
    public var ok: Bool
    /// Deliveries attempted across Slack channels, Teams webhooks and email
    /// recipients.
    public var attempted: Int
    public var succeeded: Int
    public var slack: DigestTransportResult
    public var teams: DigestTransportResult
    public var email: DigestTransportResult

    public init(
        ok: Bool,
        attempted: Int,
        succeeded: Int,
        slack: DigestTransportResult,
        teams: DigestTransportResult,
        email: DigestTransportResult
    ) {
        self.ok = ok
        self.attempted = attempted
        self.succeeded = succeeded
        self.slack = slack
        self.teams = teams
        self.email = email
    }
}
