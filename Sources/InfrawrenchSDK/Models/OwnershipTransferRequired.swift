/*
 * InfrawrenchSDK v1.30.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.30.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct OwnershipTransferRequired: Codable, Hashable, Sendable {
    public enum Code: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case transferOwnershipRequired
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "transfer_ownership_required": self = .transferOwnershipRequired
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .transferOwnershipRequired: return "transfer_ownership_required"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Code] = [
            .transferOwnershipRequired,
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
    public var organizations: [OwnershipBlocker]

    public init(
        error: String,
        code: Code,
        organizations: [OwnershipBlocker]
    ) {
        self.error = error
        self.code = code
        self.organizations = organizations
    }
}
