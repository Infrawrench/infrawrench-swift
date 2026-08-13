/*
 * InfrawrenchSDK v1.25.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.25.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// A new invoice is always a draft. There is no status field and no scope field:
/// generating and issuing are two acts, and the scope comes from the customer.
public struct InvoiceInput: Codable, Hashable, Sendable {
    public var managedAccountId: String
    public var periodFrom: String
    public var periodTo: String
    public var notes: String?
    /// The void invoice this one corrects. The original must already be void — a
    /// correction that leaves the original standing means the customer holds two
    /// live invoices for one period.
    public var supersedesInvoiceId: String?

    public init(
        managedAccountId: String,
        periodFrom: String,
        periodTo: String,
        notes: String? = nil,
        supersedesInvoiceId: String? = nil
    ) {
        self.managedAccountId = managedAccountId
        self.periodFrom = periodFrom
        self.periodTo = periodTo
        self.notes = notes
        self.supersedesInvoiceId = supersedesInvoiceId
    }
}
