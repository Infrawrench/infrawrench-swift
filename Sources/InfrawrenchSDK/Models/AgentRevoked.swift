/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentRevoked: Codable, Hashable, Sendable {
    public var ok: Bool
    /// False when the registration was already revoked. The request still
    /// succeeds — revocation is idempotent — but nothing changed.
    public var revoked: Bool

    public init(
        ok: Bool,
        revoked: Bool
    ) {
        self.ok = ok
        self.revoked = revoked
    }
}
