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
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.3/hme_0.1.3_darwin_arm64.tar.gz"
      sha256 "f561a5472d50c3184d58b3b5fdc942c261ac137089723e2c9e15cf22f150a47a"
    end
    on_intel do
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.3/hme_0.1.3_darwin_amd64.tar.gz"
      sha256 "67586905a3d7f4e3aca42af18fef6b47b191c033a9417da925fa85bac455f820"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.3/hme_0.1.3_linux_arm64.tar.gz"
      sha256 "10b48e7e49bb25b1c549c96a556a944c8390a80461ad4de86646336152bb69b8"
    end
    on_intel do
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.3/hme_0.1.3_linux_amd64.tar.gz"
      sha256 "8c602743bf97497b9f8fd9f02897d307d1bb2bf227bcaef926dffc1d0564f20d"
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
