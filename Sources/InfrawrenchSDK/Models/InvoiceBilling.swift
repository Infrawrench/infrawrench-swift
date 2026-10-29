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

/// Addressee, recipients, terms and remittance details. Null on invoices approved
/// before billing profiles existed.
///
/// The API may send `null` in place of this, which is why references to it are
/// optional.
public struct InvoiceBilling: Codable, Hashable, Sendable {
    public var profileId: String?
    public var profileName: String?
    public var legalName: String
    public var attention: String?
    public var address: String?
    public var taxId: String?
    public var poNumber: String?
    public var to: [String]
    public var cc: [String]
    public var paymentTermsDays: Int?
    public var issueDate: String
    public var dueDate: String?
    public var taxRates: [BillingProfileTaxRate]
    public var bank: BillingProfileBank?
    public var footer: String?
    /// SHA-256 of the logo printed on the PDF, frozen with the invoice.
    public var logoId: String?
    public var numberPrefix: String
    public var numberIncludesYear: Bool

    public init(
        profileId: String? = nil,
        profileName: String? = nil,
        legalName: String,
        attention: String? = nil,
        address: String? = nil,
        taxId: String? = nil,
        poNumber: String? = nil,
        to: [String],
        cc: [String],
        paymentTermsDays: Int? = nil,
        issueDate: String,
        dueDate: String? = nil,
        taxRates: [BillingProfileTaxRate],
        bank: BillingProfileBank? = nil,
        footer: String? = nil,
        logoId: String? = nil,
        numberPrefix: String,
        numberIncludesYear: Bool
    ) {
        self.profileId = profileId
        self.profileName = profileName
        self.legalName = legalName
        self.attention = attention
        self.address = address
        self.taxId = taxId
        self.poNumber = poNumber
        self.to = to
        self.cc = cc
        self.paymentTermsDays = paymentTermsDays
        self.issueDate = issueDate
        self.dueDate = dueDate
        self.taxRates = taxRates
        self.bank = bank
        self.footer = footer
        self.logoId = logoId
        self.numberPrefix = numberPrefix
        self.numberIncludesYear = numberIncludesYear
    }
}
