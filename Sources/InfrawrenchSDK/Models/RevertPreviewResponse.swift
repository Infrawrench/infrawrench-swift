/*
 * InfrawrenchSDK v1.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RevertPreviewResponse: Codable, Hashable, Sendable {
    public var changeId: String
    public var resourceId: ResourceId
    public var displayName: String
    public var pluginId: String
    public var resourceTypeId: String
    public var accountId: String
    public var plan: RevertPlan
    public var revertedAt: String?

    public init(
        changeId: String,
        resourceId: ResourceId,
        displayName: String,
        pluginId: String,
        resourceTypeId: String,
        accountId: String,
        plan: RevertPlan,
        revertedAt: String? = nil
    ) {
        self.changeId = changeId
        self.resourceId = resourceId
        self.displayName = displayName
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.plan = plan
        self.revertedAt = revertedAt
    }
}
