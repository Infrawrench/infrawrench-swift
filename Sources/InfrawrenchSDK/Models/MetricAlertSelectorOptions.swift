/*
 * InfrawrenchSDK v0.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.38.0).
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
    public var tagKeys: [String]

    public init(
        plugins: [Plugin],
        tagKeys: [String]
    ) {
        self.plugins = plugins
        self.tagKeys = tagKeys
    }
}
