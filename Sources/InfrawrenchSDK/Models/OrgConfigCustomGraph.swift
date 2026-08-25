/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OrgConfigCustomGraph: Codable, Hashable, Sendable {
    /// Stable slug identifying this entity across organizations. Derived from the
    /// name on export; it is what an apply matches on, so renaming an entity
    /// while keeping its key is a rename rather than a delete-and-create.
    public var key: String
    public var name: String
    public var description: String?
    /// The graph's TypeScript source.
    public var source: String

    public init(
        key: String,
        name: String,
        description: String? = nil,
        source: String
    ) {
        self.key = key
        self.name = name
        self.description = description
        self.source = source
    }
}
