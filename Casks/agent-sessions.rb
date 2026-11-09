cask "agent-sessions" do
  version "0.1.1"
  sha256 "9ab9e60ebb7c69215f720d6e26e6ce2a1b40e39f96db1dde9592082cb8ef7719"

  url "https://github.com/karlhsueh/agent-sessions/releases/download/v#{version}/agent-sessions-mac-arm64.dmg"
  name "Agent Sessions"
  desc "Move Claude Code and Codex sessions between computers"
  homepage "https://karlhsueh.github.io/agent-sessions/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Agent Sessions.app"

  zap trash: [
    "~/Library/Application Support/agent-sessions",
    "~/Library/Preferences/com.karlhsueh.agent-sessions.plist",
    "~/Library/Saved Application State/com.karlhsueh.agent-sessions.savedState",
  ]
end
