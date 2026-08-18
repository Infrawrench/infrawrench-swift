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

public struct ReportDeliveryTargets: Codable, Hashable, Sendable {
    public var slackChannels: [ReportDeliveryTargetOption]
    public var teamsWebhooks: [ReportDeliveryTargetOption]
    /// Whether this deployment can send mail at all. Addresses can be saved
    /// regardless, but they deliver nowhere until a mail provider is configured.
    public var emailAvailable: Bool

    public init(
        slackChannels: [ReportDeliveryTargetOption],
        teamsWebhooks: [ReportDeliveryTargetOption],
        emailAvailable: Bool
    ) {
        self.slackChannels = slackChannels
        self.teamsWebhooks = teamsWebhooks
        self.emailAvailable = emailAvailable
    }
}
