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

  bottle do
    root_url "https://github.com/emilevr/homebrew-space/releases/download/space-1.0.0"
    sha256 cellar: :any_skip_relocation, ventura:      "7b48fb8054e09062f4bb7dd956b4a1c9a1fa0bac0bfa52e400e9fc8f81f19960"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "177a6db2fe7d4ee3a540d16d0466e43e2496460cde5524f3e24ef2337411375a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Space, the final frontier!", shell_output("#{bin}/space --help")
  end
end
