#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "=== Claude 설정 복원 (bootstrap) ==="

mkdir -p "$CLAUDE_DIR"

if [ -d "$SCRIPT_DIR/agents" ]; then
  mkdir -p "$CLAUDE_DIR/agents"
  cp -r "$SCRIPT_DIR/agents/" "$CLAUDE_DIR/agents/"
  echo "✓ agents 복원됨"
fi

if [ -d "$SCRIPT_DIR/skills" ]; then
  mkdir -p "$CLAUDE_DIR/skills"
  cp -r "$SCRIPT_DIR/skills/" "$CLAUDE_DIR/skills/"
  echo "✓ skills 복원됨"
fi

if [ -f "$SCRIPT_DIR/CLAUDE.md" ]; then
  cp "$SCRIPT_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
  echo "✓ CLAUDE.md 복원됨"
fi

REPO_URL=$(cd "$SCRIPT_DIR" && git remote get-url origin 2>/dev/null || echo "")
if [ -n "$REPO_URL" ] && [ ! -f "$CLAUDE_DIR/sync-config.json" ]; then
  cat > "$CLAUDE_DIR/sync-config.json" << EOF
{
  "repo_url": "$REPO_URL"
}
EOF
  echo "✓ sync-config.json 생성됨 (repo: $REPO_URL)"
fi

if [ -f "$SCRIPT_DIR/plugins.json" ] || [ -f "$SCRIPT_DIR/mcp-servers.json" ]; then
  echo ""
  echo "=== 플러그인 및 MCP 서버 설치 ==="
  echo "plugins.json, mcp-servers.json에 기록된 항목을 설치하려면"
  echo "Claude Code에서 /sync-restore 를 실행하세요."
fi

echo ""
echo "=== 완료 ==="
echo "Claude Code를 시작하면 복원된 설정이 적용됩니다."
