/*
 * InfrawrenchSDK v1.16.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.16.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct ConnectEnvDeployRequest: Codable, Hashable, Sendable {
    public enum Format: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case dotenv
        case profile
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "dotenv": self = .dotenv
            case "profile": self = .profile
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .dotenv: return "dotenv"
            case .profile: return "profile"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Format] = [
            .dotenv,
            .profile,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    public var sourceAccountId: String
    public var sourceResourceId: ResourceId
    public var sourcePluginId: String
    public var sourceResourceTypeId: String
    public var sourceExternalId: String?
    public var targetSshHost: String
    public var sshKeyId: String
    public var sshUsername: String
    public var templateId: String
    public var keyOverrides: [String: String]
    public var format: Format
    public var filePath: String
    public var append: Bool

    public init(
        sourceAccountId: String,
        sourceResourceId: ResourceId,
        sourcePluginId: String,
        sourceResourceTypeId: String,
        sourceExternalId: String? = nil,
        targetSshHost: String,
        sshKeyId: String,
        sshUsername: String,
        templateId: String,
        keyOverrides: [String: String],
        format: Format,
        filePath: String,
        append: Bool
    ) {
        self.sourceAccountId = sourceAccountId
        self.sourceResourceId = sourceResourceId
        self.sourcePluginId = sourcePluginId
        self.sourceResourceTypeId = sourceResourceTypeId
        self.sourceExternalId = sourceExternalId
        self.targetSshHost = targetSshHost
        self.sshKeyId = sshKeyId
        self.sshUsername = sshUsername
        self.templateId = templateId
        self.keyOverrides = keyOverrides
        self.format = format
        self.filePath = filePath
        self.append = append
    }
}
