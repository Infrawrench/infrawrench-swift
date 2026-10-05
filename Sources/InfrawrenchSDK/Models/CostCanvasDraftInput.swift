/*
 * InfrawrenchSDK v1.68.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.68.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct CostCanvasDraftInput: Codable, Hashable, Sendable {
    /// What the report should show, in plain words.
    public var prompt: String
    public var name: String?
    /// A chat model id; the chat default when absent.
    public var model: String?

    public init(
        prompt: String,
        name: String? = nil,
        model: String? = nil
    ) {
        self.prompt = prompt
        self.name = name
        self.model = model
    }
}
