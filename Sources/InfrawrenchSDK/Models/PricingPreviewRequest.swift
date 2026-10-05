/*
 * InfrawrenchSDK v1.70.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.70.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PricingPreviewRequest: Codable, Hashable, Sendable {
    public var rule: BillingRuleInput?
    /// With `rule`, the saved rule it replaces (an edit being previewed). Alone,
    /// previews the saved rule as it stands. Either way `before` is priced
    /// without this rule.
    public var ruleId: String?
    /// Price this customer's scope with their settings. Absent prices the
    /// organisation's whole spend as one customer. Naming a customer also needs
    /// `invoices:read`.
    public var managedAccountId: String?
    public var pricing: ManagedAccountPricing?
    /// `YYYY-MM`; defaults to last calendar month.
    public var month: String?

    public init(
        rule: BillingRuleInput? = nil,
        ruleId: String? = nil,
        managedAccountId: String? = nil,
        pricing: ManagedAccountPricing? = nil,
        month: String? = nil
    ) {
        self.rule = rule
        self.ruleId = ruleId
        self.managedAccountId = managedAccountId
        self.pricing = pricing
        self.month = month
    }
}
