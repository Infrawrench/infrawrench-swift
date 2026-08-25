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

public struct HygieneReport: Codable, Hashable, Sendable {
    public struct Counts: Codable, Hashable, Sendable {
        public var high: Int
        public var medium: Int
        public var low: Int
        public var total: Int

        public init(
            high: Int,
            medium: Int,
            low: Int,
            total: Int
        ) {
            self.high = high
            self.medium = medium
            self.low = low
            self.total = total
        }
    }

    public var generatedAt: String
    public var windowDays: Int
    /// How much audit history the organization actually has; null when it has
    /// none.
    public var auditHistoryDays: Int?
    /// True when there was not enough audit history for the unused-permission
    /// finding to mean anything, so it was withheld rather than guessed at.
    public var permissionFindingsWithheld: Bool
    public var findings: [HygieneFinding]
    public var counts: Counts

    public init(
        generatedAt: String,
        windowDays: Int,
        auditHistoryDays: Int? = nil,
        permissionFindingsWithheld: Bool,
        findings: [HygieneFinding],
        counts: Counts
    ) {
        self.generatedAt = generatedAt
        self.windowDays = windowDays
        self.auditHistoryDays = auditHistoryDays
        self.permissionFindingsWithheld = permissionFindingsWithheld
        self.findings = findings
        self.counts = counts
    }
}
