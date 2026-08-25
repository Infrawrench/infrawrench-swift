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

public struct IacState: Codable, Hashable, Sendable {
    public enum Format: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case tfstate
        case showJson
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "tfstate": self = .tfstate
            case "show-json": self = .showJson
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .tfstate: return "tfstate"
            case .showJson: return "show-json"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Format] = [
            .tfstate,
            .showJson,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var id: String
    /// User-supplied name for this state, e.g. "prod / us-east-1".
    public var label: String
    /// The account this state covers, or null when it covers the whole
    /// organization.
    public var accountId: String?
    public var accountName: String?
    /// Which document shape was uploaded: a raw state file, or `terraform show
    /// -json`.
    public var format: Format
    /// The document's own version — "4" for a state file, "1.0"-style otherwise.
    public var formatVersion: String
    public var terraformVersion: String?
    /// State file serial; null for show output.
    public var serial: Int?
    /// State file lineage; null for show output.
    public var lineage: String?
    /// Managed resource instances recorded.
    public var resourceCount: Int
    /// Data-source entries, recorded but never matched against inventory.
    public var dataSourceCount: Int
    /// Attribute values dropped because the state marked them sensitive.
    /// Redaction happens at parse time — no sensitive value is ever stored.
    public var redactedAttributeCount: Int
    public var parseWarnings: [String]
    public var uploadedByUserId: String?
    public var uploadedByName: String?
    public var createdAt: String

    public init(
        id: String,
        label: String,
        accountId: String? = nil,
        accountName: String? = nil,
        format: Format,
        formatVersion: String,
        terraformVersion: String? = nil,
        serial: Int? = nil,
        lineage: String? = nil,
        resourceCount: Int,
        dataSourceCount: Int,
        redactedAttributeCount: Int,
        parseWarnings: [String],
        uploadedByUserId: String? = nil,
        uploadedByName: String? = nil,
        createdAt: String
    ) {
        self.id = id
        self.label = label
        self.accountId = accountId
        self.accountName = accountName
        self.format = format
        self.formatVersion = formatVersion
        self.terraformVersion = terraformVersion
        self.serial = serial
        self.lineage = lineage
        self.resourceCount = resourceCount
        self.dataSourceCount = dataSourceCount
        self.redactedAttributeCount = redactedAttributeCount
        self.parseWarnings = parseWarnings
        self.uploadedByUserId = uploadedByUserId
        self.uploadedByName = uploadedByName
        self.createdAt = createdAt
    }
}
