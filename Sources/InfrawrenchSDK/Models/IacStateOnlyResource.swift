/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IacStateOnlyResource: Codable, Hashable, Sendable {
    public struct Candidate: Codable, Hashable, Sendable {
        public var pluginId: PluginId
        public var resourceTypeId: String

        public init(
            pluginId: PluginId,
            resourceTypeId: String
        ) {
            self.pluginId = pluginId
            self.resourceTypeId = resourceTypeId
        }
    }

    public enum Reason: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case noInventoryMatch
        case unknownTerraformType
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "no-inventory-match": self = .noInventoryMatch
            case "unknown-terraform-type": self = .unknownTerraformType
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .noInventoryMatch: return "no-inventory-match"
            case .unknownTerraformType: return "unknown-terraform-type"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Reason] = [
            .noInventoryMatch,
            .unknownTerraformType,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var address: String
    public var terraformType: String
    public var identifiers: [String]
    public var candidates: [Candidate]
    public var reason: Reason

    public init(
        address: String,
        terraformType: String,
        identifiers: [String],
        candidates: [Candidate],
        reason: Reason
    ) {
        self.address = address
        self.terraformType = terraformType
        self.identifiers = identifiers
        self.candidates = candidates
        self.reason = reason
    }
}
