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

/// The next person in the rotation — where an escalation goes. Resolved from the
/// rotation and never from a cover: a cover is somebody standing in for one
/// shift.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct OnCallParticipant: Codable, Hashable, Sendable {
    public var userId: String
    public var name: String?
    public var email: String?

    public init(
        userId: String,
        name: String? = nil,
        email: String? = nil
    ) {
        self.userId = userId
        self.name = name
        self.email = email
    }
}
