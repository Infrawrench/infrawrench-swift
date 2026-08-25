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

public struct AgentIdentity: Codable, Hashable, Sendable {
    public var registration_id: String
    public var organization_id: String
    public var claimed: Bool
    /// A `user_code` is currently outstanding.
    public var claim_pending: Bool
    /// Milliseconds until deletion. Null once the workspace is claimed.
    public var trial_expires_in_ms: Int?

    public init(
        registration_id: String,
        organization_id: String,
        claimed: Bool,
        claim_pending: Bool,
        trial_expires_in_ms: Int? = nil
    ) {
        self.registration_id = registration_id
        self.organization_id = organization_id
        self.claimed = claimed
        self.claim_pending = claim_pending
        self.trial_expires_in_ms = trial_expires_in_ms
    }
}
