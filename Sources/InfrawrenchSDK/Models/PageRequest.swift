/*
 * InfrawrenchSDK v1.22.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.22.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

public struct PageRequest: Codable, Hashable, Sendable {
    /// Stable name for the system raising the page: letters, digits, `.`, `_` and
    /// `-`. It is the notification's sender, and it scopes the cooldown — two
    /// services paging under the same key never throttle each other.
    public var source: String
    /// The alert text. Becomes the SMS and notification body.
    public var message: String
    /// Short headline for the notification. Defaults to `source`.
    public var title: String?
    /// Throttle key, `default` when unset. Pages sharing a key are suppressed
    /// while that key is in cooldown, so a per-object key (a host, a cluster id)
    /// alerts per object while the default key alerts once for the whole source.
    public var key: String?
    /// Minutes to suppress repeat pages under the same key. Defaults to 60; `0`
    /// sends every time.
    public var cooldownMinutes: Int?
    /// Also place a voice call to recipients who opted into voice. Off by default
    /// — reserve it for things worth waking someone up for.
    public var voice: Bool?

    public init(
        source: String,
        message: String,
        title: String? = nil,
        key: String? = nil,
        cooldownMinutes: Int? = nil,
        voice: Bool? = nil
    ) {
        self.source = source
        self.message = message
        self.title = title
        self.key = key
        self.cooldownMinutes = cooldownMinutes
        self.voice = voice
    }
}
