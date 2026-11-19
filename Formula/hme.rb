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
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.5/hme_0.1.5_darwin_arm64.tar.gz"
      sha256 "67061479207c8fdb804e5783602430eaaba6c8ee03607f26f7f952bb09d2d32e"
    end
    on_intel do
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.5/hme_0.1.5_darwin_amd64.tar.gz"
      sha256 "9428aecad57b2f5eaba02230b73296f803b9fdac017b12567eb14d6aeb4b93f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.5/hme_0.1.5_linux_arm64.tar.gz"
      sha256 "966fe3ba824d6f798157792151edb6ccb2e110e82b2e8bc91e486d482997ce06"
    end
    on_intel do
      url "https://github.com/dewab74/hide-my-email/releases/download/v0.1.5/hme_0.1.5_linux_amd64.tar.gz"
      sha256 "5f1206acbd2b2afad56b3fadaebf3d8d15b131dd65ad0057bc7d296d10bdcd23"
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
