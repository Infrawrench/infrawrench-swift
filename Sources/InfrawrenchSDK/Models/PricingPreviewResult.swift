/*
 * InfrawrenchSDK v1.67.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.67.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PricingPreviewResult: Codable, Hashable, Sendable {
    public struct Change: Codable, Hashable, Sendable {
        public var pluginId: String
        public var service: String
        public var accountName: String
        public var chargeType: String
        public var currency: String
        public var collected: Double
        public var before: Double
        public var after: Double

        public init(
            pluginId: String,
            service: String,
            accountName: String,
            chargeType: String,
            currency: String,
            collected: Double,
            before: Double,
            after: Double
        ) {
            self.pluginId = pluginId
            self.service = service
            self.accountName = accountName
            self.chargeType = chargeType
            self.currency = currency
            self.collected = collected
            self.before = before
            self.after = after
        }
    }

    public var month: String
    public var from: String
    public var to: String
    public var managedAccountId: String?
    public var collected: [String: Double]
    /// Priced without the candidate: the saved rules minus `ruleId`, with the
    /// saved settings.
    public var before: [String: Double]
    /// Priced with the candidate swapped in.
    public var after: [String: Double]
    public var effects: [PricingEffect]
    public var coverage: RerateCoverage?
    public var warnings: [String]
    public var expressionFailures: [PricingExpressionFailure]
    /// The lines that moved most, largest change first, at most 25.
    public var changes: [Change]
    public var lineCount: Int

    public init(
        month: String,
        from: String,
        to: String,
        managedAccountId: String? = nil,
        collected: [String: Double],
        before: [String: Double],
        after: [String: Double],
        effects: [PricingEffect],
        coverage: RerateCoverage? = nil,
        warnings: [String],
        expressionFailures: [PricingExpressionFailure],
        changes: [Change],
        lineCount: Int
    ) {
        self.month = month
        self.from = from
        self.to = to
        self.managedAccountId = managedAccountId
        self.collected = collected
        self.before = before
        self.after = after
        self.effects = effects
        self.coverage = coverage
        self.warnings = warnings
        self.expressionFailures = expressionFailures
        self.changes = changes
        self.lineCount = lineCount
    }
}
