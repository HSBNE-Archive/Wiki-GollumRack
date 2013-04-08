# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mustache"
  s.version = "0.99.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Wanstrath", "Magnus Holm", "Pieter van de Bruggen"]
  s.date = "2013-04-08"
  s.description = "Inspired by ctemplate, Mustache is a framework-agnostic way to render\nlogic-free views.\n\nAs ctemplates says, \"It emphasizes separating logic from presentation:\nit is impossible to embed application logic in this template\nlanguage.\n\nThink of Mustache as a replacement for your views. Instead of views\nconsisting of ERB or HAML with random helpers and arbitrary logic,\nyour views are broken into two parts: a Ruby class and an HTML\ntemplate.\n"
  s.email = "chris@ozmm.org"
  s.executables = ["mustache"]
  s.files = ["README.md", "Rakefile", "LICENSE", "lib/mustache", "lib/mustache/context.rb", "lib/mustache/generator.rb", "lib/mustache/parser.rb", "lib/mustache/settings.rb", "lib/mustache/sinatra.rb", "lib/mustache/template.rb", "lib/mustache/version.rb", "lib/mustache.rb", "lib/rack", "lib/rack/bug", "lib/rack/bug/panels", "lib/rack/bug/panels/mustache_panel", "lib/rack/bug/panels/mustache_panel/mustache_extension.rb", "lib/rack/bug/panels/mustache_panel/view.mustache", "lib/rack/bug/panels/mustache_panel.rb", "bin/mustache", "man/mustache.1", "man/mustache.1.html", "man/mustache.1.ron", "man/mustache.5", "man/mustache.5.html", "man/mustache.5.ron", "test/autoloading_test.rb", "test/fixtures", "test/fixtures/comments.mustache", "test/fixtures/comments.rb", "test/fixtures/complex_view.mustache", "test/fixtures/complex_view.rb", "test/fixtures/crazy_recursive.mustache", "test/fixtures/crazy_recursive.rb", "test/fixtures/delimiters.mustache", "test/fixtures/delimiters.rb", "test/fixtures/dot_notation.mustache", "test/fixtures/dot_notation.rb", "test/fixtures/double_section.mustache", "test/fixtures/double_section.rb", "test/fixtures/escaped.mustache", "test/fixtures/escaped.rb", "test/fixtures/inner_partial.mustache", "test/fixtures/inner_partial.txt", "test/fixtures/inverted_section.mustache", "test/fixtures/inverted_section.rb", "test/fixtures/lambda.mustache", "test/fixtures/lambda.rb", "test/fixtures/method_missing.rb", "test/fixtures/namespaced.mustache", "test/fixtures/namespaced.rb", "test/fixtures/nested_objects.mustache", "test/fixtures/nested_objects.rb", "test/fixtures/node.mustache", "test/fixtures/partial_with_module.mustache", "test/fixtures/partial_with_module.rb", "test/fixtures/passenger.conf", "test/fixtures/passenger.rb", "test/fixtures/recursive.mustache", "test/fixtures/recursive.rb", "test/fixtures/simple.mustache", "test/fixtures/simple.rb", "test/fixtures/template_partial.mustache", "test/fixtures/template_partial.rb", "test/fixtures/template_partial.txt", "test/fixtures/unescaped.mustache", "test/fixtures/unescaped.rb", "test/fixtures/utf8.mustache", "test/fixtures/utf8_partial.mustache", "test/helper.rb", "test/mustache_test.rb", "test/parser_test.rb", "test/partial_test.rb", "test/spec_test.rb", "test/template_test.rb"]
  s.homepage = "http://github.com/defunkt/mustache"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Mustache is a framework-agnostic way to render logic-free views."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
