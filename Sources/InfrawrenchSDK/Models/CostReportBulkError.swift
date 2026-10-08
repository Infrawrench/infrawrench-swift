/*
 * InfrawrenchSDK v1.78.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.78.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostReportBulkError: Codable, Hashable, Sendable {
    public var error: String
    /// Every item that blocked the request. Present when the body was
    /// well-formed.
    public var problems: [CostReportBulkProblem]?
    public var issues: [JSONValue]?

    public init(
        error: String,
        problems: [CostReportBulkProblem]? = nil,
        issues: [JSONValue]? = nil
    ) {
        self.error = error
        self.problems = problems
        self.issues = issues
    }
}
