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

public struct ComplianceStatus: Codable, Hashable, Sendable {
    public struct Period: Codable, Hashable, Sendable {
        public var from: String
        public var to: String

        public init(
            from: String,
            to: String
        ) {
            self.from = from
            self.to = to
        }
    }

    public var framework: ComplianceFrameworkSummary
    public var period: Period
    public var controls: [ComplianceControlRow]
    public var sources: [ComplianceEvidenceSourceResult]
    public var counts: ComplianceStatusCounts
    public var generatedAt: String

    public init(
        framework: ComplianceFrameworkSummary,
        period: Period,
        controls: [ComplianceControlRow],
        sources: [ComplianceEvidenceSourceResult],
        counts: ComplianceStatusCounts,
        generatedAt: String
    ) {
        self.framework = framework
        self.period = period
        self.controls = controls
        self.sources = sources
        self.counts = counts
        self.generatedAt = generatedAt
    }
}
