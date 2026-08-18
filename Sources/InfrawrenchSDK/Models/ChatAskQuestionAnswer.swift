/*
 * InfrawrenchSDK v1.29.1 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.1).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatAskQuestionAnswer: Codable, Hashable, Sendable {
    /// Id of the question being answered.
    public var questionId: String
    /// Listed option id, or `other` when the user typed a custom value.
    public var optionId: String?
    /// Required for text questions and when optionId is `other`.
    public var text: String?

    public init(
        questionId: String,
        optionId: String? = nil,
        text: String? = nil
    ) {
        self.questionId = questionId
        self.optionId = optionId
        self.text = text
    }
}
