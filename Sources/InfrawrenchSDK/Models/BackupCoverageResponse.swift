/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BackupCoverageResponse: Codable, Hashable, Sendable {
    /// Gaps, worst severity first.
    public var findings: [BackupFinding]
    public var counts: BackupSeverityCounts
    public var kindCounts: BackupKindCounts
    public var totalCount: Int
    public var resources: [BackupCoverageRow]
    public var summary: BackupCoverageSummary
    public var generatedAt: String

    public init(
        findings: [BackupFinding],
        counts: BackupSeverityCounts,
        kindCounts: BackupKindCounts,
        totalCount: Int,
        resources: [BackupCoverageRow],
        summary: BackupCoverageSummary,
        generatedAt: String
    ) {
        self.findings = findings
        self.counts = counts
        self.kindCounts = kindCounts
        self.totalCount = totalCount
        self.resources = resources
        self.summary = summary
        self.generatedAt = generatedAt
    }
}
