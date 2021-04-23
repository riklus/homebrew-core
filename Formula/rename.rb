class Rename < Formula
  desc "Perl-powered file rename script with many helpful built-ins"
  homepage "http://plasmasturm.org/code/rename"
  url "https://github.com/ap/rename/archive/v1.601.tar.gz"
  sha256 "e8fd67b662b9deddfb6a19853652306f8694d7959dfac15538a9b67339c87af4"
  head "https://github.com/ap/rename.git"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "44f30a8e1f8b7e3c5f3a194285a2dac494389e837c490d8d8d7137c939fa4ee3"
    sha256 cellar: :any_skip_relocation, big_sur:       "099d8a8cf234a34790ab0004433c3c83f74ef353ad030f2be14086758d5e3b89"
    sha256 cellar: :any_skip_relocation, catalina:      "494aba9267348e401431cbcb1193df1c1138fda69d66aaa3c7ee229be51277fd"
    sha256 cellar: :any_skip_relocation, mojave:        "13c919a8edd4935b7e5462a172b8336c0425a627f76fd3aa72c652c35ea233cc"
    sha256 cellar: :any_skip_relocation, high_sierra:   "86b4b8a450b749f6fd84d86334d2d9f3a1c57fa3832f6e69d602369b4c6e5300"
    sha256 cellar: :any_skip_relocation, sierra:        "ed4a9403e533b143f8f1ee307035b28c995a13970c64ed7646719e12688ec7a0"
  end

  depends_on "pod2man" => :build

  uses_from_macos "perl"

  conflicts_with "util-linux", because: "both install `rename` binaries"

  def install
    system "#{Formula["pod2man"].opt_bin}/pod2man", "rename", "rename.1"
    bin.install "rename"
    man1.install "rename.1"
  end

  test do
    touch "foo.doc"
    system "#{bin}/rename -s .doc .txt *.d*"
    refute_predicate testpath/"foo.doc", :exist?
    assert_predicate testpath/"foo.txt", :exist?
  end
end
