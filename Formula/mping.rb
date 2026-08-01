class Mping < Formula
  desc "Terminal UI for multi-host ping monitoring"
  homepage "https://github.com/dewab-org/mping"
  url "https://github.com/dewab-org/mping/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "8ae3fb41a2ad02fb9f281238e7bc47684d3a01b9ea0ea136b08ce80b3e12def8"
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
