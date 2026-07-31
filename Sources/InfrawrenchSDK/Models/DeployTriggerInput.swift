/*
 * InfrawrenchSDK v0.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DeployTriggerInput: Codable, Hashable, Sendable {
    public var repo: String
    public var branch: String
    public var env: String
    public var answers: [String: String]?

    public init(
        repo: String,
        branch: String,
        env: String,
        answers: [String: String]? = nil
    ) {
        self.repo = repo
        self.branch = branch
        self.env = env
        self.answers = answers
    }
}
