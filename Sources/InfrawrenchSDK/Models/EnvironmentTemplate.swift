/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct EnvironmentTemplate: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var description: String?
    public var parameters: [EnvironmentParameter]
    public var members: [EnvironmentTemplateMember]
    public var createdAt: String
    public var updatedAt: String
    public var activeInstanceCount: Int?

    public init(
        id: String,
        name: String,
        description: String? = nil,
        parameters: [EnvironmentParameter],
        members: [EnvironmentTemplateMember],
        createdAt: String,
        updatedAt: String,
        activeInstanceCount: Int? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.parameters = parameters
        self.members = members
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.activeInstanceCount = activeInstanceCount
    }
}
