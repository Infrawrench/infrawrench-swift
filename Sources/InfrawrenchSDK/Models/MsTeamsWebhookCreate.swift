/*
 * InfrawrenchSDK v1.7.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.7.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MsTeamsWebhookCreate: Codable, Hashable, Sendable {
    public var label: String
    /// The webhook URL from a Teams 'Workflows' automation. Must be https and on
    /// a Microsoft-operated host (*.api.powerautomate.com,
    /// *.api.powerplatform.com, *.logic.azure.com, *.flow.microsoft.com, or a
    /// legacy *.webhook.office.com connector).
    public var url: String

    public init(
        label: String,
        url: String
    ) {
        self.label = label
        self.url = url
    }
}
