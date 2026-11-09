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

public struct ChatConversationList: Codable, Hashable, Sendable {
    /// The caller's conversations in this organization, most recently active
    /// first; at most 200, archived ones left out.
    public var conversations: [ChatConversationSummary]

    public init(
        conversations: [ChatConversationSummary]
    ) {
        self.conversations = conversations
    }
}
