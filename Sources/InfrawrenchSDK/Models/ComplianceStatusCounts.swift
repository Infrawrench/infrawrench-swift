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

public struct ComplianceStatusCounts: Codable, Hashable, Sendable {
    public var evidence: Int
    public var gaps: Int
    public var notApplicable: Int
    public var total: Int
    public var `unowned`: Int

    public init(
        evidence: Int,
        gaps: Int,
        notApplicable: Int,
        total: Int,
        `unowned`: Int
    ) {
        self.evidence = evidence
        self.gaps = gaps
        self.notApplicable = notApplicable
        self.total = total
        self.`unowned` = `unowned`
    }
}
