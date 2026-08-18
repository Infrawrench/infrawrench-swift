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

public struct InviteRequest: Codable, Hashable, Sendable {
    public var email: String
    public var role: OrganizationRole?
    public var roleId: String?
    /// When the paid plan is full (409 seat_limit_reached), retry with this set
    /// to buy one more monthly seat and send the invitation. Requires
    /// billing:write. Only works when the 409 reported `canAddSeat: true` — an
    /// org whose capacity is entirely prepaid capacity slots has no monthly seat
    /// to add.
    public var addSeat: Bool?

    public init(
        email: String,
        role: OrganizationRole? = nil,
        roleId: String? = nil,
        addSeat: Bool? = nil
    ) {
        self.email = email
        self.role = role
        self.roleId = roleId
        self.addSeat = addSeat
    }
}
