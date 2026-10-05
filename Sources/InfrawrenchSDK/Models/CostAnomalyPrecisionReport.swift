/*
 * InfrawrenchSDK v1.73.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.73.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostAnomalyPrecisionReport: Codable, Hashable, Sendable {
    public struct Period: Codable, Hashable, Sendable {
        public var month: String
        public var detected: Int
        public var suppressed: Int
        public var expected: Int
        public var unexpected: Int
        /// unexpected / (expected + unexpected); null when nothing has a verdict.
        public var precision: Double?

        public init(
            month: String,
            detected: Int,
            suppressed: Int,
            expected: Int,
            unexpected: Int,
            precision: Double? = nil
        ) {
            self.month = month
            self.detected = detected
            self.suppressed = suppressed
            self.expected = expected
            self.unexpected = unexpected
            self.precision = precision
        }
    }

    public struct Totals: Codable, Hashable, Sendable {
        public var detected: Int
        public var suppressed: Int
        public var expected: Int
        public var unexpected: Int
        /// unexpected / (expected + unexpected); null when nothing has a verdict.
        public var precision: Double?

        public init(
            detected: Int,
            suppressed: Int,
            expected: Int,
            unexpected: Int,
            precision: Double? = nil
        ) {
            self.detected = detected
            self.suppressed = suppressed
            self.expected = expected
            self.unexpected = unexpected
            self.precision = precision
        }
    }

    public struct Reason: Codable, Hashable, Sendable {
        public var reason: CostAnomalyFeedbackReason?
        public var count: Int

        public init(
            reason: CostAnomalyFeedbackReason? = nil,
            count: Int
        ) {
            self.reason = reason
            self.count = count
        }
    }

    public var months: Int
    public var periods: [Period]
    public var totals: Totals
    public var reasons: [Reason]

    public init(
        months: Int,
        periods: [Period],
        totals: Totals,
        reasons: [Reason]
    ) {
        self.months = months
        self.periods = periods
        self.totals = totals
        self.reasons = reasons
    }
}
