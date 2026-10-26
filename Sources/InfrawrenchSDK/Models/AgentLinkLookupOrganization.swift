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

public struct AgentLinkLookupOrganization: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    /// You hold `team:invite` there.
    public var canApprove: Bool
    /// What you could put in the ceiling there; empty when `canApprove` is false.
    public var grantableScopes: [String]

    public init(
        id: String,
        name: String,
        canApprove: Bool,
        grantableScopes: [String]
    ) {
        self.id = id
        self.name = name
        self.canApprove = canApprove
        self.grantableScopes = grantableScopes
    }
}
