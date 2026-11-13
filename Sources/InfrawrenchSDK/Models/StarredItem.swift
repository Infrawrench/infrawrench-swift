/*
 * InfrawrenchSDK v1.106.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.106.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct StarredItem: Codable, Hashable, Sendable {
    public var id: ResourceId
    /// The provider plugin; `__workflows__` for workflows, `__objects__` for
    /// saved objects.
    public var pluginId: String
    public var pluginDisplayName: String
    /// Inline SVG markup; empty for saved objects.
    public var pluginLogoSvg: String
    /// The resource type; `__workflow__` for workflows, the kind for saved
    /// objects.
    public var resourceTypeId: String
    public var resourceTypeLabel: String
    public var accountId: String
    public var accountName: String
    public var displayName: String
    public var subtitle: String?
    public var kind: SearchResultKind
    public var starredAt: String

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
        subtitle: String? = nil,
        kind: SearchResultKind,
        starredAt: String
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
        self.kind = kind
        self.starredAt = starredAt
    }
}
