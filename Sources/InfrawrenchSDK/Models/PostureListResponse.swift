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

public struct PostureListResponse: Codable, Hashable, Sendable {
    public struct LeakedCredentials: Codable, Hashable, Sendable {
        /// Open leaked credentials.
        public var open: Int
        /// Open leaks matched to something Infrawrench holds.
        public var matched: Int
        /// Secret scanning accounts connected.
        public var scanners: Int

        public init(
            open: Int,
            matched: Int,
            scanners: Int
        ) {
            self.open = open
            self.matched = matched
            self.scanners = scanners
        }
    }

    /// Live findings, worst severity first. Dismissed findings are not included.
    public var findings: [PostureFinding]
    /// Live finding count; dismissals excluded.
    public var totalCount: Int
    public var counts: PostureSeverityCounts
    /// Findings a dismissal is currently suppressing, most recently dismissed
    /// first. Only dismissals whose rule still matches appear, so a finding that
    /// has since been fixed simply drops out.
    public var dismissed: [DismissedPostureFinding]
    public var dismissedCount: Int
    /// The Leaked credentials category: secrets a scanner found committed to
    /// code. The rows are at `GET /leaked-secrets`.
    public var leakedCredentials: LeakedCredentials?
    public var generatedAt: String

    public init(
        findings: [PostureFinding],
        totalCount: Int,
        counts: PostureSeverityCounts,
        dismissed: [DismissedPostureFinding],
        dismissedCount: Int,
        leakedCredentials: LeakedCredentials? = nil,
        generatedAt: String
    ) {
        self.findings = findings
        self.totalCount = totalCount
        self.counts = counts
        self.dismissed = dismissed
        self.dismissedCount = dismissedCount
        self.leakedCredentials = leakedCredentials
        self.generatedAt = generatedAt
    }
}
