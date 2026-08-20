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

public struct ChatAskQuestionInput: Codable, Hashable, Sendable {
    /// One answer per question the agent asked.
    public var answers: [ChatAskQuestionAnswer]

    public init(
        answers: [ChatAskQuestionAnswer]
    ) {
        self.answers = answers
    }
}
