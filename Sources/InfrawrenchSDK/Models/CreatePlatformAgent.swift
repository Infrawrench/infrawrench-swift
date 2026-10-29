/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreatePlatformAgent: Codable, Hashable, Sendable {
    public var externalId: String
    public var label: String
    public var scopes: [String]
    /// Plugin ids. Narrows every `resources:*`, `secrets:*` and `storage:*` scope
    /// to these providers (`resources:read` becomes `resources:<plugin>:read`).
    /// Omitted or empty means all. With providers, every scope must be one of
    /// those families (see `narrowableScopes`).
    public var providers: [String]?

    public init(
        externalId: String,
        label: String,
        scopes: [String],
        providers: [String]? = nil
    ) {
        self.externalId = externalId
        self.label = label
        self.scopes = scopes
        self.providers = providers
    }
}
