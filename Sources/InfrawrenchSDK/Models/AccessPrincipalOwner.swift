/*
 * InfrawrenchSDK v1.19.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.19.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Who owns the resource, from the resource-ownership record. Null when nobody is
/// named.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct AccessPrincipalOwner: Codable, Hashable, Sendable {
    /// Infrawrench user id when the owner is a member.
    public var userId: String?
    /// Member name, or the free-text owner label.
    public var displayName: String
    /// True when the owner is a label rather than a routable member.
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
