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

public struct Dashboard: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    /// The organization default: the final fallback, never deletable.
    public var isDefault: Bool
    /// The dashboard the caller lands on: their own default, else their role's,
    /// else the organization default. Exactly one listed dashboard has it, unless
    /// sharing hides it.
    public var isResolvedDefault: Bool

    public init(
        id: String,
        name: String,
        isDefault: Bool,
        isResolvedDefault: Bool
    ) {
        self.id = id
        self.name = name
        self.isDefault = isDefault
        self.isResolvedDefault = isResolvedDefault
    }
}
