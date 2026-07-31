/*
 * InfrawrenchSDK v0.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DependencyGraphNode: Codable, Hashable, Sendable {
    public var id: ResourceId
    public var displayName: String
    public var pluginId: String
    public var pluginDisplayName: String
    /// Inline SVG markup; may be empty.
    public var pluginLogoSvg: String
    public var resourceTypeId: String
    public var resourceTypeLabel: String
    public var accountId: String
    public var accountName: String

    public init(
        id: ResourceId,
        displayName: String,
        pluginId: String,
        pluginDisplayName: String,
        pluginLogoSvg: String,
        resourceTypeId: String,
        resourceTypeLabel: String,
        accountId: String,
        accountName: String
    ) {
        self.id = id
        self.displayName = displayName
        self.pluginId = pluginId
        self.pluginDisplayName = pluginDisplayName
        self.pluginLogoSvg = pluginLogoSvg
        self.resourceTypeId = resourceTypeId
        self.resourceTypeLabel = resourceTypeLabel
        self.accountId = accountId
        self.accountName = accountName
    }
}
