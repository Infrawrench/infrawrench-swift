/*
 * InfrawrenchSDK v0.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ResourceLeaseUpdate: Codable, Hashable, Sendable {
    public var expiresAt: String?
    /// Requires the `resources:delete` permission when set to true.
    public var autoDelete: Bool?
    /// `null` clears the note.
    public var note: String?

    public init(
        expiresAt: String? = nil,
        autoDelete: Bool? = nil,
        note: String? = nil
    ) {
        self.expiresAt = expiresAt
        self.autoDelete = autoDelete
        self.note = note
    }
}
