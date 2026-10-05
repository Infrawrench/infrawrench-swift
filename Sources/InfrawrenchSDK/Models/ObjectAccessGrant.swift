/*
 * InfrawrenchSDK v1.52.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.52.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ObjectAccessGrant: Codable, Hashable, Sendable {
    public enum PrincipalKind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case member
        case role
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "member": self = .member
            case "role": self = .role
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .member: return "member"
            case .role: return "role"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [PrincipalKind] = [
            .member,
            .role,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var principalKind: PrincipalKind
    public var principalId: String
    public var principalLabel: String?
    public var level: ObjectAccessLevel
    /// The report creator's ownership, implied rather than stored. Never send it
    /// back.
    public var implicit: Bool

    public init(
        principalKind: PrincipalKind,
        principalId: String,
        principalLabel: String? = nil,
        level: ObjectAccessLevel,
        implicit: Bool
    ) {
        self.principalKind = principalKind
        self.principalId = principalId
        self.principalLabel = principalLabel
        self.level = level
        self.implicit = implicit
    }
}
