class Space < Formula
  desc "Analyze and clean your disk space (powered by Rust)"
  homepage "https://github.com/emilevr/space"
  url "https://github.com/emilevr/space/archive/refs/tags/1.0.0.tar.gz"
  sha256 "7cd3bd5b4131d6b6f6140b009f8ef60bd665eb8ebd22ddfa6514cbac5ed2e7ff"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Space, the final frontier!", shell_output("#{bin}/space --help")
  end
end
