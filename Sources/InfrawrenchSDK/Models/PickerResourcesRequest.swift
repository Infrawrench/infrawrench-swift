/*
 * InfrawrenchSDK v0.6.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.6.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PickerResourcesRequest: Codable, Hashable, Sendable {
    public struct Source: Codable, Hashable, Sendable {
        public var pluginId: String
        public var resourceTypeId: String
        public var outputKey: String

        public init(
            pluginId: String,
            resourceTypeId: String,
            outputKey: String
        ) {
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
            self.outputKey = outputKey
        }
    }

    public var sources: [Source]
    public var accountId: String
    public var regionHint: String?

    public init(
        sources: [Source],
        accountId: String,
        regionHint: String? = nil
    ) {
        self.sources = sources
        self.accountId = accountId
        self.regionHint = regionHint
    }
}
