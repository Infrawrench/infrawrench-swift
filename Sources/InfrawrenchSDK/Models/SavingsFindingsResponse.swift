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

public struct SavingsFindingsResponse: Codable, Hashable, Sendable {
    public struct Unavailable: Codable, Hashable, Sendable {
        public var kind: SavingsFindingKind
        public var error: String

        public init(
            kind: SavingsFindingKind,
            error: String
        ) {
            self.kind = kind
            self.error = error
        }
    }

    /// Matching findings, filtered and sorted.
    public var findings: [SavingsFinding]
    public var summary: SavingsFindingsSummary
    /// Finders that failed to compute this time; their findings are not fixed.
    public var unavailable: [Unavailable]
    public var generatedAt: String

    public init(
        findings: [SavingsFinding],
        summary: SavingsFindingsSummary,
        unavailable: [Unavailable],
        generatedAt: String
    ) {
        self.findings = findings
        self.summary = summary
        self.unavailable = unavailable
        self.generatedAt = generatedAt
    }
}
