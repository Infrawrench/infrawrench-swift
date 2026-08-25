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

public enum SshSignAlgorithm: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case sshEd25519
    case sshRsa
    case rsaSha2256
    case rsaSha2512
    case ecdsaSha2Nistp256
    case ecdsaSha2Nistp384
    case ecdsaSha2Nistp521
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "ssh-ed25519": self = .sshEd25519
        case "ssh-rsa": self = .sshRsa
        case "rsa-sha2-256": self = .rsaSha2256
        case "rsa-sha2-512": self = .rsaSha2512
        case "ecdsa-sha2-nistp256": self = .ecdsaSha2Nistp256
        case "ecdsa-sha2-nistp384": self = .ecdsaSha2Nistp384
        case "ecdsa-sha2-nistp521": self = .ecdsaSha2Nistp521
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .sshEd25519: return "ssh-ed25519"
        case .sshRsa: return "ssh-rsa"
        case .rsaSha2256: return "rsa-sha2-256"
        case .rsaSha2512: return "rsa-sha2-512"
        case .ecdsaSha2Nistp256: return "ecdsa-sha2-nistp256"
        case .ecdsaSha2Nistp384: return "ecdsa-sha2-nistp384"
        case .ecdsaSha2Nistp521: return "ecdsa-sha2-nistp521"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [SshSignAlgorithm] = [
        .sshEd25519,
        .sshRsa,
        .rsaSha2256,
        .rsaSha2512,
        .ecdsaSha2Nistp256,
        .ecdsaSha2Nistp384,
        .ecdsaSha2Nistp521,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
