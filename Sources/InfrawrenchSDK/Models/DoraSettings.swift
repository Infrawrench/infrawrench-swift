/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DoraSettings: Codable, Hashable, Sendable {
    /// Hours after a change in which an incident or rollback counts against it
    /// (1-720).
    public var failureWindowHours: Int
    /// Environment name patterns that count as production; `*` matches anything.
    /// 1-50.
    public var productionEnvironments: [String]
    /// CI pipeline names that count as deploys (Buildkite, CircleCI, GitLab...).
    /// 0-50.
    public var pipelinePatterns: [String]
    /// Count a production deploy that failed as a failed change.
    public var countFailedDeploys: Bool
    /// Count changes observed by sync (the change timeline) as changes too.
    public var includeResourceChanges: Bool
    /// Include the Delivery line in the weekly digest.
    public var digestEnabled: Bool
    /// Null until the settings were first saved.
    public var updatedAt: String?

    public init(
        failureWindowHours: Int,
        productionEnvironments: [String],
        pipelinePatterns: [String],
        countFailedDeploys: Bool,
        includeResourceChanges: Bool,
        digestEnabled: Bool,
        updatedAt: String? = nil
    ) {
        self.failureWindowHours = failureWindowHours
        self.productionEnvironments = productionEnvironments
        self.pipelinePatterns = pipelinePatterns
        self.countFailedDeploys = countFailedDeploys
        self.includeResourceChanges = includeResourceChanges
        self.digestEnabled = digestEnabled
        self.updatedAt = updatedAt
    }
}
