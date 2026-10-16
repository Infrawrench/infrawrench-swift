/*
 * InfrawrenchSDK v1.82.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.82.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricForecastValuesInput: Codable, Hashable, Sendable {
    public struct Value: Codable, Hashable, Sendable {
        public var date: String
        public var value: Double

        public init(
            date: String,
            value: Double
        ) {
            self.date = date
            self.value = value
        }
    }

    public var values: [Value]

    public init(
        values: [Value]
    ) {
        self.values = values
    }
}
