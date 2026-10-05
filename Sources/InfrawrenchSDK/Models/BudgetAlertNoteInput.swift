/*
 * InfrawrenchSDK v1.69.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.69.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BudgetAlertNoteInput: Codable, Hashable, Sendable {
    /// What this firing was, in a sentence. The date and scope of the chart
    /// marker it creates are derived from the event (the day it fired, org-wide),
    /// never chosen by the caller.
    public var note: String

    public init(
        note: String
    ) {
        self.note = note
    }
}
