/*
 * InfrawrenchSDK v0.16.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.16.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RoleUpdateRequest: Codable, Hashable, Sendable {
    public var name: String?
    public var description: String?
    public var permissions: [Permission]?

    public init(
        name: String? = nil,
        description: String? = nil,
        permissions: [Permission]? = nil
    ) {
        self.name = name
        self.description = description
        self.permissions = permissions
    }
}
