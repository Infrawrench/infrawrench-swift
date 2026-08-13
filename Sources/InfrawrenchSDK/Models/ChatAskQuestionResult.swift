/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ChatAskQuestionResult: Codable, Hashable, Sendable {
    public var ok: Bool
    /// True when every pending action and secret request on this assistant
    /// message is resolved, so the caller may POST {resume: true}.
    public var allResolved: Bool

    public init(
        ok: Bool,
        allResolved: Bool
    ) {
        self.ok = ok
        self.allResolved = allResolved
    }
}
