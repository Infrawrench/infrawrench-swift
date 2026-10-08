/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostCanvas: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var description: String?
    public var spec: CostCanvasSpec
    public var prompt: String?
    /// The caller's latest unarchived chat conversation for this canvas; per
    /// user.
    public var conversationId: String?
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String
    public var placements: [CostCanvasPlacement]

    public init(
        id: String,
        name: String,
        description: String? = nil,
        spec: CostCanvasSpec,
        prompt: String? = nil,
        conversationId: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String,
        placements: [CostCanvasPlacement]
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.spec = spec
        self.prompt = prompt
        self.conversationId = conversationId
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.placements = placements
    }
}
