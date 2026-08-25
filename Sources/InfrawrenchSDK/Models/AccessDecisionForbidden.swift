/*
 * InfrawrenchSDK v1.38.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.38.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AccessDecisionForbidden: Codable, Hashable, Sendable {
    public enum Code: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case selfApproval
        case exceedsApprover
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "self_approval": self = .selfApproval
            case "exceeds_approver": self = .exceedsApprover
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .selfApproval: return "self_approval"
            case .exceedsApprover: return "exceeds_approver"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Code] = [
            .selfApproval,
            .exceedsApprover,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var error: String
    public var code: Code
    /// For `exceeds_approver`: the permissions the approver does not hold.
    public var missing: [String]?

    public init(
        error: String,
        code: Code,
        missing: [String]? = nil
    ) {
        self.error = error
        self.code = code
        self.missing = missing
    }
}
