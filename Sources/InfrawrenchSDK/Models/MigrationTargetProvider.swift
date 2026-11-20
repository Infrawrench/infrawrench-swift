/*
 * InfrawrenchSDK v1.123.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.123.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MigrationTargetProvider: Codable, Hashable, Sendable {
    public struct Region: Codable, Hashable, Sendable {
        public var id: String
        public var label: String
        public var area: MigrationArea?

        public init(
            id: String,
            label: String,
            area: MigrationArea? = nil
        ) {
            self.id = id
            self.label = label
            self.area = area
        }
    }

    public var pluginId: PluginId
    public var pluginName: String
    public var categories: [MigrationCategory]
    public var regions: [Region]
    public var priceCatalog: Bool
    /// Pricing on this provider needs one of the org's accounts on it.
    public var needsAccount: Bool
    public var hasAccount: Bool
    public var terraform: Bool

    public init(
        pluginId: PluginId,
        pluginName: String,
        categories: [MigrationCategory],
        regions: [Region],
        priceCatalog: Bool,
        needsAccount: Bool,
        hasAccount: Bool,
        terraform: Bool
    ) {
        self.pluginId = pluginId
        self.pluginName = pluginName
        self.categories = categories
        self.regions = regions
        self.priceCatalog = priceCatalog
        self.needsAccount = needsAccount
        self.hasAccount = hasAccount
        self.terraform = terraform
    }
}
