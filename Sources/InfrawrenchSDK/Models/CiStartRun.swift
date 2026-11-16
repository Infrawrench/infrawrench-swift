/*
 * InfrawrenchSDK v1.114.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.114.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CiStartRun: Codable, Hashable, Sendable {
    /// The spec allows several shapes here. Decoding tries the branches in spec
    /// order, so the most specific match wins.
    public enum InputsValue: Codable, Hashable, Sendable {
        case string(String)
        case bool(Bool)
        case double(Double)
        /// A shape none of the branches above matched.
        case other(JSONValue)

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let value = try? container.decode(String.self) {
                self = .string(value)
                return
            }
            if let value = try? container.decode(Bool.self) {
                self = .bool(value)
                return
            }
            if let value = try? container.decode(Double.self) {
                self = .double(value)
                return
            }
            self = .other(try container.decode(JSONValue.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .string(let value): try container.encode(value)
            case .bool(let value): try container.encode(value)
            case .double(let value): try container.encode(value)
            case .other(let value): try container.encode(value)
            }
        }
    }

    /// The GitHub App installation of the account that runs CI for the
    /// repository.
    public var installationId: Int
    /// `owner/name`.
    public var repoFullName: String
    /// The pipeline to run, as `GET /ci/manual` lists it
    /// (`.infrawrench/ci/deploy.yml`).
    public var pipelineFile: String
    /// A branch of the repository itself, whose head runs. The default branch
    /// when omitted.
    public var branch: String?
    /// Values for the pipeline's `on.manual.inputs`, by name: a string, a boolean
    /// or a number each. Inputs left out read as their defaults.
    public var inputs: [String: InputsValue]?

    public init(
        installationId: Int,
        repoFullName: String,
        pipelineFile: String,
        branch: String? = nil,
        inputs: [String: InputsValue]? = nil
    ) {
        self.installationId = installationId
        self.repoFullName = repoFullName
        self.pipelineFile = pipelineFile
        self.branch = branch
        self.inputs = inputs
    }
}
