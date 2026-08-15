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

public struct ResourceOwnershipPatch: Codable, Hashable, Sendable {
    public var resourceId: String
    /// Omit to keep, null to clear.
    public var ownerUserId: String?
    /// Omit to keep, null to clear.
    public var ownerLabel: String?
    /// Omit to keep, null to clear.
    public var purpose: String?
    /// Omit to keep, null to clear.
    public var ticketUrl: String?

    public init(
        resourceId: String,
        ownerUserId: String? = nil,
        ownerLabel: String? = nil,
        purpose: String? = nil,
        ticketUrl: String? = nil
    ) {
        self.resourceId = resourceId
        self.ownerUserId = ownerUserId
        self.ownerLabel = ownerLabel
        self.purpose = purpose
        self.ticketUrl = ticketUrl
    }
}
