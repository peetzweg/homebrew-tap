class Papr < Formula
  include Language::Python::Virtualenv

  desc "Command line tool to generate empty calendar templates to print"
  homepage "https://peet.sh/"
  url "https://github.com/peetzweg/papr/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2d39b9a75612487a119a3926a96a2182d8bea7d9e9327c8b67e70970d1c52cc7"
  license "MIT"

  depends_on "pygobject3"
  depends_on "python@3.12"

  resource "pycairo" do
    url "https://files.pythonhosted.org/packages/22/d9/1728840a22a4ef8a8f479b9156aa2943cd98c3907accd3849fb0d5f82bfd/pycairo-1.29.0.tar.gz"
    sha256 "f3f7fde97325cae80224c09f12564ef58d0d0f655da0e3b040f5807bd5bd3142"
  end

  resource "pygobject" do
    url "https://files.pythonhosted.org/packages/d3/a5/68f883df1d8442e3b267cb92105a4b2f0de819bd64ac9981c2d680d3f49f/pygobject-3.54.5.tar.gz"
    sha256 "b6656f6348f5245606cf15ea48c384c7f05156c75ead206c1b246c80a22fb585"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"papr", "--help"
  end
end
