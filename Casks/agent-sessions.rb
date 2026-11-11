cask "agent-sessions" do
  arch arm: "arm64", intel: "x64"

  version "0.1.8"
  sha256 arm:   "42e914b7ca6c5ccd7e6bad410cb9959ca59525c18611b97349125dcf93f2d239",
         intel: "0cc90ade59b09aa94cc2906b6252bff6ee002d032977cb61b10ec2ead56e73be"

  url "https://github.com/karlhsueh/agent-sessions/releases/download/v#{version}/agent-sessions-mac-#{arch}.dmg"
  name "Agent Sessions"
  desc "Move Claude Code and Codex sessions between computers"
  homepage "https://karlhsueh.github.io/agent-sessions/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Agent Sessions.app"

  zap trash: [
    "~/Library/Application Support/agent-sessions",
    "~/Library/Caches/agent-sessions-updater",
    "~/Library/Preferences/com.karlhsueh.agent-sessions.plist",
    "~/Library/Saved Application State/com.karlhsueh.agent-sessions.savedState",
  ]
end
