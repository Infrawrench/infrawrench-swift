/*
 * InfrawrenchSDK v1.26.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.26.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostReportRunResult: Codable, Hashable, Sendable {
    public var reportId: String
    public var name: String
    public var from: String
    public var to: String
    public var result: CostQueryResponse

    public init(
        reportId: String,
        name: String,
        from: String,
        to: String,
        result: CostQueryResponse
    ) {
        self.reportId = reportId
        self.name = name
        self.from = from
        self.to = to
        self.result = result
    }
}
