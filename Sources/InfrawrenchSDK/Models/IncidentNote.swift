/*
 * InfrawrenchSDK v1.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IncidentNote: Codable, Hashable, Sendable {
    public var id: String
    public var body: String
    public var authorUserId: String?
    public var authorName: String?
    /// When the note is *about*, which may precede when it was written — a note
    /// typed at 04:00 can be dated to 03:14 and lands there on the timeline.
    public var occurredAt: String
    public var createdAt: String

    public init(
        id: String,
        body: String,
        authorUserId: String? = nil,
        authorName: String? = nil,
        occurredAt: String,
        createdAt: String
    ) {
        self.id = id
        self.body = body
        self.authorUserId = authorUserId
        self.authorName = authorName
        self.occurredAt = occurredAt
        self.createdAt = createdAt
    }
}
