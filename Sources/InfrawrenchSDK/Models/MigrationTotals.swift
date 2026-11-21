/*
 * InfrawrenchSDK v1.124.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.124.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MigrationTotals: Codable, Hashable, Sendable {
    public struct Comparable2: Codable, Hashable, Sendable {
        public var currency: String
        public var current: Double
        public var target: Double
        /// Target minus current over the rows priced on both sides. Negative
        /// saves money.
        public var pairedDelta: Double
        public var pairedRows: Int

        public init(
            currency: String,
            current: Double,
            target: Double,
            pairedDelta: Double,
            pairedRows: Int
        ) {
            self.currency = currency
            self.current = current
            self.target = target
            self.pairedDelta = pairedDelta
            self.pairedRows = pairedRows
        }
    }

    public var current: [MigrationMoney]
    public var target: [MigrationMoney]
    public var currentUnknown: Int
    public var targetUnknown: Int
    public var unmatchedCurrent: [MigrationMoney]
    /// Every figure in one currency (the org's display currency, or the one
    /// currency all figures are in); null when they cannot be converted.
    public var comparable: Comparable2?

    public init(
        current: [MigrationMoney],
        target: [MigrationMoney],
        currentUnknown: Int,
        targetUnknown: Int,
        unmatchedCurrent: [MigrationMoney],
        comparable: Comparable2? = nil
    ) {
        self.current = current
        self.target = target
        self.currentUnknown = currentUnknown
        self.targetUnknown = targetUnknown
        self.unmatchedCurrent = unmatchedCurrent
        self.comparable = comparable
    }
}
