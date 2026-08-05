/*
 * InfrawrenchSDK v0.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PostureListResponse: Codable, Hashable, Sendable {
    /// All findings, worst severity first.
    public var findings: [PostureFinding]
    public var totalCount: Int
    public var counts: PostureSeverityCounts
    public var generatedAt: String

    public init(
        findings: [PostureFinding],
        totalCount: Int,
        counts: PostureSeverityCounts,
        generatedAt: String
    ) {
        self.findings = findings
        self.totalCount = totalCount
        self.counts = counts
        self.generatedAt = generatedAt
    }
}
