/*
 * InfrawrenchSDK v1.18.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.18.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CreateAgentSession: Codable, Hashable, Sendable {
    public var repo: String?
    public var projectName: String?
    public var workspaceName: String?
    public var settings: AgentSettings?

    public init(
        repo: String? = nil,
        projectName: String? = nil,
        workspaceName: String? = nil,
        settings: AgentSettings? = nil
    ) {
        self.repo = repo
        self.projectName = projectName
        self.workspaceName = workspaceName
        self.settings = settings
    }
}
