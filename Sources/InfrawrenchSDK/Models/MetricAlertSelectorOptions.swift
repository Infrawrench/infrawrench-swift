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

public struct MetricAlertSelectorOptions: Codable, Hashable, Sendable {
    public struct Plugin: Codable, Hashable, Sendable {
        public var pluginId: String
        public var resourceTypeIds: [String]

        public init(
            pluginId: String,
            resourceTypeIds: [String]
        ) {
            self.pluginId = pluginId
            self.resourceTypeIds = resourceTypeIds
        }
    }

    public var plugins: [Plugin]
    /// Tag keys on the org's resources, with its tag key settings applied:
    /// preferred keys first, hidden keys omitted.
    public var tagKeys: [String]
    /// The subset of `tagKeys` the org pins, in its order.
    public var preferredTagKeys: [String]

    public init(
        plugins: [Plugin],
        tagKeys: [String],
        preferredTagKeys: [String]
    ) {
        self.plugins = plugins
        self.tagKeys = tagKeys
        self.preferredTagKeys = preferredTagKeys
    }
}
