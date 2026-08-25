/*
 * InfrawrenchSDK v1.39.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.39.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct LogsRequest: Codable, Hashable, Sendable {
    public var accountId: String
    public var resourceId: ResourceId
    public var parentResourceId: ResourceId?
    public var tailLines: Int?
    public var container: String?
    public var previous: Bool?

    public init(
        accountId: String,
        resourceId: ResourceId,
        parentResourceId: ResourceId? = nil,
        tailLines: Int? = nil,
        container: String? = nil,
        previous: Bool? = nil
    ) {
        self.accountId = accountId
        self.resourceId = resourceId
        self.parentResourceId = parentResourceId
        self.tailLines = tailLines
        self.container = container
        self.previous = previous
    }
}
