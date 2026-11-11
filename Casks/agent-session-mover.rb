cask "agent-session-mover" do
  arch arm: "arm64", intel: "x64"

  version "0.1.11"
  sha256 arm:   "aed522dea1320727310edfe8377f587a930de6069959acf9e0343db38d34d9c6",
         intel: "4907b65256f4db55546a064235899ba34c594d193061e3589ff51b7a13fa5470"

  url "https://github.com/karlhsueh/agent-session-mover/releases/download/v#{version}/agent-session-mover-mac-#{arch}.dmg"
  name "Agent Session Mover"
  desc "Move Claude Code and Codex sessions between computers"
  homepage "https://karlhsueh.github.io/agent-session-mover/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Agent Session Mover.app"

  zap trash: [
    "~/Library/Application Support/agent-sessions",
    "~/Library/Caches/agent-session-mover-updater",
    "~/Library/Caches/agent-sessions-updater",
    "~/Library/Preferences/com.karlhsueh.agent-sessions.plist",
    "~/Library/Saved Application State/com.karlhsueh.agent-sessions.savedState",
  ]
end
