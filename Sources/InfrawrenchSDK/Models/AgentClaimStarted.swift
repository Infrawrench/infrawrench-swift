/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AgentClaimStarted: Codable, Hashable, Sendable {
    /// Formatted as `XXXX-XXXX`. Show it to the user alongside
    /// `verification_uri`.
    public var user_code: String
    public var verification_uri: String
    /// The verification page with the code pre-filled. Convenient, but it puts a
    /// live bearer secret in a URL — prefer `verification_uri` plus the code
    /// shown separately.
    public var verification_uri_complete: String
    public var expires_at: String
    /// Minimum seconds between status polls.
    public var interval: Int

    public init(
        user_code: String,
        verification_uri: String,
        verification_uri_complete: String,
        expires_at: String,
        interval: Int
    ) {
        self.user_code = user_code
        self.verification_uri = verification_uri
        self.verification_uri_complete = verification_uri_complete
        self.expires_at = expires_at
        self.interval = interval
    }
}
