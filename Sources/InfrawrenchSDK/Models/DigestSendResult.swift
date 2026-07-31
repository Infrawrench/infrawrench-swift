/*
 * InfrawrenchSDK v0.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.22.0).
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
    /// Deliveries attempted across Slack channels and Teams webhooks.
    public var attempted: Int
    public var succeeded: Int

    public init(
        ok: Bool,
        attempted: Int,
        succeeded: Int
    ) {
        self.ok = ok
        self.attempted = attempted
        self.succeeded = succeeded
    }
}
