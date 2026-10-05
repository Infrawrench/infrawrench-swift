/*
 * InfrawrenchSDK v1.57.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.57.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AiSourceMatchStats: Codable, Hashable, Sendable {
    public var sourceId: String
    public var name: String
    public var days: Int
    public var requests: Double
    public var matchedRequests: Double
    public var ambiguousRequests: Double
    public var unmatchedRequests: Double
    public var skippedRecords: Double
    public var currency: String?
    public var attributedAmount: Double
    public var billedAmount: Double
    public var coveragePercent: Double?
    public var degradedDays: Int
    public var truncatedDays: Int

    public init(
        sourceId: String,
        name: String,
        days: Int,
        requests: Double,
        matchedRequests: Double,
        ambiguousRequests: Double,
        unmatchedRequests: Double,
        skippedRecords: Double,
        currency: String? = nil,
        attributedAmount: Double,
        billedAmount: Double,
        coveragePercent: Double? = nil,
        degradedDays: Int,
        truncatedDays: Int
    ) {
        self.sourceId = sourceId
        self.name = name
        self.days = days
        self.requests = requests
        self.matchedRequests = matchedRequests
        self.ambiguousRequests = ambiguousRequests
        self.unmatchedRequests = unmatchedRequests
        self.skippedRecords = skippedRecords
        self.currency = currency
        self.attributedAmount = attributedAmount
        self.billedAmount = billedAmount
        self.coveragePercent = coveragePercent
        self.degradedDays = degradedDays
        self.truncatedDays = truncatedDays
    }
}
