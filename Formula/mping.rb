class Mping < Formula
  desc "Terminal UI for multi-host ping monitoring"
  homepage "https://github.com/dewab-org/mping"
  url "https://github.com/dewab-org/mping/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "f816f934d3d480f776ad89d73eb5b68b0e898fc9e94e15ae8696d02d650eebb1"
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
