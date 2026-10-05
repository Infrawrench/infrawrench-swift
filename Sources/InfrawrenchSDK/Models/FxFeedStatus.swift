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

public struct FxFeedStatus: Codable, Hashable, Sendable {
    public enum Source: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case ecb
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "ecb": self = .ecb
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ecb: return "ecb"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Source] = [
            .ecb,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var source: Source
    public var sourceName: String
    public var sourceUrl: String
    /// Newest publication stored, or null before the first successful fetch.
    public var latestRateDate: String?
    public var earliestRateDate: String?
    /// Currencies in the newest publication, plus EUR. Any other currency is
    /// manual-only: it converts only at a rate you state.
    public var currencies: [String]
    public var lastSuccessAt: String?
    /// Error from the most recent failed fetch; cleared on success.
    public var lastError: String?

    public init(
        source: Source,
        sourceName: String,
        sourceUrl: String,
        latestRateDate: String? = nil,
        earliestRateDate: String? = nil,
        currencies: [String],
        lastSuccessAt: String? = nil,
        lastError: String? = nil
    ) {
        self.source = source
        self.sourceName = sourceName
        self.sourceUrl = sourceUrl
        self.latestRateDate = latestRateDate
        self.earliestRateDate = earliestRateDate
        self.currencies = currencies
        self.lastSuccessAt = lastSuccessAt
        self.lastError = lastError
    }
}
