/*
 * InfrawrenchSDK v1.14.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.14.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostReport: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var description: String?
    public var config: CostGraphConfig
    /// Folder the report is filed under (see /cost-report-folders); null is the
    /// top level of the Reports list. Moving a report is this same PUT with a
    /// different folderId; an id from another org is a 400. Deleting a folder
    /// never deletes its reports — they fall back to the top level.
    public var folderId: String?
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String
    /// The dashboards carrying a `cost_report` card for this report. Empty is
    /// normal — a report exists, and can be run, whether or not any dashboard
    /// shows it. Deleting the report removes these cards; removing a card leaves
    /// the report alone.
    public var placements: [CostReportPlacement]

    public init(
        id: String,
        name: String,
        description: String? = nil,
        config: CostGraphConfig,
        folderId: String? = nil,
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String,
        placements: [CostReportPlacement]
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.config = config
        self.folderId = folderId
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.placements = placements
    }
}
