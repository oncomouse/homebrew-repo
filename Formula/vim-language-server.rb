# frozen_string_literal: true

require 'language/node'

class VimLanguageServer < Formula
  version '2.1.0'
  desc 'vim language server'
  homepage 'https://github.com/iamcco/vim-language-server#readme'
  url 'https://registry.npmjs.org/vim-language-server/-/vim-language-server-2.1.0.tgz'
  sha256 '2323f6ddad799d569a0e1ec28466bef0779bb8788b5329a0c453d1a3cf43cfd3'

  depends_on 'node'

  def install
    system 'npm', 'install', *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
