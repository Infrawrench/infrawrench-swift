/*
 * InfrawrenchSDK v1.35.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.35.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct IacReconciledResource: Codable, Hashable, Sendable {
    public enum Status: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case managed
        case drifted
        case unmanaged
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "managed": self = .managed
            case "drifted": self = .drifted
            case "unmanaged": self = .unmanaged
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .managed: return "managed"
            case .drifted: return "drifted"
            case .unmanaged: return "unmanaged"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Status] = [
            .managed,
            .drifted,
            .unmanaged,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public enum MatchedBy: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case importId
        case externalId
        case identifier
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "import-id": self = .importId
            case "external-id": self = .externalId
            case "identifier": self = .identifier
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .importId: return "import-id"
            case .externalId: return "external-id"
            case .identifier: return "identifier"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [MatchedBy] = [
            .importId,
            .externalId,
            .identifier,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var resourceId: String
    public var pluginId: PluginId
    public var resourceTypeId: String
    public var accountId: String
    public var displayName: String
    public var externalId: String?
    /// `managed`: matched a state entry and agrees with it. `drifted`: matched,
    /// but live fields differ. `unmanaged`: in inventory, absent from state —
    /// somebody made it by hand.
    public var status: Status
    public var terraformType: String?
    public var terraformAddress: String?
    /// How the match was made, so it can be argued with.
    public var matchedBy: MatchedBy?
    public var drift: [IacFieldChange]
    /// Set when no Terraform block could be produced for this resource, which
    /// makes its drift unknowable. Never reported as "no drift".
    public var unmappableReason: String?
    /// Resource owner annotation, populated for unmanaged resources.
    public var owner: JSONValue?
    /// When the change timeline first recorded this resource appearing.
    public var firstSeenAt: String?

    public init(
        resourceId: String,
        pluginId: PluginId,
        resourceTypeId: String,
        accountId: String,
        displayName: String,
        externalId: String? = nil,
        status: Status,
        terraformType: String? = nil,
        terraformAddress: String? = nil,
        matchedBy: MatchedBy? = nil,
        drift: [IacFieldChange],
        unmappableReason: String? = nil,
        owner: JSONValue? = nil,
        firstSeenAt: String? = nil
    ) {
        self.resourceId = resourceId
        self.pluginId = pluginId
        self.resourceTypeId = resourceTypeId
        self.accountId = accountId
        self.displayName = displayName
        self.externalId = externalId
        self.status = status
        self.terraformType = terraformType
        self.terraformAddress = terraformAddress
        self.matchedBy = matchedBy
        self.drift = drift
        self.unmappableReason = unmappableReason
        self.owner = owner
        self.firstSeenAt = firstSeenAt
    }
}
