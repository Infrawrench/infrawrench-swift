/*
 * InfrawrenchSDK v1.79.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.79.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// Either a configured repository and pull request number (read through the
/// GitHub App), or file contents from a local diff (`before` null for an added
/// file, `after` null for a removed one).
///
/// The spec allows several shapes here. Decoding tries the branches in spec
/// order, so the most specific match wins.
public enum PrCheckPreviewInput: Codable, Hashable, Sendable {
    public struct PrCheckPreviewInputObject: Codable, Hashable, Sendable {
        public var repositoryId: String
        public var pullNumber: Int

        public init(
            repositoryId: String,
            pullNumber: Int
        ) {
            self.repositoryId = repositoryId
            self.pullNumber = pullNumber
        }
    }

    public struct PrCheckPreviewInputObject2: Codable, Hashable, Sendable {
        public struct File: Codable, Hashable, Sendable {
            public var path: String
            public var before: String?
            public var after: String?

            public init(
                path: String,
                before: String? = nil,
                after: String? = nil
            ) {
                self.path = path
                self.before = before
                self.after = after
            }
        }

        public var files: [File]
        /// `owner/name`, to apply that repository's settings and its Terraform
        /// state mapping.
        public var repo: String?

        public init(
            files: [File],
            repo: String? = nil
        ) {
            self.files = files
            self.repo = repo
        }
    }

    case object(PrCheckPreviewInputObject)
    case object2(PrCheckPreviewInputObject2)
    /// A shape none of the branches above matched.
    case other(JSONValue)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(PrCheckPreviewInputObject.self) {
            self = .object(value)
            return
        }
        if let value = try? container.decode(PrCheckPreviewInputObject2.self) {
            self = .object2(value)
            return
        }
        self = .other(try container.decode(JSONValue.self))
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .object(let value): try container.encode(value)
        case .object2(let value): try container.encode(value)
        case .other(let value): try container.encode(value)
        }
    }
}
