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

public struct ScorecardCheck: Codable, Hashable, Sendable {
    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum ParamsValue: Codable, Hashable, Sendable {
        case double(Double)
        case array([String])
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            if let value = try? container.decode([String].self) {
                self = .array(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .double(let value): try container.encode(value)
            case .array(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    /// Stable within the scorecard.
    public var id: String
    public var type: ScorecardCheckType
    /// Display override; the type's label when null.
    public var name: String?
    /// 1 to 10.
    public var weight: Int
    /// Type parameters: `minBudgetRemainingPercent` (0-100), `drillWithinDays`
    /// (1-730), `severities` (critical/high/medium/low), `tags` (tag keys),
    /// `maxFailureRatePercent` (0-100), `windowDays` (1-90).
    public var params: [String: ParamsValue]

    public init(
        id: String,
        type: ScorecardCheckType,
        name: String? = nil,
        weight: Int,
        params: [String: ParamsValue]
    ) {
        self.id = id
        self.type = type
        self.name = name
        self.weight = weight
        self.params = params
    }
}
