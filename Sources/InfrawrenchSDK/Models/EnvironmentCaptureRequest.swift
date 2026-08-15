/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentCaptureRequest: Codable, Hashable, Sendable {
    public var resourceIds: [String]?
    public var accountId: String?
    public var tagKey: String?
    public var tagValue: String?

    public init(
        resourceIds: [String]? = nil,
        accountId: String? = nil,
        tagKey: String? = nil,
        tagValue: String? = nil
    ) {
        self.resourceIds = resourceIds
        self.accountId = accountId
        self.tagKey = tagKey
        self.tagValue = tagValue
    }
}
