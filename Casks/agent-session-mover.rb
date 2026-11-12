cask "agent-session-mover" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "208bb4cfe54fa5426b6504678a27198bd5ce55e0892bf18011b55162b251a46b",
         intel: "2831f115f3d588cafb99dc8418c586dd56afd7b55eff73e8fbc51f8af682520d"

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
