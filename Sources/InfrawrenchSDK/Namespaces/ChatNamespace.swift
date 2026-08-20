/*
 * InfrawrenchSDK v1.34.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.34.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.chat`
public final class ChatNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.chat.conversations`
    public let conversations: ChatConversationsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.conversations = ChatConversationsNamespace(transport: transport)
    }
}

/// `client.chat.conversations`
public final class ChatConversationsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport
    /// `client.chat.conversations.pending`
    public let pending: ChatConversationsPendingNamespace
    /// `client.chat.conversations.secretRequests`
    public let secretRequests: ChatConversationsSecretRequestsNamespace

    init(transport: ApiTransport) {
        self.transport = transport
        self.pending = ChatConversationsPendingNamespace(transport: transport)
        self.secretRequests = ChatConversationsSecretRequestsNamespace(transport: transport)
    }
}

/// `client.chat.conversations.pending`
public final class ChatConversationsPendingNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Answer an agent question
    ///
    /// Submit answers to a chat-only `ask_question` pending action (selection
    /// with an Other field, or a textarea). Not used for destructive-tool
    /// approval.
    ///
    /// _Requires permission: `chat:write`._
    ///
    /// POST
    /// /api/org/{orgId}/chat/conversations/{conversationId}/pending/{pendingId}/answer
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter conversationId: Chat conversation id.
    ///
    /// - Parameter pendingId: Pending ask_question action id.
    public func answer(
        orgId: String? = nil,
        conversationId: String,
        pendingId: String,
        body: ChatAskQuestionInput,
        options: RequestOptions? = nil
    ) async throws -> ChatAskQuestionResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/chat/conversations/{conversationId}/pending/{pendingId}/answer",
                pathParameters: ["orgId": orgId?.parameterValue, "conversationId": conversationId.parameterValue, "pendingId": pendingId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}

/// `client.chat.conversations.secretRequests`
public final class ChatConversationsSecretRequestsNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Submit a requested workflow secret
    ///
    /// Human-only, write-only handoff from the chat password field to encrypted
    /// workflow-secret storage. The value is never returned or added to chat
    /// history.
    ///
    /// POST
    /// /api/org/{orgId}/chat/conversations/{conversationId}/secret-requests/{requestId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter conversationId: Chat conversation id.
    ///
    /// - Parameter requestId: Pending secret request id.
    public func create(
        orgId: String? = nil,
        conversationId: String,
        requestId: String,
        body: WorkflowSecretValueWrite,
        options: RequestOptions? = nil
    ) async throws -> ChatSecretRequestResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/chat/conversations/{conversationId}/secret-requests/{requestId}",
                pathParameters: ["orgId": orgId?.parameterValue, "conversationId": conversationId.parameterValue, "requestId": requestId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }
}
