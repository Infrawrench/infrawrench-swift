/*
 * InfrawrenchSDK v1.3.0 | MIT | Copyright (c) 2026 Infrawrench LLC
 * https://github.com/Infrawrench/Infrawrench
 *
 * Generated from the Infrawrench API OpenAPI 3.1 spec (API version 1.3.0).
 *
 * DO NOT EDIT. Regenerate with:
 *   pnpm --filter @infrawrench/web generate:sdk
 *
 * Internal routes are absent by construction: the generator consumes the same
 * published spec that /openapi.json serves, which drops every operation
 * marked x-internal.
 */
import Foundation

/// `client.pages`
public final class PagesNamespace: Sendable {
    /// Shared request plumbing.
    let transport: ApiTransport

    init(transport: ApiTransport) {
        self.transport = transport
    }

    /// Raise an alert to the organization's on-call transports
    ///
    /// Fans an alert out over whatever the org has configured — Twilio SMS (and
    /// voice on request), mobile push, Slack channels, and Microsoft Teams
    /// webhooks — honouring each recipient's opt-ins. This is the same alert a
    /// workflow raises with `infra.page(...)`, for code that runs somewhere
    /// Infrawrench does not: a health check, a deploy script, a cron on a box.
    ///
    /// Repeat pages under the same `(source, key)` are **suppressed, not
    /// rejected**: a monitor that fires every minute pages once and then gets
    /// `200` with `suppressed: true` and the `retryAt` at which the key can page
    /// again. A page that reached nobody does not start a cooldown, so the next
    /// call tries again.
    ///
    /// Recipients opt in per channel under the same setting that covers workflow
    /// pages.
    ///
    /// _Requires permission: `pages:write`._
    ///
    /// POST /api/org/{orgId}/pages
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    public func create(
        orgId: String? = nil,
        body: PageRequest,
        options: RequestOptions? = nil
    ) async throws -> PageResponse {
        return try await transport.send(
            RequestSpec(
                method: "POST",
                path: "/api/org/{orgId}/pages",
                pathParameters: ["orgId": orgId?.parameterValue],
                body: AnyEncodable(body)
            ),
            options: options
        )
    }

    /// Clear a page key's cooldown
    ///
    /// Drops the cooldown for one `(source, key)` so the next page under it
    /// delivers immediately. Call it when the condition you alerted on recovers —
    /// the workflow equivalent is `infra.page.clear(key)`. Clearing a key that
    /// was never paged is not an error.
    ///
    /// _Requires permission: `pages:write`._
    ///
    /// DELETE /api/org/{orgId}/pages
    ///
    /// Raises on 400: Bad request
    ///
    /// - Parameter orgId: Organization id. Defaults to the `orgId` the client was
    /// created with.
    ///
    /// - Parameter source: Stable name for the system raising the page: letters,
    /// digits, `.`, `_` and `-`. It is the notification's sender, and it scopes
    /// the cooldown — two services paging under the same key never throttle each
    /// other.
    ///
    /// - Parameter key: Defaults to `default`.
    public func delete(
        orgId: String? = nil,
        source: String,
        key: String? = nil,
        options: RequestOptions? = nil
    ) async throws -> PageClearResponse {
        return try await transport.send(
            RequestSpec(
                method: "DELETE",
                path: "/api/org/{orgId}/pages",
                pathParameters: ["orgId": orgId?.parameterValue],
                query: [QueryParameter("source", source), QueryParameter("key", key)]
            ),
            options: options
        )
    }
}
