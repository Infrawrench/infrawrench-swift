/*
 * InfrawrenchSDK v1.0.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.0.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ShowbackReport: Codable, Hashable, Sendable {
    public struct Centre: Codable, Hashable, Sendable {
        /// Null for the synthetic "Unallocated" bucket.
        public var costCentreId: String?
        public var name: String
        /// Currency code → amount in the currency's major unit.
        public var totals: [String: Double]

        public init(
            costCentreId: String? = nil,
            name: String,
            totals: [String: Double]
        ) {
            self.costCentreId = costCentreId
            self.name = name
            self.totals = totals
        }
    }

    public var from: String
    public var to: String
    public var currencies: [String]
    public var centres: [Centre]

    public init(
        from: String,
        to: String,
        currencies: [String],
        centres: [Centre]
    ) {
        self.from = from
        self.to = to
        self.currencies = currencies
        self.centres = centres
    }
}
