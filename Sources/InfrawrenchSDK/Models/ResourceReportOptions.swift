/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceReportOptions: Codable, Hashable, Sendable {
    public struct Provider: Codable, Hashable, Sendable {
        public var value: String
        public var label: String
        public var count: Int

        public init(
            value: String,
            label: String,
            count: Int
        ) {
            self.value = value
            self.label = label
            self.count = count
        }
    }

    public struct Account2: Codable, Hashable, Sendable {
        public var value: String
        public var label: String
        public var count: Int
        public var pluginId: String

        public init(
            value: String,
            label: String,
            count: Int,
            pluginId: String
        ) {
            self.value = value
            self.label = label
            self.count = count
            self.pluginId = pluginId
        }
    }

    public struct ResourceType: Codable, Hashable, Sendable {
        public var pluginId: String
        public var resourceTypeId: String
        public var label: String
        public var count: Int

        public init(
            pluginId: String,
            resourceTypeId: String,
            label: String,
            count: Int
        ) {
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.label = label
            self.count = count
        }
    }

    public struct Region: Codable, Hashable, Sendable {
        public var value: String
        public var label: String
        public var count: Int

        public init(
            value: String,
            label: String,
            count: Int
        ) {
            self.value = value
            self.label = label
            self.count = count
        }
    }

    public struct Statuse: Codable, Hashable, Sendable {
        public var value: String
        public var label: String
        public var count: Int

        public init(
            value: String,
            label: String,
            count: Int
        ) {
            self.value = value
            self.label = label
            self.count = count
        }
    }

    public struct Field: Codable, Hashable, Sendable {
        public var key: String
        public var label: String
        public var count: Int
        /// Declared by a resource type, not only seen on synced resources.
        public var declared: Bool

        public init(
            key: String,
            label: String,
            count: Int,
            declared: Bool
        ) {
            self.key = key
            self.label = label
            self.count = count
            self.declared = declared
        }
    }

    public var providers: [Provider]
    public var accounts: [Account2]
    public var resourceTypes: [ResourceType]
    public var regions: [Region]
    public var statuses: [Statuse]
    /// Metadata fields the requested resource types expose.
    public var fields: [Field]
    public var tagKeys: [String]
    public var preferredTagKeys: [String]
    /// Empty without `costs:read`.
    public var virtualTagKeys: [String]
    public var costAvailable: Bool

    public init(
        providers: [Provider],
        accounts: [Account2],
        resourceTypes: [ResourceType],
        regions: [Region],
        statuses: [Statuse],
        fields: [Field],
        tagKeys: [String],
        preferredTagKeys: [String],
        virtualTagKeys: [String],
        costAvailable: Bool
    ) {
        self.providers = providers
        self.accounts = accounts
        self.resourceTypes = resourceTypes
        self.regions = regions
        self.statuses = statuses
        self.fields = fields
        self.tagKeys = tagKeys
        self.preferredTagKeys = preferredTagKeys
        self.virtualTagKeys = virtualTagKeys
        self.costAvailable = costAvailable
    }
}
