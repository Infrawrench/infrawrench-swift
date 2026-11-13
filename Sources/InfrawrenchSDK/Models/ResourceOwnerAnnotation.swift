/*
 * InfrawrenchSDK v1.107.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.107.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceOwnerAnnotation: Codable, Hashable, Sendable {
    /// Set when a routable org member owns it.
    public var userId: String?
    /// The member's name, or the free-text owner.
    public var displayName: String
    /// True when the owner is free text; nothing can be routed to it.
    public var isLabel: Bool
    public var ticketUrl: String?
    public var purpose: String?

    public init(
        userId: String? = nil,
        displayName: String,
        isLabel: Bool,
        ticketUrl: String? = nil,
        purpose: String? = nil
    ) {
        self.userId = userId
        self.displayName = displayName
        self.isLabel = isLabel
        self.ticketUrl = ticketUrl
        self.purpose = purpose
    }
}
