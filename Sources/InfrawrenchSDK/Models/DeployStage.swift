/*
 * InfrawrenchSDK v1.17.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.17.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public enum DeployStage: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
    case plan
    case dockerfile
    case build
    case deploy
    case destroy
    /// A value the API added after this SDK was generated. Kept rather than
    /// rejected, so a new server-side value cannot break decoding.
    case unrecognized(String)

    public init(rawValue: String) {
        switch rawValue {
        case "plan": self = .plan
        case "dockerfile": self = .dockerfile
        case "build": self = .build
        case "deploy": self = .deploy
        case "destroy": self = .destroy
        default: self = .unrecognized(rawValue)
        }
    }

    public var rawValue: String {
        switch self {
        case .plan: return "plan"
        case .dockerfile: return "dockerfile"
        case .build: return "build"
        case .deploy: return "deploy"
        case .destroy: return "destroy"
        case .unrecognized(let value): return value
        }
    }

    /// Every value the spec declares. `unrecognized` is deliberately absent.
    public static let allKnownCases: [DeployStage] = [
        .plan,
        .dockerfile,
        .build,
        .deploy,
        .destroy,
    ]

    public init(from decoder: any Decoder) throws {
        self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
