/*
 * InfrawrenchSDK v1.108.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.108.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiRepoSchedule: Codable, Hashable, Sendable {
    public var installationId: Int
    public var repoFullName: String
    public var defaultBranch: String
    /// The default branch's commit the pipelines were read from, which scheduled
    /// runs check out.
    public var sha: String?
    public var pipelines: [CiScheduledPipeline]
    /// When the default branch was last read; null until the first read.
    public var refreshedAt: String?
    /// Why the last read failed, or which pipeline files did not parse.
    public var error: String?

    public init(
        installationId: Int,
        repoFullName: String,
        defaultBranch: String,
        sha: String? = nil,
        pipelines: [CiScheduledPipeline],
        refreshedAt: String? = nil,
        error: String? = nil
    ) {
        self.installationId = installationId
        self.repoFullName = repoFullName
        self.defaultBranch = defaultBranch
        self.sha = sha
        self.pipelines = pipelines
        self.refreshedAt = refreshedAt
        self.error = error
    }
}
