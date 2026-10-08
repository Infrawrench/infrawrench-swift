/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Somebody's explanation of this firing. Null while there is none.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct BudgetAlertNote: Codable, Hashable, Sendable {
    public var text: String
    /// When the note as it now reads was written; a rewrite restamps it.
    public var notedAt: String
    public var notedByUserId: String?
    /// The author's display name, or email when they have none.
    public var notedByName: String?
    /// The org-wide cost annotation the note drew on the charts at the day the
    /// alert fired (see /cost-annotations). Null once that marker is deleted; the
    /// note itself stays.
    public var annotationId: String?

    public init(
        text: String,
        notedAt: String,
        notedByUserId: String? = nil,
        notedByName: String? = nil,
        annotationId: String? = nil
    ) {
        self.text = text
        self.notedAt = notedAt
        self.notedByUserId = notedByUserId
        self.notedByName = notedByName
        self.annotationId = annotationId
    }
}
