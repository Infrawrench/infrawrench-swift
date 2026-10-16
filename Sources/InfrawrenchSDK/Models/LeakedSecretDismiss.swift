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

public struct LeakedSecretDismiss: Codable, Hashable, Sendable {
    public enum Reason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case falsePositive
        case wontFix
        case usedInTests
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "false-positive": self = .falsePositive
            case "wont-fix": self = .wontFix
            case "used-in-tests": self = .usedInTests
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .falsePositive: return "false-positive"
            case .wontFix: return "wont-fix"
            case .usedInTests: return "used-in-tests"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Reason] = [
            .falsePositive,
            .wontFix,
            .usedInTests,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var reason: Reason
    public var comment: String?
    /// Close the finding on the scanner afterwards, when it can. Defaults to
    /// true.
    public var resolveUpstream: Bool?

    public init(
        reason: Reason,
        comment: String? = nil,
        resolveUpstream: Bool? = nil
    ) {
        self.reason = reason
        self.comment = comment
        self.resolveUpstream = resolveUpstream
    }
}
