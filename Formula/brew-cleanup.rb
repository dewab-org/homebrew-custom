class BrewCleanup < Formula
  include Language::Python::Shebang

  desc "Interactive Homebrew package removal with history and undo"
  homepage "https://github.com/dewab74/brew-cleanup"
  url "https://github.com/dewab74/brew-cleanup/releases/download/v0.1.0/brew-cleanup-0.1.0.tar.gz"
  sha256 "3a7d6e78c028279f46888be8b0117146affbf7f2a322319eb8763da26d74683a"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "python@3.13"

  def install
    libexec.install Dir["*.py"]
    rewrite_shebang detected_python_shebang, libexec/"brew_cleanup.py"
    bin.install_symlink libexec/"brew_cleanup.py" => "brew-cleanup"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/brew-cleanup --version")
    assert_match "--theme", shell_output("#{bin}/brew-cleanup --help")
    ENV["XDG_STATE_HOME"] = testpath.to_s
    assert_match "No history yet", shell_output("#{bin}/brew-cleanup history")
  end
end
