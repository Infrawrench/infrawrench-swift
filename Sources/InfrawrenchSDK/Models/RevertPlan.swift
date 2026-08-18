/*
 * InfrawrenchSDK v1.29.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.29.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct RevertPlan: Codable, Hashable, Sendable {
    /// Every field of the recorded diff, in the order the event recorded them.
    public var fields: [RevertFieldPlan]
    /// The keys that would actually be written.
    public var revertibleFields: [String]
    public var revertible: Bool
    /// Why nothing would be written, or null when something would.
    public var blockedReason: String?

    public init(
        fields: [RevertFieldPlan],
        revertibleFields: [String],
        revertible: Bool,
        blockedReason: String? = nil
    ) {
        self.fields = fields
        self.revertibleFields = revertibleFields
        self.revertible = revertible
        self.blockedReason = blockedReason
    }
}
