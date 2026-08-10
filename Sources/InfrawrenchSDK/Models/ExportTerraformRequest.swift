/*
 * InfrawrenchSDK v1.6.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.6.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ExportTerraformRequest: Codable, Hashable, Sendable {
    public var resourceId: ResourceId
    public var accountId: String

    public init(
        resourceId: ResourceId,
        accountId: String
    ) {
        self.resourceId = resourceId
        self.accountId = accountId
    }
}
