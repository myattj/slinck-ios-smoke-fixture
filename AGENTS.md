# Slinck demo requirements

For every change intended for the Slinck demo:

1. Commit and push the exact change before remote execution.
2. Use the governed Slinck gateway/MCP flow, pinned to the full commit SHA.
3. Use the approved source context exactly: GitHub repository
   `myattj/slinck-ios-smoke-fixture`, ref `refs/heads/main`, persistent
   workspace, and no network, credentials, signing, or secrets.
4. Do not run XCTest or any other test command as part of this demo unless the
   user explicitly requests it in the current conversation. Do not substitute
   a local CLI run for remote validation.
5. Smoke-validate the installed remote app UI after a successful build when
   the user requests that validation.
6. Never tap a demo UI button unless the user explicitly commands that tap in
   the current conversation.
7. If the gateway rejects an allowed operation, report it as a gateway/policy
   issue and do not claim the operation passed.
8. For `create_session`, use the live MCP schema: express the access policy
   with enum fields (for example `network: "none"`,
   `source_credentials: "none"`, `signing: "none"`) rather than booleans.
   This demo's gateway scope allows no isolation capabilities, so do not request
   `uid_sandboxed`; it is denied as
   `unsandboxed_gateway_preview_scope_denied`. If the native MCP wrapper reports
   `Invalid tools/call parameters`, check the gateway's live `tools/list` schema
   before retrying through the live gateway; do not weaken the approved source
   or required access constraints.
9. The native MCP wrapper can reject a schema-valid `create_session` or iOS
   tool request with `Invalid tools/call parameters`. Treat this as a wrapper
   issue: use the live gateway schema and direct governed MCP call with the
   same source and access constraints.
10. The Unsandboxed Gateway preview scope rejects `artifact_visibility` outside
    its configured demo scope. If project-visible artifacts are denied with
    `unsandboxed_gateway_preview_scope_denied`, retry with
    `artifact_visibility: "private"`; do not broaden the requested source,
    network, credentials, signing, secrets, or isolation permissions.

## Demo conduct

- Lead with the current outcome: clearly distinguish `queued`, `running`,
  `succeeded`, and `failed`. Never call a queued operation successful.
- Before each external action, state its purpose in one short sentence. Report
  the relevant Slinck session or tool-call ID afterward, without exposing
  tokens, credentials, or other sensitive values.
- Keep the demo narrative concrete: name the full commit SHA, approved GitHub
  source, persistent workspace, and constrained access policy when creating a
  session. Describe private artifacts as a gateway-scope requirement, not as a
  workaround.
- Use this remote flow in order: commit and push, obtain the live MCP schema,
  create a governed session pinned to the commit, build, boot a simulator,
  install, launch, then inspect or screenshot the app. Run tests only when the
  user has explicitly requested them.
- For UI interaction, inspect first and summarize the available controls. Do
  not tap a button until the user explicitly names the button to tap in the
  current conversation; do not type text or swipe unless the user requests it.
- When the native wrapper rejects valid parameters, use the live gateway call.
  When the gateway rejects a policy setting, identify the policy issue, keep
  the required source and access constraints intact, and make only the
  documented scope-compatible adjustment.
- Keep updates brief, factual, and calm. On a build or gateway failure, state
  what failed, the durable ID, what was not attempted, and the next safe action;
  do not claim the app is ready until the requested remote checks have passed.
