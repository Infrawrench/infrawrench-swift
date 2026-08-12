/*
 * InfrawrenchSDK v1.16.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.16.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostReportInput: Codable, Hashable, Sendable {
    public var name: String
    public var description: String?
    public var config: CostGraphConfig
    /// Folder the report is filed under (see /cost-report-folders); null is the
    /// top level of the Reports list. Moving a report is this same PUT with a
    /// different folderId; an id from another org is a 400. Deleting a folder
    /// never deletes its reports — they fall back to the top level.
    public var folderId: String?

    public init(
        name: String,
        description: String? = nil,
        config: CostGraphConfig,
        folderId: String? = nil
    ) {
        self.name = name
        self.description = description
        self.config = config
        self.folderId = folderId
    }
}
