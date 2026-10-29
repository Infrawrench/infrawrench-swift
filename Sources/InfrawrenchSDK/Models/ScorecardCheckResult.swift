/*
 * InfrawrenchSDK v1.85.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.85.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ScorecardCheckResult: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case pass
        case fail
        case notApplicable
        case error
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "pass": self = .pass
            case "fail": self = .fail
            case "not_applicable": self = .notApplicable
            case "error": self = .error
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .pass: return "pass"
            case .fail: return "fail"
            case .notApplicable: return "not_applicable"
            case .error: return "error"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .pass,
            .fail,
            .notApplicable,
            .error,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var checkId: String
    public var type: ScorecardCheckType
    public var name: String
    public var weight: Int
    /// `not_applicable` leaves the score's denominator; `error` (a feed that
    /// could not be read) counts as failing.
    public var status: Status
    public var detail: String?

    public init(
        checkId: String,
        type: ScorecardCheckType,
        name: String,
        weight: Int,
        status: Status,
        detail: String? = nil
    ) {
        self.checkId = checkId
        self.type = type
        self.name = name
        self.weight = weight
        self.status = status
        self.detail = detail
    }
}
