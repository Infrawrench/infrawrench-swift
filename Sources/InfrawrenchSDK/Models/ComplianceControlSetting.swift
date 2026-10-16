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

public struct ComplianceControlSetting: Codable, Hashable, Sendable {
    /// Framework registry id: `soc2` or `iso27001`.
    public var frameworkId: String
    public var controlId: String
    public var applicable: Bool
    /// Required when `applicable` is false.
    public var justification: String?
    /// A member who owns the control.
    public var ownerUserId: String?
    /// A team or alias, when the owner is not one member.
    public var ownerLabel: String?
    public var notes: String?
    public var updatedByUserId: String?
    public var updatedAt: String

    public init(
        frameworkId: String,
        controlId: String,
        applicable: Bool,
        justification: String? = nil,
        ownerUserId: String? = nil,
        ownerLabel: String? = nil,
        notes: String? = nil,
        updatedByUserId: String? = nil,
        updatedAt: String
    ) {
        self.frameworkId = frameworkId
        self.controlId = controlId
        self.applicable = applicable
        self.justification = justification
        self.ownerUserId = ownerUserId
        self.ownerLabel = ownerLabel
        self.notes = notes
        self.updatedByUserId = updatedByUserId
        self.updatedAt = updatedAt
    }
}
