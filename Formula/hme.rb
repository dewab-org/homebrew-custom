class Hme < Formula
  desc "Manage iCloud Hide My Email addresses from the command-line"
  homepage "https://github.com/dewab74/hide-my-email"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.4/hme_0.1.4_darwin_arm64.tar.gz"
      sha256 "685e25db7d5cd4a74e238b9e75c611187d8e68c07b6cda0c4428995b0e31b707"
    end
    on_intel do
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.4/hme_0.1.4_darwin_amd64.tar.gz"
      sha256 "93fac8dd718b436fea83864e2e81794788244e9ce1b867d8729215a256004f9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.4/hme_0.1.4_linux_arm64.tar.gz"
      sha256 "1799f3270893186e50deb590763bb71588a24ea389fe214b79a44f33a322ba56"
    end
    on_intel do
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.4/hme_0.1.4_linux_amd64.tar.gz"
      sha256 "6bbb25e3d99727e8fb0abdc84e510622081a6c14f515650943360115f1ac6b01"
    end
  end

  def install
    bin.install "hme"
    man1.install Dir["man/*.1"]
    generate_completions_from_executable(bin/"hme", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hme version")
    # With an empty config directory there is no session: exit status 3.
    ENV["HME_CONFIG_DIR"] = testpath.to_s
    ENV["HME_NO_KEYRING"] = "1"
    assert_match "not signed in", shell_output("#{bin}/hme status --offline 2>&1", 3)
    assert_path_exists man1/"hme.1"
  end
end
