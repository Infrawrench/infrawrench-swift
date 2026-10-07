/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PagingProviderSettings: Codable, Hashable, Sendable {
    /// Mirror this account's incidents into Infrawrench.
    public var inboundEnabled: Bool
    /// A webhook (subscribed by Infrawrench, or a pasted signing secret) is in
    /// place.
    public var webhookConfigured: Bool
    /// The URL a manually configured webhook must point at. Null until inbound is
    /// enabled, or when the deployment has no public URL.
    public var webhookUrl: String?
    public var lastSyncedAt: String?
    public var lastSyncError: String?

    public init(
        inboundEnabled: Bool,
        webhookConfigured: Bool,
        webhookUrl: String? = nil,
        lastSyncedAt: String? = nil,
        lastSyncError: String? = nil
    ) {
        self.inboundEnabled = inboundEnabled
        self.webhookConfigured = webhookConfigured
        self.webhookUrl = webhookUrl
        self.lastSyncedAt = lastSyncedAt
        self.lastSyncError = lastSyncError
    }
}
