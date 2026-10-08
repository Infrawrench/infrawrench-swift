/*
 * InfrawrenchSDK v1.77.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.77.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Who is emailed when this object fires, **in addition to** whatever the
/// organization's alert routing rules decide. Delivered whether or not a rule
/// matched and not held by quiet hours. On a write, omitting the field leaves the
/// stored list unchanged; send empty arrays to clear it.
public struct AlertEmailRecipients: Codable, Hashable, Sendable {
    /// Organization members, by user id (from GET /alert-email). The member's
    /// current login address is read when the alert is sent, so an email change
    /// follows them and a member who leaves stops receiving.
    public var userIds: [String]
    /// Extra addresses (a `finance@` alias, someone without a login). Each must
    /// pass the organization's external-address policy (GET
    /// /alert-email/settings), checked when saved and again when sent.
    public var addresses: [String]

    public init(
        userIds: [String],
        addresses: [String]
    ) {
        self.userIds = userIds
        self.addresses = addresses
    }
}
