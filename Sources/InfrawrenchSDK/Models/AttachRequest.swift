/*
 * InfrawrenchSDK v0.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AttachRequest: Codable, Hashable, Sendable {
    public var pluginId: String
    public var accountId: String
    public var sourceTypeId: String
    public var sourceResourceId: ResourceId
    public var targetTypeId: String
    public var targetResourceId: ResourceId

    public init(
        pluginId: String,
        accountId: String,
        sourceTypeId: String,
        sourceResourceId: ResourceId,
        targetTypeId: String,
        targetResourceId: ResourceId
    ) {
        self.pluginId = pluginId
        self.accountId = accountId
        self.sourceTypeId = sourceTypeId
        self.sourceResourceId = sourceResourceId
        self.targetTypeId = targetTypeId
        self.targetResourceId = targetResourceId
    }
}
