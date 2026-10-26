/*
 * InfrawrenchSDK v1.84.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.84.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ComplianceControlSettingInput: Codable, Hashable, Sendable {
    public var applicable: Bool
    public var justification: String?
    public var ownerUserId: String?
    public var ownerLabel: String?
    public var notes: String?

    public init(
        applicable: Bool,
        justification: String? = nil,
        ownerUserId: String? = nil,
        ownerLabel: String? = nil,
        notes: String? = nil
    ) {
        self.applicable = applicable
        self.justification = justification
        self.ownerUserId = ownerUserId
        self.ownerLabel = ownerLabel
        self.notes = notes
    }
}
