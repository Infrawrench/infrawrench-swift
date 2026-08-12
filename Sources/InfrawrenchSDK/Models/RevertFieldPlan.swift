/*
 * InfrawrenchSDK v1.20.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.20.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RevertFieldPlan: Codable, Hashable, Sendable {
    public var field: String
    /// The value a revert would write.
    public var revertTo: JSONValue?
    /// The value the recorded change set.
    public var changedTo: JSONValue?
    /// The value the resource holds right now, read live.
    public var current: JSONValue?
    public var status: RevertFieldStatus
    /// One sentence explaining the status.
    public var reason: String

    public init(
        field: String,
        revertTo: JSONValue? = nil,
        changedTo: JSONValue? = nil,
        current: JSONValue? = nil,
        status: RevertFieldStatus,
        reason: String
    ) {
        self.field = field
        self.revertTo = revertTo
        self.changedTo = changedTo
        self.current = current
        self.status = status
        self.reason = reason
    }
}
