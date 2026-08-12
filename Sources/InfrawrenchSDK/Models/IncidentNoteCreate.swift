/*
 * InfrawrenchSDK v1.15.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.15.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IncidentNoteCreate: Codable, Hashable, Sendable {
    public var body: String
    /// Defaults to now; backdate to place the note.
    public var occurredAt: String?

    public init(
        body: String,
        occurredAt: String? = nil
    ) {
        self.body = body
        self.occurredAt = occurredAt
    }
}
