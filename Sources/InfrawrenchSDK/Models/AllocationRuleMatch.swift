/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// All set fields must match (AND). A rule with no fields is a catch-all that
/// claims everything reaching it.
public struct AllocationRuleMatch: Codable, Hashable, Sendable {
    public var tagKey: String?
    /// Only meaningful with tagKey; alone, tagKey matches rows carrying the key.
    public var tagValue: String?
    public var accountId: String?
    public var pluginId: String?
    public var service: String?

    public init(
        tagKey: String? = nil,
        tagValue: String? = nil,
        accountId: String? = nil,
        pluginId: String? = nil,
        service: String? = nil
    ) {
        self.tagKey = tagKey
        self.tagValue = tagValue
        self.accountId = accountId
        self.pluginId = pluginId
        self.service = service
    }
}
