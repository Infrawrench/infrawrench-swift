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

public struct CiRunDetail: Codable, Hashable, Sendable {
    public var run: CiRun
    public var jobs: [CiJobOutput]?
    /// Where each of its cloud jobs ran. Absent when it has none.
    public var cloudJobs: [CiCloudJob]?

    public init(
        run: CiRun,
        jobs: [CiJobOutput]? = nil,
        cloudJobs: [CiCloudJob]? = nil
    ) {
        self.run = run
        self.jobs = jobs
        self.cloudJobs = cloudJobs
    }
}
