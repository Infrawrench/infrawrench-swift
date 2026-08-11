/*
 * InfrawrenchSDK v1.13.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.13.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct SshFanoutRunRequest: Codable, Hashable, Sendable {
    public struct Target: Codable, Hashable, Sendable {
        public enum Kind: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
            case account
            case resource
            /// A value the API added after this SDK was generated. Kept rather
            /// than rejected, so a new server-side value cannot break decoding.
            case unrecognized(String)

            public init(rawValue: String) {
                switch rawValue {
                case "account": self = .account
                case "resource": self = .resource
                default: self = .unrecognized(rawValue)
                }
            }

            public var rawValue: String {
                switch self {
                case .account: return "account"
                case .resource: return "resource"
                case .unrecognized(let value): return value
                }
            }

            /// Every value the spec declares. `unrecognized` is deliberately absent.
            public static let allKnownCases: [Kind] = [
                .account,
                .resource,
            ]

            public init(from decoder: any Decoder) throws {
                self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
            }

            public func encode(to encoder: any Encoder) throws {
                var container = encoder.singleValueContainer()
                try container.encode(rawValue)
            }
        }

        public var kind: Kind
        public var id: String

        public init(
            kind: Kind,
            id: String
        ) {
            self.kind = kind
            self.id = id
        }
    }

    public var command: String
    public var targets: [Target]
    public var sshKeyId: String?
    public var username: String?
    public var concurrency: Int?

    public init(
        command: String,
        targets: [Target],
        sshKeyId: String? = nil,
        username: String? = nil,
        concurrency: Int? = nil
    ) {
        self.command = command
        self.targets = targets
        self.sshKeyId = sshKeyId
        self.username = username
        self.concurrency = concurrency
    }
}
