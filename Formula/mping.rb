class Mping < Formula
  desc "Terminal UI for multi-host ping monitoring"
  homepage "https://github.com/dewab-org/mping"
  url "https://github.com/dewab-org/mping/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "6488d6e6057fb1021900f79d10b675e1f1448668d5f650e289b06b416d93351c"
  license :cannot_represent
  head "https://github.com/dewab-org/mping.git", branch: "main"

  depends_on "go" => :build

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    system "go", "build", *std_go_args(output: bin/"mping"), "./cmd/mping"

    (pkgshare/"themes").install Dir["themes/*.theme"]
    man1.install "doc/mping.1"
  end

  test do
    assert_match "mping v#{version}", shell_output("#{bin}/mping --version")
  end
end
