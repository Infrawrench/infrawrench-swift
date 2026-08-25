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

public struct CustomGraphCheckResult: Codable, Hashable, Sendable {
    public struct Diagnostic: Codable, Hashable, Sendable {
        public var line: Int
        public var column: Int
        public var code: Int
        public var category: String
        public var message: String

        public init(
            line: Int,
            column: Int,
            code: Int,
            category: String,
            message: String
        ) {
            self.line = line
            self.column = column
            self.code = code
            self.category = category
            self.message = message
        }
    }

    public var diagnostics: [Diagnostic]
    public var hasErrors: Bool
    public var degraded: Bool

    public init(
        diagnostics: [Diagnostic],
        hasErrors: Bool,
        degraded: Bool
    ) {
        self.diagnostics = diagnostics
        self.hasErrors = hasErrors
        self.degraded = degraded
    }
}
