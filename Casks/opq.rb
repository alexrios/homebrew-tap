cask "opq" do
  name "opq"
  desc "AI-safe secrets CLI that keeps plaintext from callers and AI agents"
  homepage "https://github.com/alexrios/opq"
  version "1.2.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "opq"

  on_macos do
    on_intel do
      url "https://github.com/alexrios/opq/releases/download/v#{version}/opq_#{version}_darwin_amd64.tar.gz"
      sha256 "cb7d2b1dd49d551fa97e100de26bd193e097899aeab4c8e5e9c61bb2120bf79f"
    end
    on_arm do
      url "https://github.com/alexrios/opq/releases/download/v#{version}/opq_#{version}_darwin_arm64.tar.gz"
      sha256 "e8d5778393b93c26117ad416454b137e85f6cfd736aea5128fac6a3098c6dd41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alexrios/opq/releases/download/v#{version}/opq_#{version}_linux_amd64.tar.gz"
      sha256 "be1bb7c03c18febda7f1514b6d4e6f8a13e648d0b450555d5cdbc759e235c9b5"
    end
    on_arm do
      url "https://github.com/alexrios/opq/releases/download/v#{version}/opq_#{version}_linux_arm64.tar.gz"
      sha256 "377adea5b04bf979036e4cf00558c5d002410100859ea2e07a73c17123d8b877"
    end
  end

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/opq"]
    end
  end

  # No zap stanza required
end
