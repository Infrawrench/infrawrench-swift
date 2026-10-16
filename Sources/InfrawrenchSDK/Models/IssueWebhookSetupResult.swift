/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IssueWebhookSetupResult: Codable, Hashable, Sendable {
    public var webhook: IssueWebhookState
    /// Jira manual mode only: the signing secret to paste into Jira's webhook
    /// form. Returned this once; it is stored encrypted and never read back.
    public var secret: String?
    /// Why automatic registration fell back to manual.
    public var fallbackReason: String?

    public init(
        webhook: IssueWebhookState,
        secret: String? = nil,
        fallbackReason: String? = nil
    ) {
        self.webhook = webhook
        self.secret = secret
        self.fallbackReason = fallbackReason
    }
}
