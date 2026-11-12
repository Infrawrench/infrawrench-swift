/*
 * InfrawrenchSDK v1.104.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.104.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatConversationSummary: Codable, Hashable, Sendable {
    public var id: String
    public var title: String
    public var model: String
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        title: String,
        model: String,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.title = title
        self.model = model
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
