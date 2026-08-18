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

public struct AgentClaimLookup: Codable, Hashable, Sendable {
    public var registrationId: String
    public var workspaceName: String
    public var trialExpiresInMs: Int?
    /// Organizations this user may merge the workspace into: ones they already
    /// belong to AND hold `accounts:write` in. A merge writes cloud credentials,
    /// so membership alone is not enough — the confirm route enforces the same
    /// rule.
    public var mergeTargets: [AgentClaimMergeTarget]

    public init(
        registrationId: String,
        workspaceName: String,
        trialExpiresInMs: Int? = nil,
        mergeTargets: [AgentClaimMergeTarget]
    ) {
        self.registrationId = registrationId
        self.workspaceName = workspaceName
        self.trialExpiresInMs = trialExpiresInMs
        self.mergeTargets = mergeTargets
    }
}
