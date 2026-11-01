# VS Code Suggestions and Formatting Flow

This document records the steps taken to configure as-you-type Copilot suggestions and save-time formatting for this workspace.

1. Clarified that “suggestions” meant inline completions while typing, not Copilot Chat guidance.
2. Kept the configuration workspace-specific in `.vscode/settings.json`.
3. Enabled the VS Code inline suggestion UI and GitHub Copilot for SQL and `jinja-sql`, while preserving the existing language associations and other workspace settings.
4. Enabled format-on-save globally and explicitly for `sql` and `jinja-sql`.
5. Validated that `.vscode/settings.json` parses as JSON.

Copilot completions still require the GitHub Copilot extension to be installed and signed in. Save-time formatting also requires a formatter that supports the document’s language mode; the settings enable formatting on save but do not install or select a formatter.
