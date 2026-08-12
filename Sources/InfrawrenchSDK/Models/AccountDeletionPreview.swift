/*
 * InfrawrenchSDK v1.21.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.21.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccountDeletionPreview: Codable, Hashable, Sendable {
    /// Deleted with the account — the caller is their only member.
    public var organizationsToDelete: [OrganizationRef]
    /// Survive; the caller's membership is removed.
    public var organizationsToLeave: [OrganizationRef]
    /// Non-empty means DELETE /api/profile will refuse until another owner is
    /// promoted.
    public var blockers: [OwnershipBlocker]

    public init(
        organizationsToDelete: [OrganizationRef],
        organizationsToLeave: [OrganizationRef],
        blockers: [OwnershipBlocker]
    ) {
        self.organizationsToDelete = organizationsToDelete
        self.organizationsToLeave = organizationsToLeave
        self.blockers = blockers
    }
}
