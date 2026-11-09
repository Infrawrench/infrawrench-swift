/*
 * InfrawrenchSDK v1.101.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.101.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatConversation: Codable, Hashable, Sendable {
    public var id: String
    /// Organization id
    public var organizationId: String
    /// The owner: always the caller, since a conversation is only readable by its
    /// owner.
    public var userId: String?
    /// The cost canvas this conversation builds and edits, when it was started
    /// from one.
    public var costCanvasId: String?
    public var title: String
    public var model: String
    /// The system prompt override; null runs the agent's default.
    public var systemPrompt: String?
    public var archivedAt: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        organizationId: String,
        userId: String? = nil,
        costCanvasId: String? = nil,
        title: String,
        model: String,
        systemPrompt: String? = nil,
        archivedAt: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.organizationId = organizationId
        self.userId = userId
        self.costCanvasId = costCanvasId
        self.title = title
        self.model = model
        self.systemPrompt = systemPrompt
        self.archivedAt = archivedAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
