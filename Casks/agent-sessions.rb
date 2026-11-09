cask "agent-sessions" do
  version "0.1.4"
  sha256 "df1637e7ecc90b604002030944ac5ef744707a972af8403b2a48a99d59e71c0d"

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
