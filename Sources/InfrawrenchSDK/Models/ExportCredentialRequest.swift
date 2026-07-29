/*
 * InfrawrenchSDK v0.14.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.14.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExportCredentialRequest: Codable, Hashable, Sendable {
    public var resourceId: ResourceId
    public var accountId: String
    public var formatId: String
    public var parentResourceId: ResourceId?

    public init(
        resourceId: ResourceId,
        accountId: String,
        formatId: String,
        parentResourceId: ResourceId? = nil
    ) {
        self.resourceId = resourceId
        self.accountId = accountId
        self.formatId = formatId
        self.parentResourceId = parentResourceId
    }
}
