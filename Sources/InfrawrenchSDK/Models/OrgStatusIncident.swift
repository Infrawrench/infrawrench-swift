/*
 * InfrawrenchSDK v1.23.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.23.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrgStatusIncident: Codable, Hashable, Sendable {
    /// Cached incident row id.
    public var id: String
    public var pluginId: String
    /// Provider display name, e.g. "DigitalOcean".
    public var pluginName: String
    public var title: String
    public var state: ProviderIncidentState
    public var impact: ProviderIncidentImpact
    /// Deep link to the provider's incident page or status page.
    public var url: String?
    public var startedAt: String
    public var resolvedAt: String?
    public var lastUpdateAt: String?
    /// Plain-text body of the provider's most recent update.
    public var lastUpdateText: String?
    /// Plugin-native region ids the provider reports as affected.
    public var regions: [String]
    /// Human-readable affected provider services/products.
    public var services: [String]
    /// True when the incident affects the provider as a whole.
    public var providerWide: Bool
    /// How many of the organization's resources the incident overlaps.
    public var affectedResourceCount: Int
    /// The subset of `regions` where the organization actually holds resources.
    public var affectedRegions: [String]
    /// Up to five of the overlapped resources, for display.
    public var sampleResources: [ProviderIncidentResourceSample]
    /// Change-timeline events recorded on this provider during the incident
    /// window — "these N changes happened during an incident".
    public var overlappingChangeCount: Int

    public init(
        id: String,
        pluginId: String,
        pluginName: String,
        title: String,
        state: ProviderIncidentState,
        impact: ProviderIncidentImpact,
        url: String? = nil,
        startedAt: String,
        resolvedAt: String? = nil,
        lastUpdateAt: String? = nil,
        lastUpdateText: String? = nil,
        regions: [String],
        services: [String],
        providerWide: Bool,
        affectedResourceCount: Int,
        affectedRegions: [String],
        sampleResources: [ProviderIncidentResourceSample],
        overlappingChangeCount: Int
    ) {
        self.id = id
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.title = title
        self.state = state
        self.impact = impact
        self.url = url
        self.startedAt = startedAt
        self.resolvedAt = resolvedAt
        self.lastUpdateAt = lastUpdateAt
        self.lastUpdateText = lastUpdateText
        self.regions = regions
        self.services = services
        self.providerWide = providerWide
        self.affectedResourceCount = affectedResourceCount
        self.affectedRegions = affectedRegions
        self.sampleResources = sampleResources
        self.overlappingChangeCount = overlappingChangeCount
    }
}
