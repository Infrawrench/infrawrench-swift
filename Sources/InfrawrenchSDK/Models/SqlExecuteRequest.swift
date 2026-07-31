/*
 * InfrawrenchSDK v0.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SqlExecuteRequest: Codable, Hashable, Sendable {
    public var accountId: String
    public var resourceId: ResourceId?
    public var resourceTypeId: String?
    public var sql: String
    public var params: [JSONValue]?

    public init(
        accountId: String,
        resourceId: ResourceId? = nil,
        resourceTypeId: String? = nil,
        sql: String,
        params: [JSONValue]? = nil
    ) {
        self.accountId = accountId
        self.resourceId = resourceId
        self.resourceTypeId = resourceTypeId
        self.sql = sql
        self.params = params
    }
}
