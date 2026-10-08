/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct BusinessMetricImportPreview: Codable, Hashable, Sendable {
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

    public struct DryRun: Codable, Hashable, Sendable {
        public var valid: Bool
        public var message: String
        public var bytesProcessed: Double?

        public init(
            valid: Bool,
            message: String,
            bytesProcessed: Double? = nil
        ) {
            self.valid = valid
            self.message = message
            self.bytesProcessed = bytesProcessed
        }
    }

    public var from: String
    public var to: String
    public var values: [Value]
    public var pointsRead: Int
    public var days: Int
    public var notes: [String]
    public var durationMs: Int
    public var dryRun: DryRun?

    public init(
        from: String,
        to: String,
        values: [Value],
        pointsRead: Int,
        days: Int,
        notes: [String],
        durationMs: Int,
        dryRun: DryRun? = nil
    ) {
        self.from = from
        self.to = to
        self.values = values
        self.pointsRead = pointsRead
        self.days = days
        self.notes = notes
        self.durationMs = durationMs
        self.dryRun = dryRun
    }
}
