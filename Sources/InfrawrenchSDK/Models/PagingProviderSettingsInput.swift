/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PagingProviderSettingsInput: Codable, Hashable, Sendable {
    public var inboundEnabled: Bool
    /// For a `manual` webhook only: the signing secret copied from the provider.
    /// `null` forgets it; omit to keep the stored one. Never returned.
    public var webhookSecret: String?

    public init(
        inboundEnabled: Bool,
        webhookSecret: String? = nil
    ) {
        self.inboundEnabled = inboundEnabled
        self.webhookSecret = webhookSecret
    }
}
