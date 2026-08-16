/*
 * InfrawrenchSDK v1.27.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.27.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccessReviewResponse: Codable, Hashable, Sendable {
    /// Every synced principal, by account then type then name. Never filtered by
    /// dismissals — accepting a finding must not remove a principal from the
    /// inventory.
    public var principals: [AccessPrincipal]
    /// Live findings, worst severity first. Dismissed findings are not included.
    public var findings: [AccessFinding]
    /// Live finding count; dismissals excluded.
    public var totalCount: Int
    public var counts: AccessReviewSeverityCounts
    public var byRule: AccessReviewRuleCounts
    public var byRole: AccessReviewRoleCounts
    /// Findings a dismissal is currently suppressing, most recently dismissed
    /// first. Only dismissals whose rule still matches appear.
    public var dismissed: [DismissedAccessFinding]
    public var dismissedCount: Int
    /// How many principals the review could establish no last-use evidence for.
    /// Surfaces render this so "we found nothing" and "we could not look" do not
    /// read the same.
    public var unknownActivityCount: Int
    /// The staleness window this review was computed against.
    public var staleDays: Int
    public var generatedAt: String

    public init(
        principals: [AccessPrincipal],
        findings: [AccessFinding],
        totalCount: Int,
        counts: AccessReviewSeverityCounts,
        byRule: AccessReviewRuleCounts,
        byRole: AccessReviewRoleCounts,
        dismissed: [DismissedAccessFinding],
        dismissedCount: Int,
        unknownActivityCount: Int,
        staleDays: Int,
        generatedAt: String
    ) {
        self.principals = principals
        self.findings = findings
        self.totalCount = totalCount
        self.counts = counts
        self.byRule = byRule
        self.byRole = byRole
        self.dismissed = dismissed
        self.dismissedCount = dismissedCount
        self.unknownActivityCount = unknownActivityCount
        self.staleDays = staleDays
        self.generatedAt = generatedAt
    }
}
