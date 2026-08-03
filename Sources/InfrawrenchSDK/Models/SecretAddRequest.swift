/*
 * InfrawrenchSDK v0.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SecretAddRequest: Codable, Hashable, Sendable {
    public var accountId: String
    public var resourceId: ResourceId
    public var value: String
    public var parentResourceId: ResourceId?

    public init(
        accountId: String,
        resourceId: ResourceId,
        value: String,
        parentResourceId: ResourceId? = nil
    ) {
        self.accountId = accountId
        self.resourceId = resourceId
        self.value = value
        self.parentResourceId = parentResourceId
    }
}
