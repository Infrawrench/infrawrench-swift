/*
 * InfrawrenchSDK v1.63.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.63.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricValuesInput: Codable, Hashable, Sendable {
    public struct Value: Codable, Hashable, Sendable {
        public var date: String
        public var value: Double
        public var label: String?

        public init(
            date: String,
            value: Double,
            label: String? = nil
        ) {
            self.date = date
            self.value = value
            self.label = label
        }
    }

    /// Days to report. **Re-reporting a day restates it rather than adding to
    /// it**, so an unattended nightly job is safe to retry — an accumulating
    /// write would double every number the first time the job re-ran. A batch
    /// naming the same day twice keeps the last value, applying the same rule
    /// within a batch that restatement applies between them.
    public var values: [Value]

    public init(
        values: [Value]
    ) {
        self.values = values
    }
}
