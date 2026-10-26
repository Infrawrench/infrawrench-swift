/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
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
    public struct NibbletsLink: Codable, Hashable, Sendable {
        /// The link's ceiling.
        public var scopes: [String]

        public init(
            scopes: [String]
        ) {
            self.scopes = scopes
        }
    }

    public var repo: String?
    public var projectName: String?
    public var workspaceName: String?
    public var settings: AgentSettings?
    /// Nibblets sessions only: start the server linked to this organization
    /// through an agent link you approve, as on the link approval page. Needs
    /// `team:invite`; `scopes` must be within what you hold (no break-glass
    /// elevation) minus permissions no agent may hold. Refused for API keys and
    /// agents.
    public var nibbletsLink: NibbletsLink?

    public init(
        repo: String? = nil,
        projectName: String? = nil,
        workspaceName: String? = nil,
        settings: AgentSettings? = nil,
        nibbletsLink: NibbletsLink? = nil
    ) {
        self.repo = repo
        self.projectName = projectName
        self.workspaceName = workspaceName
        self.settings = settings
        self.nibbletsLink = nibbletsLink
    }
}
