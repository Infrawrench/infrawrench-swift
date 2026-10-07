/*
 * InfrawrenchSDK v1.76.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.76.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AlertEmailSettings: Codable, Hashable, Sendable {
    public enum ExternalPolicy: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case memberDomains
        case any
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "member-domains": self = .memberDomains
            case "any": self = .any
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .memberDomains: return "member-domains"
            case .any: return "any"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [ExternalPolicy] = [
            .memberDomains,
            .any,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// `member-domains` (the default): an extra address must be on a domain one
    /// of the organization's members signs in with, or one listed in
    /// `allowedDomains`. `any`: no restriction.
    public var externalPolicy: ExternalPolicy
    /// Extra domains accepted under `member-domains`, without the `@`.
    public var allowedDomains: [String]

    public init(
        externalPolicy: ExternalPolicy,
        allowedDomains: [String]
    ) {
        self.externalPolicy = externalPolicy
        self.allowedDomains = allowedDomains
    }
}
