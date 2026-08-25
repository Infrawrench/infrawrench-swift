/*
 * InfrawrenchSDK v1.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WorkflowSecret: Codable, Hashable, Sendable {
    public var id: String
    /// JavaScript dot identifier used to expose the value to workflow code, for
    /// example `API_TOKEN` or `stripe.apiKey`.
    public var name: String
    public var description: String?
    /// Whether an encrypted value is stored. The value is never returned.
    public var hasValue: Bool
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        description: String? = nil,
        hasValue: Bool,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.hasValue = hasValue
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
