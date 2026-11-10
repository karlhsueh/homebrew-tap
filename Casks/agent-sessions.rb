cask "agent-sessions" do
  version "0.1.6"
  sha256 "483ce5f7f417e85126c08cbb47f6bb02875c26320cf2b7817529f0d1a46b0ef8"

  url "https://github.com/karlhsueh/agent-sessions/releases/download/v#{version}/agent-sessions-mac-arm64.dmg"
  name "Agent Sessions"
  desc "Move Claude Code and Codex sessions between computers"
  homepage "https://karlhsueh.github.io/agent-sessions/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Agent Sessions.app"

  zap trash: [
    "~/Library/Application Support/agent-sessions",
    "~/Library/Caches/agent-sessions-updater",
    "~/Library/Preferences/com.karlhsueh.agent-sessions.plist",
    "~/Library/Saved Application State/com.karlhsueh.agent-sessions.savedState",
  ]
end
