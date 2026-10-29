/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Reusable invoice settings: addressee, recipients, tax, payment terms,
/// remittance details and numbering, shared by every customer assigned to it. The
/// profile wins where it sets a field and the customer fills the gaps; recipients
/// are the union of both.
///
/// Drafts follow a profile edit. **Approved invoices do not**: approval writes a
/// resolved copy onto the invoice (`Invoice.billing`), so a new bank account or
/// tax rate reaches the next invoice and no issued one.
public struct BillingProfile: Codable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var legalName: String?
    public var address: String?
    public var taxId: String?
    public var poNumber: String?
    public var toEmails: [String]
    public var ccEmails: [String]
    public var currency: String?
    public var paymentTermsDays: Int?
    public var numberPrefix: String
    public var numberIncludesYear: Bool
    public var numberStart: Int
    public var taxRates: [BillingProfileTaxRate]
    public var bank: BillingProfileBank?
    public var footer: String?
    public var logo: String?
    /// Live customers assigned to this profile.
    public var managedAccountIds: [String]
    public var createdByUserId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        name: String,
        legalName: String? = nil,
        address: String? = nil,
        taxId: String? = nil,
        poNumber: String? = nil,
        toEmails: [String],
        ccEmails: [String],
        currency: String? = nil,
        paymentTermsDays: Int? = nil,
        numberPrefix: String,
        numberIncludesYear: Bool,
        numberStart: Int,
        taxRates: [BillingProfileTaxRate],
        bank: BillingProfileBank? = nil,
        footer: String? = nil,
        logo: String? = nil,
        managedAccountIds: [String],
        createdByUserId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.name = name
        self.legalName = legalName
        self.address = address
        self.taxId = taxId
        self.poNumber = poNumber
        self.toEmails = toEmails
        self.ccEmails = ccEmails
        self.currency = currency
        self.paymentTermsDays = paymentTermsDays
        self.numberPrefix = numberPrefix
        self.numberIncludesYear = numberIncludesYear
        self.numberStart = numberStart
        self.taxRates = taxRates
        self.bank = bank
        self.footer = footer
        self.logo = logo
        self.managedAccountIds = managedAccountIds
        self.createdByUserId = createdByUserId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
