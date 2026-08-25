/*
 * InfrawrenchSDK v1.36.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.36.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct DrillCoverageResponse: Codable, Hashable, Sendable {
    public var rows: [DrillCoverageRow]
    public var summary: DrillSummary
    public var validDays: Int
    /// Drills against a resource no longer in the inventory. Reported rather than
    /// dropped: 'we tested this and then removed it' is a fact an auditor asks
    /// about.
    public var orphanedDrills: [RestoreDrill]
    public var generatedAt: String

    public init(
        rows: [DrillCoverageRow],
        summary: DrillSummary,
        validDays: Int,
        orphanedDrills: [RestoreDrill],
        generatedAt: String
    ) {
        self.rows = rows
        self.summary = summary
        self.validDays = validDays
        self.orphanedDrills = orphanedDrills
        self.generatedAt = generatedAt
    }
}
