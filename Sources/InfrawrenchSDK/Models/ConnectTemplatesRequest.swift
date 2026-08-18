/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ConnectTemplatesRequest: Codable, Hashable, Sendable {
    public var sourcePluginId: String
    public var sourceResourceTypeId: String
    public var targetAccountId: String
    public var targetPluginId: String

    public init(
        sourcePluginId: String,
        sourceResourceTypeId: String,
        targetAccountId: String,
        targetPluginId: String
    ) {
        self.sourcePluginId = sourcePluginId
        self.sourceResourceTypeId = sourceResourceTypeId
        self.targetAccountId = targetAccountId
        self.targetPluginId = targetPluginId
    }
}
