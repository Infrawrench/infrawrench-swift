/*
 * InfrawrenchSDK v1.71.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.71.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct VirtualTagSource: Codable, Hashable, Sendable {
    public var tagKey: String
    /// Prepended to the copied value, e.g. `az-`.
    public var valuePrefix: String?
    /// Cost-query-language filter that must also hold for this key to be read,
    /// e.g. `provider = 'azure'`. Null for always.
    public var query: String?

    public init(
        tagKey: String,
        valuePrefix: String? = nil,
        query: String? = nil
    ) {
        self.tagKey = tagKey
        self.valuePrefix = valuePrefix
        self.query = query
    }
}
