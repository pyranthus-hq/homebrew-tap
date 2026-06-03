cask "mora" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.0"

  on_arm do
    sha256 "c397c7936b56a59242e002ed4416e0ecb255fc64b98f694c3b1f16929d880eec"
  end
  on_intel do
    sha256 "e4751ccfc2a014ab101931445012bf3c019643bbc499816d17cffa3f16ac51b4"
  end

  url "https://github.com/pyranthus-hq/mora/releases/download/v#{version}/mora_#{version}_darwin_#{arch}.tar.gz"
  name "mora"
  desc "Local-first, agent-agnostic memory CLI"
  homepage "https://github.com/pyranthus-hq/mora"

  binary "mora"

  # The binary is unsigned; strip the Gatekeeper quarantine xattr on install so
  # `mora` opens cleanly instead of "cannot be opened because Apple cannot check it".
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/mora"]
  end
end
