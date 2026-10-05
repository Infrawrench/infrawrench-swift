/*
 * InfrawrenchSDK v1.63.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.63.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct AiRequestLogLocation: Codable, Hashable, Sendable {
    public var id: String
    public var label: String
    public var detail: String?
    public var location: [String: String]
    public var recommended: Bool?

    public init(
        id: String,
        label: String,
        detail: String? = nil,
        location: [String: String],
        recommended: Bool? = nil
    ) {
        self.id = id
        self.label = label
        self.detail = detail
        self.location = location
        self.recommended = recommended
    }
}
