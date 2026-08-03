/*
 * InfrawrenchSDK v0.28.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 0.28.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public enum SshKeyType: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case sshRsa
    case sshEd25519
    case sshDss
    case ecdsaSha2Nistp256
    case ecdsaSha2Nistp384
    case ecdsaSha2Nistp521
    case skSshEd25519OpensshCom
    case skEcdsaSha2Nistp256OpensshCom
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "ssh-rsa": self = .sshRsa
        case "ssh-ed25519": self = .sshEd25519
        case "ssh-dss": self = .sshDss
        case "ecdsa-sha2-nistp256": self = .ecdsaSha2Nistp256
        case "ecdsa-sha2-nistp384": self = .ecdsaSha2Nistp384
        case "ecdsa-sha2-nistp521": self = .ecdsaSha2Nistp521
        case "sk-ssh-ed25519@openssh.com": self = .skSshEd25519OpensshCom
        case "sk-ecdsa-sha2-nistp256@openssh.com": self = .skEcdsaSha2Nistp256OpensshCom
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .sshRsa: return "ssh-rsa"
        case .sshEd25519: return "ssh-ed25519"
        case .sshDss: return "ssh-dss"
        case .ecdsaSha2Nistp256: return "ecdsa-sha2-nistp256"
        case .ecdsaSha2Nistp384: return "ecdsa-sha2-nistp384"
        case .ecdsaSha2Nistp521: return "ecdsa-sha2-nistp521"
        case .skSshEd25519OpensshCom: return "sk-ssh-ed25519@openssh.com"
        case .skEcdsaSha2Nistp256OpensshCom: return "sk-ecdsa-sha2-nistp256@openssh.com"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [SshKeyType] = [
        .sshRsa,
        .sshEd25519,
        .sshDss,
        .ecdsaSha2Nistp256,
        .ecdsaSha2Nistp384,
        .ecdsaSha2Nistp521,
        .skSshEd25519OpensshCom,
        .skEcdsaSha2Nistp256OpensshCom,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
