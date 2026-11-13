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

public struct CiScheduledPipeline: Codable, Hashable, Sendable {
    /// The pipeline file, under `.infrawrench/ci/`.
    public var file: String
    public var name: String
    /// Its `on.schedule` cron expressions, in UTC.
    public var cron: [String]
    /// The next minute one of them fires on; null when none ever does.
    public var nextRunAt: String?

    public init(
        file: String,
        name: String,
        cron: [String],
        nextRunAt: String? = nil
    ) {
        self.file = file
        self.name = name
        self.cron = cron
        self.nextRunAt = nextRunAt
    }
}
