/*
 * InfrawrenchSDK v1.105.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.105.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatConversationDetail: Codable, Hashable, Sendable {
    public var conversation: ChatConversation
    /// Oldest first.
    public var messages: [ChatMessage]
    /// Every tool call that needed approval or an answer, oldest first, whatever
    /// its status.
    public var pendingActions: [ChatPendingAction]
    /// Every secret the agent asked a human to enter, oldest first. Values are
    /// never included.
    public var pendingSecretRequests: [ChatPendingSecretRequest]

    public init(
        conversation: ChatConversation,
        messages: [ChatMessage],
        pendingActions: [ChatPendingAction],
        pendingSecretRequests: [ChatPendingSecretRequest]
    ) {
        self.conversation = conversation
        self.messages = messages
        self.pendingActions = pendingActions
        self.pendingSecretRequests = pendingSecretRequests
    }
}
