#!/bin/bash

CLAUDE_MD="CLAUDE.md"

# Create CLAUDE.md if it doesn't exist
touch "$CLAUDE_MD"

add_context() {
    local context_ref="$1"
    grep -qxF "$context_ref" "$CLAUDE_MD" || echo "$context_ref" >> "$CLAUDE_MD"
}

# --- Branch-based context ---
branch=$(git branch --show-current 2>/dev/null)

case "$branch" in
    "feature/auth-"*)
        add_context "@./context/auth-system.md"
        ;;
    "feature/payment-"*)
        add_context "@./context/payment-flow.md"
        ;;
    "hotfix/"*)
        add_context "@./context/production-hotfix.md"
        ;;
esac

# --- Query-based context ---
user_input=$(jq -r '.prompt // ""')

if [[ -n "$user_input" ]]; then
    if [[ $user_input == *"database"* || $user_input == *"migration"* ]]; then
        add_context "@./context/database-context.md"
    elif [[ $user_input == *"API"* || $user_input == *"endpoint"* ]]; then
        add_context "@./context/api-context.md"
    elif [[ $user_input == *"frontend"* || $user_input == *"component"* ]]; then
        add_context "@./context/frontend-context.md"
    fi
fi