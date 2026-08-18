/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RegisteredAgent: Codable, Hashable, Sendable {
    public var registration_id: String
    /// Bearer credential for this registration. Format `iwa_<base64url>`.
    /// Returned once and never recoverable — there is no route that can show it
    /// again.
    public var credential: String
    public var organization_id: String
    /// When the trial workspace is deleted unless a person claims it.
    public var trial_expires_at: String
    public var claim_url: String
    /// Human-readable summary of the trial terms, meant to be relayed to the
    /// user.
    public var notice: String

    public init(
        registration_id: String,
        credential: String,
        organization_id: String,
        trial_expires_at: String,
        claim_url: String,
        notice: String
    ) {
        self.registration_id = registration_id
        self.credential = credential
        self.organization_id = organization_id
        self.trial_expires_at = trial_expires_at
        self.claim_url = claim_url
        self.notice = notice
    }
}
