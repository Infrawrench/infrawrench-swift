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

public struct ArtifactsListRequest: Codable, Hashable, Sendable {
    public var accountId: String
    public var resourceId: ResourceId
    public var resourceTypeId: String
    public var pageToken: String?
    public var `prefix`: String?

    public init(
        accountId: String,
        resourceId: ResourceId,
        resourceTypeId: String,
        pageToken: String? = nil,
        `prefix`: String? = nil
    ) {
        self.accountId = accountId
        self.resourceId = resourceId
        self.resourceTypeId = resourceTypeId
        self.pageToken = pageToken
        self.`prefix` = `prefix`
    }
}
