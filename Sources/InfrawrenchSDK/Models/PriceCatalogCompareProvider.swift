/*
 * InfrawrenchSDK v1.52.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.52.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PriceCatalogCompareProvider: Codable, Hashable, Sendable {
    public var pluginId: PluginId
    public var pluginName: String
    public var region: String?
    public var regionLabel: String?
    public var state: PriceCatalogProviderState
    public var error: String?
    public var best: PriceCatalogRow?
    public var alternatives: [PriceCatalogRow]

    public init(
        pluginId: PluginId,
        pluginName: String,
        region: String? = nil,
        regionLabel: String? = nil,
        state: PriceCatalogProviderState,
        error: String? = nil,
        best: PriceCatalogRow? = nil,
        alternatives: [PriceCatalogRow]
    ) {
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.region = region
        self.regionLabel = regionLabel
        self.state = state
        self.error = error
        self.best = best
        self.alternatives = alternatives
    }
}
