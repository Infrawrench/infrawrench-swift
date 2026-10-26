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

public struct AgentLinkError: Codable, Hashable, Sendable {
    public var error: String
    public var code: String?
    public var scopes: [String]?
    public var agentId: String?
    public var providers: [String]?

    public init(
        error: String,
        code: String? = nil,
        scopes: [String]? = nil,
        agentId: String? = nil,
        providers: [String]? = nil
    ) {
        self.error = error
        self.code = code
        self.scopes = scopes
        self.agentId = agentId
        self.providers = providers
    }
}
