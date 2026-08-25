/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct Role: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var description: String?
    public var isSystem: Bool
    public var systemKey: String?
    public var permissions: [Permission]

    public init(
        id: String,
        name: String,
        description: String? = nil,
        isSystem: Bool,
        systemKey: String? = nil,
        permissions: [Permission]
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.isSystem = isSystem
        self.systemKey = systemKey
        self.permissions = permissions
    }
}
