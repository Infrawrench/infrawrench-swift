/*
 * InfrawrenchSDK v1.2.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.2.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct MetricSeries: Codable, Hashable, Sendable {
    public struct Point: Codable, Hashable, Sendable {
        /// Unix epoch milliseconds.
        public var timestamp: Double
        public var value: Double

        public init(
            timestamp: Double,
            value: Double
        ) {
            self.timestamp = timestamp
            self.value = value
        }
    }

    public var label: String
    public var unit: String?
    public var points: [Point]

    public init(
        label: String,
        unit: String? = nil,
        points: [Point]
    ) {
        self.label = label
        self.unit = unit
        self.points = points
    }
}
