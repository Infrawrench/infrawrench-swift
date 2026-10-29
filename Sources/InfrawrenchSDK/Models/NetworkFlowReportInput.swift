/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct NetworkFlowReportInput: Codable, Hashable, Sendable {
    public var name: String
    public var description: String?
    public var config: NetworkFlowReportConfig
    /// A report folder (`/cost-report-folders`, shared with cost reports); null
    /// is the top level.
    public var folderId: String?

    public init(
        name: String,
        description: String? = nil,
        config: NetworkFlowReportConfig,
        folderId: String? = nil
    ) {
        self.name = name
        self.description = description
        self.config = config
        self.folderId = folderId
    }
}
