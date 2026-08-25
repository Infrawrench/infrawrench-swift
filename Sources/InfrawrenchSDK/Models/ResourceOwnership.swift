/*
 * InfrawrenchSDK v1.39.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.39.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceOwnership: Codable, Hashable, Sendable {
    public var id: String
    public var resourceId: String
    public var accountId: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    /// Resource display name, denormalized so a report can name a deleted
    /// resource.
    public var resourceName: String
    /// The routable owner — an org member. Alerts about this resource reach them.
    public var ownerUserId: String?
    /// Resolved server-side; null when unset or removed.
    public var ownerName: String?
    public var ownerEmail: String?
    /// Free-text owner (a team, a rota, a contractor). Display-only, never
    /// routed.
    public var ownerLabel: String?
    /// What this resource is for.
    public var purpose: String?
    /// Link to the ticket that authorized it.
    public var ticketUrl: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        resourceId: String,
        accountId: String,
        pluginId: PluginId,
        resourceTypeId: String,
        resourceName: String,
        ownerUserId: String? = nil,
        ownerName: String? = nil,
        ownerEmail: String? = nil,
        ownerLabel: String? = nil,
        purpose: String? = nil,
        ticketUrl: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.resourceId = resourceId
        self.accountId = accountId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.resourceName = resourceName
        self.ownerUserId = ownerUserId
        self.ownerName = ownerName
        self.ownerEmail = ownerEmail
        self.ownerLabel = ownerLabel
        self.purpose = purpose
        self.ticketUrl = ticketUrl
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
