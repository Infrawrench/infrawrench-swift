/*
 * InfrawrenchSDK v1.75.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.75.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CustomCostSource: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var description: String?
    public var defaultCurrency: String?
    /// The value this source's rows carry in the cost `provider` dimension. Use
    /// it in cost filters, budgets, and allocation rules.
    public var pluginId: String
    public var uploadCount: Int
    public var lastUploadAt: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        description: String? = nil,
        defaultCurrency: String? = nil,
        pluginId: String,
        uploadCount: Int,
        lastUploadAt: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.defaultCurrency = defaultCurrency
        self.pluginId = pluginId
        self.uploadCount = uploadCount
        self.lastUploadAt = lastUploadAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
