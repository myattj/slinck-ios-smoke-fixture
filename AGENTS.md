# Slinck demo requirements

For every change intended for the Slinck demo:

1. Commit and push the exact change before remote execution.
2. Use the governed Slinck gateway/MCP flow, pinned to the full commit SHA.
3. Use the approved source context exactly: GitHub repository
   `myattj/slinck-ios-smoke-fixture`, ref `refs/heads/main`, persistent
   workspace, and no network, credentials, signing, or secrets.
4. Require a successful remote build and full XCTest run before reporting the
   app ready. Do not substitute a local CLI run for remote validation.
5. Smoke-validate the installed remote app UI after a successful build.
6. Never tap a demo UI button unless the user explicitly commands that tap in
   the current conversation.
7. If the gateway rejects an allowed operation, report it as a gateway/policy
   issue and do not claim the operation passed.
