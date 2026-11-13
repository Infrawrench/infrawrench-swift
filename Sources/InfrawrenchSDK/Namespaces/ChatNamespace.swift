/*
 * InfrawrenchSDK v1.107.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.107.0).
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

    /// Month-to-date chat spend and cap
    ///
    /// _Requires permission: `chat:read`._
    ///
    /// GET /api/org/{orgId}/chat/spend
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func spend(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ChatSpendStatus {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/chat/spend",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
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

    /// Start a chat conversation
    ///
    /// Creates an empty conversation owned by the caller. Send its first message
    /// with `POST /conversations/{conversationId}/messages`.
    ///
    /// _Requires permission: `chat:write`._
    ///
    /// POST /api/org/{orgId}/chat/conversations
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: ChatConversationCreateInput,
        options: RequestOptions? = nil
    ) async throws -> ChatConversationCreated {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/chat/conversations",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Archive a conversation
    ///
    /// Hides the conversation from the list; its history is kept. Answers `ok`
    /// whether or not the conversation was the caller's.
    ///
    /// _Requires permission: `chat:write`._
    ///
    /// DELETE /api/org/{orgId}/chat/conversations/{conversationId}
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter conversationId: Chat conversation id.
    public func delete(
        orgId: String? = nil,
        conversationId: String,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/chat/conversations/{conversationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "conversationId": conversationId.parameterValue]
            ),
            options: options
        )
    }

    /// List the caller's chat conversations
    ///
    /// _Requires permission: `chat:read`._
    ///
    /// GET /api/org/{orgId}/chat/conversations
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func get(
        orgId: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> ChatConversationList {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/chat/conversations",
                pathParameters: ["orgId": orgId?.parameterValue]
            ),
            options: options
        )
    }

    /// A conversation with its messages and pending items
    ///
    /// _Requires permission: `chat:read`._
    ///
    /// GET /api/org/{orgId}/chat/conversations/{conversationId}
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter conversationId: Chat conversation id.
    public func getOrgOrgIdChatConversationsConversationId(
        orgId: String? = nil,
        conversationId: String,
        options: RequestOptions? = nil
    ) async throws -> ChatConversationDetail {
        return try await transport.send(
            RequestSpec(
                method: "GET",
                path: "/api/org/{orgId}/chat/conversations/{conversationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "conversationId": conversationId.parameterValue]
            ),
            options: options
        )
    }

    /// Switch a conversation's model
    ///
    /// Takes effect on the conversation's next turn.
    ///
    /// _Requires permission: `chat:write`._
    ///
    /// PATCH /api/org/{orgId}/chat/conversations/{conversationId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 404: Not found
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter conversationId: Chat conversation id.
    public func update(
        orgId: String? = nil,
        conversationId: String,
        body: ChatConversationModelInput,
        options: RequestOptions? = nil
    ) async throws -> Ok {
        return try await transport.send(
            RequestSpec(
                method: "PATCH",
                path: "/api/org/{orgId}/chat/conversations/{conversationId}",
                pathParameters: ["orgId": orgId?.parameterValue, "conversationId": conversationId.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
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

    /// Approve or reject a pending tool call
    ///
    /// Approving runs the tool now, before answering; a tool that fails answers
    /// 500 with its error and the action is recorded as `errored`. Not for
    /// `ask_question` actions, which take answers instead.
    ///
    /// _Requires permission: `chat:write`._
    ///
    /// POST
    /// /api/org/{orgId}/chat/conversations/{conversationId}/pending/{pendingId}
    ///
    /// Raises on 400: Bad request
    ///
    /// Raises on 403: Forbidden
    ///
    /// Raises on 404: Not found
    ///
    /// Raises on 409: Conflict
    ///
    /// Raises on 500: Server error
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter conversationId: Chat conversation id.
    ///
    /// - Parameter pendingId: Pending ask_question action id.
    public func create(
        orgId: String? = nil,
        conversationId: String,
        pendingId: String,
        body: ChatPendingDecisionInput,
        options: RequestOptions? = nil
    ) async throws -> ChatPendingDecisionResult {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/chat/conversations/{conversationId}/pending/{pendingId}",
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
