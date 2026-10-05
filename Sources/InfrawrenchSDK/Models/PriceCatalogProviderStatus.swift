/*
 * InfrawrenchSDK v1.68.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.68.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PriceCatalogProviderStatus: Codable, Hashable, Sendable {
    public struct Source: Codable, Hashable, Sendable {
        public var name: String
        public var url: String

        public init(
            name: String,
            url: String
        ) {
            self.name = name
            self.url = url
        }
    }

    public struct Service: Codable, Hashable, Sendable {
        public var id: String
        public var label: String
        public var family: PriceCatalogProductFamily

        public init(
            id: String,
            label: String,
            family: PriceCatalogProductFamily
        ) {
            self.id = id
            self.label = label
            self.family = family
        }
    }

    public struct Region: Codable, Hashable, Sendable {
        public var id: String
        public var label: String
        public var area: PriceCatalogArea

        public init(
            id: String,
            label: String,
            area: PriceCatalogArea
        ) {
            self.id = id
            self.label = label
            self.area = area
        }
    }

    public var pluginId: PluginId
    public var pluginName: String
    public var requiresCredentials: Bool
    public var permission: String?
    public var source: Source
    public var refreshHours: Double
    public var services: [Service]
    public var regions: [Region]
    public var state: PriceCatalogProviderState
    public var region: String?
    public var error: String?
    public var fetchedAt: String?
    public var truncated: Bool

    public init(
        pluginId: PluginId,
        pluginName: String,
        requiresCredentials: Bool,
        permission: String? = nil,
        source: Source,
        refreshHours: Double,
        services: [Service],
        regions: [Region],
        state: PriceCatalogProviderState,
        region: String? = nil,
        error: String? = nil,
        fetchedAt: String? = nil,
        truncated: Bool
    ) {
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.requiresCredentials = requiresCredentials
        self.permission = permission
        self.source = source
        self.refreshHours = refreshHours
        self.services = services
        self.regions = regions
        self.state = state
        self.region = region
        self.error = error
        self.fetchedAt = fetchedAt
        self.truncated = truncated
    }
}
