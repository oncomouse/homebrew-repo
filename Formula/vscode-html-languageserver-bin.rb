# frozen_string_literal: true

require 'language/node'

class HtmlLanguageServerBin < Formula
  version '1.4.0'
  desc 'Binary version published on npm of vscode-html-languageserver extracted from VSCode tree'
  homepage 'https://github.com/vscode-langservers/vscode-html-languageserver-bin#readme'
  url 'https://registry.npmjs.org/vscode-html-languageserver-bin/-/vscode-html-languageserver-bin-1.4.0.tgz'
  sha256 '7deafc244e966ee3aeb61fc098be7885b4226644'

  plist_options startup: true

  depends_on 'node'

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
              <string>/usr/local/bin/node</string>
              <string>/usr/local/bin/html-languageserver</string>
              <string>--socket=2090</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>StandardErrorPath</key>
          <string>/tmp/javascript-typescript-langserver.stderr</string>
          <key>StandardOutPath</key>
          <string>/tmp/javascript-typescript-langserver.stdout</string>
      </dict>
      </plist>
    EOS
  end

  def install
    system 'npm', 'install', *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
