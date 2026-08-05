/*
 * InfrawrenchSDK v0.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SearchHit: Codable, Hashable, Sendable {
    public var id: ResourceId
    public var pluginId: String
    public var pluginDisplayName: String
    public var pluginLogoSvg: String
    public var resourceTypeId: String
    public var resourceTypeLabel: String
    public var accountId: String
    public var accountName: String
    public var displayName: String
    public var subtitle: String?

    public init(
        id: ResourceId,
        pluginId: String,
        pluginDisplayName: String,
        pluginLogoSvg: String,
        resourceTypeId: String,
        resourceTypeLabel: String,
        accountId: String,
        accountName: String,
        displayName: String,
        subtitle: String? = nil
    ) {
        self.id = id
        self.pluginId = pluginId
        self.pluginDisplayName = pluginDisplayName
        self.pluginLogoSvg = pluginLogoSvg
        self.resourceTypeId = resourceTypeId
        self.resourceTypeLabel = resourceTypeLabel
        self.accountId = accountId
        self.accountName = accountName
        self.displayName = displayName
        self.subtitle = subtitle
    }
}
