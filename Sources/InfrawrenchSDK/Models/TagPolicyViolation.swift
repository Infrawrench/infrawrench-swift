/*
 * InfrawrenchSDK v0.37.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.37.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct TagPolicyViolation: Codable, Hashable, Sendable {
    public enum Reason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case missing
        case valueNotAllowed
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "missing": self = .missing
            case "value_not_allowed": self = .valueNotAllowed
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .missing: return "missing"
            case .valueNotAllowed: return "value_not_allowed"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Reason] = [
            .missing,
            .valueNotAllowed,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var key: String
    public var reason: Reason
    public var value: String?
    public var allowedValues: [String]?

    public init(
        key: String,
        reason: Reason,
        value: String? = nil,
        allowedValues: [String]? = nil
    ) {
        self.key = key
        self.reason = reason
        self.value = value
        self.allowedValues = allowedValues
    }
}
