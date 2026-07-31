/*
 * InfrawrenchSDK v0.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DeployTrigger: Codable, Hashable, Sendable {
    public var id: String
    public var repo: String
    public var branch: String
    public var env: String
    public var enabled: Bool
    public var lastSha: String?
    public var lastRunAt: String?

    public init(
        id: String,
        repo: String,
        branch: String,
        env: String,
        enabled: Bool,
        lastSha: String? = nil,
        lastRunAt: String? = nil
    ) {
        self.id = id
        self.repo = repo
        self.branch = branch
        self.env = env
        self.enabled = enabled
        self.lastSha = lastSha
        self.lastRunAt = lastRunAt
    }
}
