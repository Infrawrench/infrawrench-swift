/*
 * InfrawrenchSDK v1.100.0 | MIT | Copyright (c) 2026 Infrawrench Services, Inc.
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.100.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct WorkflowDiagnostic: Codable, Hashable, Sendable {
    public enum Category: RawRepresentable, Codable, Hashable, Sendable, ParameterValue {
        case error
        case warning
        case suggestion
        case message
        /// A value the API added after this SDK was generated. Kept rather than
        /// rejected, so a new server-side value cannot break decoding.
        case unrecognized(String)

        public init(rawValue: String) {
            switch rawValue {
            case "error": self = .error
            case "warning": self = .warning
            case "suggestion": self = .suggestion
            case "message": self = .message
            default: self = .unrecognized(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .error: return "error"
            case .warning: return "warning"
            case .suggestion: return "suggestion"
            case .message: return "message"
            case .unrecognized(let value): return value
            }
        }

        /// Every value the spec declares. `unrecognized` is deliberately absent.
        public static let allKnownCases: [Category] = [
            .error,
            .warning,
            .suggestion,
            .message,
        ]

        public init(from decoder: any Decoder) throws {
            self.init(rawValue: try decoder.singleValueContainer().decode(String.self))
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(rawValue)
        }
    }

    /// 1-based; 0 when unknown.
    public var line: Int
    /// 1-based; 0 when unknown.
    public var column: Int
    /// TypeScript diagnostic code.
    public var code: Int
    public var category: Category
    public var message: String

    public init(
        line: Int,
        column: Int,
        code: Int,
        category: Category,
        message: String
    ) {
        self.line = line
        self.column = column
        self.code = code
        self.category = category
        self.message = message
    }
}
