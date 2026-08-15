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

public struct PreflightCapability: Codable, Hashable, Sendable {
    public var id: String
    public var label: String
    public var description: String?
    public var requiredPermissions: [PreflightPermission]
    public var essential: Bool?

    public init(
        id: String,
        label: String,
        description: String? = nil,
        requiredPermissions: [PreflightPermission],
        essential: Bool? = nil
    ) {
        self.id = id
        self.label = label
        self.description = description
        self.requiredPermissions = requiredPermissions
        self.essential = essential
    }
}
