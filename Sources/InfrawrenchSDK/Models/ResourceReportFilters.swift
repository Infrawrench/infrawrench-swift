/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceReportFilters: Codable, Hashable, Sendable {
    public struct ResourceType: Codable, Hashable, Sendable {
        public var pluginId: String
        public var resourceTypeId: String

        public init(
            pluginId: String,
            resourceTypeId: String
        ) {
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
        }
    }

    /// Providers; empty does not filter.
    public var pluginIds: [String]
    public var accountIds: [String]
    /// Resource types, each with its plugin, since type ids repeat across
    /// plugins.
    public var resourceTypes: [ResourceType]
    /// Matched exactly, as synced.
    public var regions: [String]
    /// Matched ignoring case.
    public var statuses: [String]
    /// AND-ed.
    public var tags: [ResourceReportTagFilter]
    public var nameContains: String?
    /// Inclusive UTC day on the created column.
    public var createdFrom: String?
    public var createdTo: String?

    public init(
        pluginIds: [String],
        accountIds: [String],
        resourceTypes: [ResourceType],
        regions: [String],
        statuses: [String],
        tags: [ResourceReportTagFilter],
        nameContains: String? = nil,
        createdFrom: String? = nil,
        createdTo: String? = nil
    ) {
        self.pluginIds = pluginIds
        self.accountIds = accountIds
        self.resourceTypes = resourceTypes
        self.regions = regions
        self.statuses = statuses
        self.tags = tags
        self.nameContains = nameContains
        self.createdFrom = createdFrom
        self.createdTo = createdTo
    }
}
