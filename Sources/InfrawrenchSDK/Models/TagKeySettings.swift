/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct TagKeySettings: Codable, Hashable, Sendable {
    /// Tag keys left out of every tag picker. Each entry is an exact key (`Name`)
    /// or a prefix pattern ending in a single `*` (`aws:cloudformation:*`). A
    /// lone `*` and a `*` anywhere but the end are rejected. Matching is
    /// case-sensitive. Hidden keys' data is untouched: stored, exported, and
    /// queryable by a filter naming them.
    public var hidden: [String]
    /// Exact tag keys pinned to the top of every tag picker, in this order. A key
    /// cannot be both hidden and preferred; a preferred key under a hidden prefix
    /// stays visible.
    public var preferred: [String]

    public init(
        hidden: [String],
        preferred: [String]
    ) {
        self.hidden = hidden
        self.preferred = preferred
    }
}
