/*
 * InfrawrenchSDK v1.33.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.33.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct InvoiceSummary: Codable, Hashable, Sendable {
    public var id: String
    public var managedAccountId: String
    public var managedAccountName: String
    /// `INV-2026-0001`. Null while draft — numbers are assigned at approval so a
    /// deleted draft cannot leave a gap in the sequence.
    public var number: String?
    public var status: InvoiceStatus
    public var periodFrom: String
    public var periodTo: String
    public var currency: String
    public var totals: InvoiceTotals?
    public var issuedAt: String?
    public var sentAt: String?
    public var delivery: InvoiceDelivery?
    public var voidedAt: String?
    public var voidReason: String?
    public var supersedesInvoiceId: String?
    public var supersededByInvoiceId: String?
    public var createdAt: String
    public var updatedAt: String

    public init(
        id: String,
        managedAccountId: String,
        managedAccountName: String,
        number: String? = nil,
        status: InvoiceStatus,
        periodFrom: String,
        periodTo: String,
        currency: String,
        totals: InvoiceTotals? = nil,
        issuedAt: String? = nil,
        sentAt: String? = nil,
        delivery: InvoiceDelivery? = nil,
        voidedAt: String? = nil,
        voidReason: String? = nil,
        supersedesInvoiceId: String? = nil,
        supersededByInvoiceId: String? = nil,
        createdAt: String,
        updatedAt: String
    ) {
        self.id = id
        self.managedAccountId = managedAccountId
        self.managedAccountName = managedAccountName
        self.number = number
        self.status = status
        self.periodFrom = periodFrom
        self.periodTo = periodTo
        self.currency = currency
        self.totals = totals
        self.issuedAt = issuedAt
        self.sentAt = sentAt
        self.delivery = delivery
        self.voidedAt = voidedAt
        self.voidReason = voidReason
        self.supersedesInvoiceId = supersedesInvoiceId
        self.supersededByInvoiceId = supersededByInvoiceId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
