cask "agent-session-mover" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "d67169e0528c2b309ed6795e61cc9e9d8a807ae08de8787cb5d88b3d7a504b20",
         intel: "c94408f06275b4f8a9a223c7dd5b309d41b4258e3a826fe6cb3d472f1ea1f719"

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
